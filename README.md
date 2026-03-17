# codex-vscode-notify

Kleines lokales Hilfs-Repo fuer Desktop-Benachrichtigungen bei fertigen Codex-Durchlaeufen in VS Code / Code OSS unter Linux.

## Ziel

Die installierte Codex-Erweiterung (`openai.chatgpt`) erzeugt intern bereits ein `turn/completed`-Event, bindet dieses in der aktuellen Installation aber nicht sichtbar an eine Linux-Desktopbenachrichtigung.

Dieses Repo liefert einen kleinen, rueckbaubaren Workaround:

- vorhandene Codex-Erweiterung finden
- lokalen Patch fuer einen verfuegbaren Linux-Benachrichtigungsbefehl auf den bestehenden `turn/completed`-Hook anwenden
- Patch bei Bedarf wieder sauber entfernen

## Voraussetzungen

- Linux mit `notify-send` oder `kdialog`
- installierte VS Code / Code OSS Codex-Erweiterung `openai.chatgpt`
- Schreibrechte auf das lokale Extension-Verzeichnis

## Nutzung

Patch anwenden:

```bash
bash scripts/patch_codex_notify.sh
```

Patch entfernen:

```bash
bash scripts/unpatch_codex_notify.sh
```

## Verhalten

Der Patch haengt eine Desktopbenachrichtigung an fertige Codex-Turns:

- Titel: `Codex`
- Text: `Durchlauf fertig, bereit fuer neue Eingaben`
- Befehl: bevorzugt `notify-send`, faellt lokal sonst auf `kdialog` zurueck und schreibt den gewaehlten absoluten Pfad in den Patch

Die Benachrichtigung wird nur gesendet, wenn das VS Code / Code OSS-Fenster gerade nicht fokussiert ist.

## Hinweis

Das ist bewusst ein lokaler Workaround fuer die installierte Extension, kein offizieller Support-Pfad der Erweiterung selbst. Nach einem Extension-Update kann es noetig sein, den Patch erneut anzuwenden.
