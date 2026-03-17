# Architecture Rules

Dieses Dokument definiert die nicht verhandelbaren Architektur-Invarianten von `codex-vscode-notify`.

Diese Regeln duerfen nicht verletzt werden.

## 1. Lokaler Helper statt Laufzeitsystem

- Das Repo ist ein kleiner lokaler Helper fuer Patch- und Restore-Aktionen.
- Es fuehrt kein dauerhaftes Hintergrundsystem ein.
- Es fuehrt keine neue Agent-, Server- oder Daemon-Laufzeit ein.

## 2. Expliziter Patch-Workflow

- Patch und Restore muessen als explizite, vom Nutzer gestartete Schritte sichtbar bleiben.
- Keine stillen Hintergrundaenderungen an installierten Erweiterungen.
- Keine implizite Selbstmodifikation ohne klaren Aufruf.

## 3. Backup vor Mutation

- Vor jeder Patch-Mutation an der installierten Extension muss ein Backup erstellt werden.
- Restore muss auf einem klaren Rueckweg basieren.
- Kein Patch ohne nachvollziehbare Rueckkehr zum Ausgangszustand.

## 4. Defensives Zielen auf lokale Installationen

- Skripte duerfen nur klar definierte Zielpfade anfassen.
- Wenn die erwartete Extension-Struktur oder der erwartete Hook nicht gefunden wird, muss hart fehlgeschlagen werden.
- Keine heuristischen Massen-Aenderungen ueber unklare Dateimengen.

## 5. Kleine, lesbare Skripte

- Shell-Skripte sollen klein, explizit und gut lesbar bleiben.
- Keine unnötige Abstraktion oder Framework-Schicht fuer einen einfachen Patch-Workflow.
- Fehlermeldungen muessen konkret und handlungsleitend sein.

## 6. Idempotenz und Rueckbaubarkeit

- Wiederholtes Anwenden des Patch-Skripts darf den Zustand nicht verschlechtern.
- Wiederholtes Restore darf keinen kaputten Zwischenzustand erzeugen.
- Der Nutzer muss jederzeit verstehen koennen, ob der Patch aktiv ist.

## 7. Keine versteckte Kopplung

- Repo-Doku, Skripte und Verhalten muessen dieselbe Wahrheit ausdruecken.
- Repo-Logik darf nicht auf unerklaerten Seiteneffekten der Umgebung beruhen.
- Externe Annahmen, z. B. ueber `notify-send` oder Extension-Pfade, muessen explizit dokumentiert sein.

## 8. Keine unnötige Ausweitung des Scopes

- Kein MCP
- kein RAG
- kein Agent-Framework
- kein allgemeines Plugin-System
- keine Parallelisierungslogik

## Refactor-Checkliste

Vor dem Merge jeder Aenderung pruefen:

- Bleibt der Patch-Workflow explizit?
- Gibt es weiter ein Backup vor Mutation?
- Bleibt Restore einfach und sicher?
- Scheitert das Skript sauber bei unbekannten Extension-Versionen?
- Wurde keine unnötige Komplexitaet eingefuehrt?

Wenn nein, neu entwerfen.
