# AGENTS

Diese Datei definiert die Standard-Arbeitskonvention fuer Codex in `codex-vscode-notify`.

## Prioritaetsreihenfolge

Wenn diese Dokumente vorhanden sind, gelten sie in dieser Reihenfolge:

1. `docs/architecture-rules.md`
2. `docs/architecture.md`
3. `AGENTS.md`
4. aufgabenspezifische Prompt-Dateien unter `docs/prompts/`

Bei Konflikten haben die Architekturregeln Vorrang.

## Standard-Arbeitsmodus

- Standard: direkt ohne Sub-Agents arbeiten.
- Wenn der Nutzer `nutze deine agenten`, `nutze die 3 agenten` oder etwas Gleichwertiges sagt, nutze dieses Standard-Setup mit 3 Rollen:
  - Architecture / Implementation Agent
  - QA / Invariants Agent
  - Docs / Prompt Hygiene Agent
- Verwende dieselbe 3-Rollen-Struktur wieder, sofern der Nutzer keine andere Aufteilung verlangt.
- Erfinde keine weiteren Agent-Rollen, sofern es dafuer keinen starken, aufgabenspezifischen Grund gibt.

## Verantwortlichkeiten der Agents

### 1. Architecture / Implementation Agent

- verantwortet Code- und Skriptaenderungen
- bewahrt die Repo-Invarianten fuer Patch-, Backup- und Restore-Verhalten
- arbeitet hauptsaechlich in:
  - `scripts/*`
  - `README.md`
  - `docs/*`

Muss durchsetzen:

- expliziter, rueckbaubarer Patch-Workflow
- keine stillen Massen-Aenderungen
- Backup vor Patch
- versionstolerante, defensive Skriptlogik

### 2. QA / Invariants Agent

- prueft auf Verstoesse gegen die Architekturregeln
- fokussiert auf versteckte Kopplung, Rueckbaubarkeit, Idempotenz und fehlende Sicherheitschecks

Muss explizit pruefen:

- kein Patch ohne Backup
- kein Restore ohne klaren Rueckweg
- keine zerstoererischen Dateizugriffe ausserhalb des klaren Ziels
- keine stillen Annahmen ueber Extension-Versionen
- keine unnötige Komplexitaet

### 3. Docs / Prompt Hygiene Agent

- aktualisiert Doku, wenn sich Workflow oder Architekturformulierung aendern
- haelt Prompt-Templates an die Repo-Praxis angepasst

Muss explizit pruefen:

- Doku passt noch zum Patch-/Unpatch-Verhalten
- Prompt-Templates bleiben aktuell
- fehlende Prompt-Dateien werden explizit benannt

## Repo-spezifische Arbeitsregeln

- Behandle `docs/architecture-rules.md` als nicht verhandelbar.
- Bevorzuge kleine, explizite, rueckbaubare Aenderungen.
- Dieses Repo ist ein lokaler Helper, kein Framework und kein Daemon.
- Bevorzuge Shell-Skripte mit klaren Fehlermeldungen statt versteckter Magie.
- Patch-Verhalten muss defensiv gegen unbekannte Extension-Versionen sein.
- Restore muss einfach und verstaendlich bleiben.
- Fuehre keine unnötigen Hintergrundprozesse, keine Telemetrie und keine komplexe Laufzeitarchitektur ein.

## Test-Workflow

- Bevorzuge Red/Green-TDD, wenn Verhaltensaenderungen an Skripten oder Patchlogik vorgenommen werden.
- Wenn praktikabel, schreibe zuerst einen kleinen gezielten Test oder reproduzierbaren Red-Check.
- Wenn TDD hier kein guter Fit ist, nutze die schmalste sinnvolle Verifikation, z. B. `bash -n`, Dry-Run-Checks oder Fixture-basierte Dateitests.

## Push-Policy

- Nach Abschluss jeder angeforderten Aenderung sofort committen.
- Wenn ein `origin`-Remote konfiguriert ist, direkt danach nach `origin/main` pushen, sofern der Nutzer nichts anderes sagt.
- Wenn kein Remote existiert, das explizit benennen statt stillschweigend zu scheitern.
- Halte Commit-Messages praezise und eng auf die Aenderung begrenzt.
