#!/usr/bin/env bash
set -euo pipefail

EXTENSIONS_DIR="${HOME}/.vscode/extensions"
PATTERN="openai.chatgpt-*-linux-x64/out/extension.js"
MESSAGE='Durchlauf fertig, bereit fuer neue Eingaben'
OLD='Y.method==="turn/completed"&&E.emit("turnComplete")'

resolve_notifier_patch() {
  if command -v notify-send >/dev/null 2>&1; then
    printf '%s' 'Y.method==="turn/completed"&&(E.emit("turnComplete"),ot.window.state.focused||fv.execFile("notify-send",["Codex","Durchlauf fertig, bereit fuer neue Eingaben"]))'
    return
  fi

  if command -v kdialog >/dev/null 2>&1; then
    printf '%s' 'Y.method==="turn/completed"&&(E.emit("turnComplete"),ot.window.state.focused||fv.execFile("kdialog",["--title","Codex","--passivepopup","Durchlauf fertig, bereit fuer neue Eingaben","5"]))'
    return
  fi

  echo "Kein unterstuetzter Benachrichtigungsbefehl gefunden. Erwartet wird notify-send oder kdialog." >&2
  exit 1
}

find_extension_file() {
  shopt -s nullglob
  local matches=("${EXTENSIONS_DIR}"/${PATTERN})
  shopt -u nullglob

  if [[ ${#matches[@]} -eq 0 ]]; then
    echo "Keine passende Codex-Erweiterung unter ${EXTENSIONS_DIR} gefunden." >&2
    exit 1
  fi

  printf '%s\n' "${matches[@]}" | sort | tail -n 1
}

EXTENSION_JS="$(find_extension_file)"
BACKUP_FILE="${EXTENSION_JS}.bak"
NEW="$(resolve_notifier_patch)"

if [[ ! -f "${EXTENSION_JS}" ]]; then
  echo "Datei nicht gefunden: ${EXTENSION_JS}" >&2
  exit 1
fi

if grep -Fq "${NEW}" "${EXTENSION_JS}"; then
  echo "Patch ist bereits aktiv: ${EXTENSION_JS}"
  exit 0
fi

if ! grep -Fq "${OLD}" "${EXTENSION_JS}"; then
  if [[ -f "${BACKUP_FILE}" ]]; then
    cp "${BACKUP_FILE}" "${EXTENSION_JS}"
  fi
fi

if ! grep -Fq "${OLD}" "${EXTENSION_JS}"; then
  echo "Erwarteter Hook wurde nicht gefunden. Extension-Version hat sich vermutlich geaendert." >&2
  exit 1
fi

cp "${EXTENSION_JS}" "${BACKUP_FILE}"
python3 - <<'PY' "${EXTENSION_JS}" "${OLD}" "${NEW}"
from pathlib import Path
import sys

path = Path(sys.argv[1])
old = sys.argv[2]
new = sys.argv[3]
text = path.read_text()
if old not in text:
    raise SystemExit("Erwarteter Hook wurde nicht gefunden.")
path.write_text(text.replace(old, new, 1))
PY

echo "Patch angewendet: ${EXTENSION_JS}"
echo "Backup erstellt: ${BACKUP_FILE}"
echo "Benachrichtigungstext: ${MESSAGE}"
if command -v notify-send >/dev/null 2>&1; then
  echo "Benachrichtigungsbefehl: notify-send"
elif command -v kdialog >/dev/null 2>&1; then
  echo "Benachrichtigungsbefehl: kdialog"
fi
echo "Benachrichtigung nur, wenn VS Code / Code OSS gerade nicht fokussiert ist."
echo "VS Code / Code OSS danach einmal neu laden."
