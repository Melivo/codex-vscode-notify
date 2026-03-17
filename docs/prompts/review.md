# Review

Nutze diese Vorlage, wenn du Code oder Skripte in `codex-vscode-notify` reviewst.

Bevor du reviewst, lies:

- `docs/architecture.md`
- `docs/architecture-rules.md`
- die geaenderten Dateien
- die relevanten Verifikationsschritte

Behandle die Architekturregeln als bindende Review-Kriterien.

## Review-Prioritaeten

Priorisiere Findings in dieser Reihenfolge:

1. Korrektheitsfehler und Regressionen
2. Verstoesse gegen Architekturregeln
3. Verlust von Rueckbaubarkeit oder Idempotenz
4. versteckte Kopplung und unklare Umweltannahmen
5. fehlende oder schwache Verifikation
6. Doku-Drift

## Repo-spezifische Checks

Pruefe explizit:

- kein Patch ohne Backup
- kein Restore ohne klaren Rueckweg
- kein stilles Scheitern bei unbekanntem Zielzustand
- keine Mutation ausserhalb klarer Zielpfade
- keine unnötige Daemon-, Framework- oder Hintergrundlogik
- keine falsche Dokumentation ueber das tatsaechliche Verhalten
- bei Verhaltensaenderungen: ob es einen kleinen gezielten Test oder reproduzierbaren Check gibt

## Ausgabeformat

Findings zuerst, nach Schweregrad sortiert.

Zu jedem Finding gehoeren:

- Schweregrad
- Dateireferenz
- das konkrete Problem
- warum es in dieser Architektur relevant ist

Wenn es keine Findings gibt, sage exakt:

`no findings`

Danach optional:

- verbleibende Risiken
- fehlende Tests
- kleine Anschlussarbeiten
