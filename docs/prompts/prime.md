# Prime

Du arbeitest im Repo `codex-vscode-notify` auf dem aktuellen Branch.

Bevor du irgendetwas tust:

1. Lies und befolge:
   - `docs/architecture.md`
   - `docs/architecture-rules.md`
   - `AGENTS.md`, falls vorhanden
2. Behandle `docs/architecture-rules.md` als nicht verhandelbar.
3. Wenn vorhanden und relevant, nutze ausserdem:
   - `docs/prompts/plan_feature.md`
   - `docs/prompts/implement_feature.md`
   - `docs/prompts/review.md`

## Session-Grounding

- `codex-vscode-notify` ist ein kleines lokales Helper-Repo.
- Das Repo patcht keine Produkte still im Hintergrund, sondern nur explizit auf Nutzeraufruf.
- Patch und Restore muessen rueckbaubar, defensiv und verstaendlich bleiben.

## Kerninvarianten

Du musst all das erhalten:

- kein Daemon- oder Agent-Framework-Verhalten
- expliziter Patch-/Restore-Workflow
- Backup vor Mutation
- klares Scheitern bei unbekannten Extension-Versionen oder fehlenden Hooks
- kleine, lesbare Skripte statt Magie
- konsistente Doku zwischen README, Skripten und Architekturdateien

## Arbeitsregeln

- bevorzuge kleine, explizite Aenderungen
- fuehre keine unnötige Infrastruktur ein
- vergroessere den Scope nicht ohne klaren Nutzen
- dokumentiere externe Annahmen explizit
- nutze gezielte Verifikation statt breiter Komplexitaet

## Standard-Startausgabe

Bestätige zu Beginn kurz:

1. dass du die Architekturdateien gelesen hast
2. welche Invarianten fuer die Aufgabe relevant sind
3. welche Dateien du zuerst pruefst
