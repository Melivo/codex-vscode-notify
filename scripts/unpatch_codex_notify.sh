#!/usr/bin/env bash
set -euo pipefail

EXTENSIONS_DIR="${HOME}/.vscode/extensions"
PATTERN="openai.chatgpt-*-linux-x64/out/extension.js.bak"

find_backup_file() {
  shopt -s nullglob
  local matches=("${EXTENSIONS_DIR}"/${PATTERN})
  shopt -u nullglob

  if [[ ${#matches[@]} -eq 0 ]]; then
    echo "Kein Backup fuer die Codex-Erweiterung gefunden." >&2
    exit 1
  fi

  printf '%s\n' "${matches[@]}" | sort | tail -n 1
}

BACKUP_FILE="$(find_backup_file)"
EXTENSION_JS="${BACKUP_FILE%.bak}"

if [[ ! -f "${BACKUP_FILE}" ]]; then
  echo "Backup nicht gefunden: ${BACKUP_FILE}" >&2
  exit 1
fi

cp "${BACKUP_FILE}" "${EXTENSION_JS}"
rm -f "${BACKUP_FILE}"

echo "Patch entfernt: ${EXTENSION_JS}"
echo "VS Code / Code OSS danach einmal neu laden."
