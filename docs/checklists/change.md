# Change Checklist

Nutze diese Checkliste vor dem Merge einer Aenderung in `codex-vscode-notify`.

Dies ist eine operative Checkliste und ersetzt nicht `docs/architecture.md` oder `docs/architecture-rules.md`.

- Der Workflow bleibt explizit statt implizit im Hintergrund zu laufen.
- Vor Patch-Mutation existiert weiterhin ein Backup.
- Restore bleibt klar und einfach nachvollziehbar.
- Zielpfade und Hook-Snippets werden weiter defensiv geprueft.
- Die Aenderung fuehrt keine unnötige Runtime-Komplexitaet ein.
- README, Skripte und Architektur-Doku sagen dasselbe aus.
- Fuer geaendertes Verhalten wurde ein kleiner gezielter Check oder Test ausgefuehrt.
