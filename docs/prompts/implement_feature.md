# Implement Feature

Nutze diese Vorlage, wenn du bereit bist, eine Aenderung in `codex-vscode-notify` umzusetzen.

Bevor du irgendetwas tust, lies:

- `docs/architecture.md`
- `docs/architecture-rules.md`
- `AGENTS.md`
- alle direkt relevanten Implementierungsdateien

Behandle `docs/architecture-rules.md` als bindend.

## Auftrag

Implementiere die kleinste sichere Aenderung direkt in Skripten oder Doku.

Diese Vorlage ist auf die Umsetzungsphase ausgerichtet:

- bleibe nicht in der Planung stehen
- wenn der kleinste sichere Schritt noch nicht klar ist, nutze zuerst `docs/prompts/plan_feature.md`
- vergroessere den Scope nicht ohne klaren Bedarf
- bevorzuge explizite Shell-Logik und klare Fehlermeldungen
- halte Patch und Restore rueckbaubar

## Nicht verhandelbar

All das muss erhalten bleiben:

- kein Patch ohne Backup
- kein Restore ohne klaren Rueckweg
- kein stilles Scheitern bei unbekannten Versionen
- keine unnötige Laufzeitarchitektur
- keine versteckte Mutation ausserhalb des expliziten Zielpfads
- konsistente Doku zwischen Skripten und README

## Umsetzungsregeln

- mache die kleinste saubere Aenderung, die die Aufgabe loest
- halte Patch- und Restore-Logik lesbar
- dokumentiere alle neuen Umweltannahmen
- bevorzuge Red/Green-TDD oder einen kleinen reproduzierbaren Red-Check, wenn Verhalten geaendert wird
- wenn TDD nicht gut passt, nutze die schmalste sinnvolle Verifikation, z. B. `bash -n` oder Fixture-Checks

## Erforderlicher Workflow

1. Pruefe den aktuellen Ablauf in den relevanten Dateien.
2. Schreibe oder aktualisiere zuerst den kleinsten sinnvollen Check, wenn das Verhalten geaendert wird.
3. Bestaetige den Red-Zustand, falls praktikabel.
4. Implementiere die kleinste explizite Aenderung.
5. Fuehre gezielte Verifikation aus.
6. Halte die Doku synchron, wenn sich Verhalten oder Annahmen geaendert haben.

## Review-Checks

Pruefe vor dem Abschluss:

- bleibt der Workflow explizit und rueckbaubar?
- bleibt Backup vor Mutation garantiert?
- bleibt Restore klar und einfach?
- bleibt die Zielpfad- und Hook-Pruefung defensiv?
- wurde keine unnötige Komplexitaet eingefuehrt?

## Erforderliche Ausgabeform

Enthalten sein muessen:

- `Implemented`
- `Tests`
- `Risks`
- `Files`
- `Notes`
