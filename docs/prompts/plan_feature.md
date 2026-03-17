# Plan Feature

Nutze diese Vorlage, wenn du eine Aenderung oder einen kleinen Refactor in `codex-vscode-notify` planst.

Bevor du planst, lies:

- `docs/architecture.md`
- `docs/architecture-rules.md`
- die direkt relevanten Implementierungsdateien

Behandle die Architekturregeln als bindend.

## Planungsziele

Erstelle einen Plan, der:

- den Patch-/Restore-Workflow explizit haelt
- Rueckbaubarkeit bewahrt
- den kleinsten sauberen Schritt bevorzugt
- keine unnötige Komplexitaet einführt
- defensive Fehlerpfade beibehält

## Planungs-Checkliste

1. Beschreibe das Problem in Repo-Begriffen.
2. Fasse das aktuelle Verhalten zusammen.
3. Benenne die Architektur-Invarianten, die die Aenderung begrenzen.
4. Benenne den kleinsten akzeptablen Schritt.
5. Trenne klar zwischen:
   - Nutzer-Workflow
   - Patch-/Restore-Logik
   - Backup-/Rueckweg
   - Umweltannahmen
   - Doku-/Prompt-Auswirkungen
6. Liste die betroffenen Dateien.
7. Liste die erforderlichen Tests oder Verifikationsschritte.
8. Liste explizite Nicht-Ziele.
9. Benenne Risiken, offene Fragen und Rueckrollpunkte.

## Erforderliche Ausgabeform

Halte den Plan kurz und konkret.

Enthalten sein muessen:

- `Problem`
- `Current State`
- `Constraints`
- `Proposed Change`
- `Files`
- `Tests`
- `Risks`
- `Out of Scope`

## Repo-spezifische Review-Fragen

Vor Abschluss des Plans beantworten:

- Bleibt der Workflow explizit?
- Bleibt Backup vor Mutation garantiert?
- Bleibt Restore einfach und eindeutig?
- Scheitert die Logik sauber bei unbekannten Extension-Versionen?
- Wird keine unnötige Laufzeit- oder Framework-Komplexitaet eingefuehrt?
