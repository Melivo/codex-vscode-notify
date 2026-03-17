# Architecture

Die nicht verhandelbaren Invarianten dieses Repos stehen in [docs/architecture-rules.md](docs/architecture-rules.md).

## Zielbild

`codex-vscode-notify` ist ein kleines lokales Hilfs-Repo fuer einen rueckbaubaren Benachrichtigungs-Workaround fuer die installierte Codex-Erweiterung in VS Code / Code OSS.

Das Repo ist bewusst klein und direkt:

```text
Nutzer
  -> Patch-/Restore-Skript
    -> lokale Codex-Erweiterung
      -> bestehender turn/completed-Hook
        -> lokaler Linux-Benachrichtigungsbefehl
```

## Verantwortlichkeiten

### Dieses Repo

Das Repo kontrolliert:

- das Finden der lokalen Codex-Erweiterung
- das defensive Pruefen des erwarteten Hook-Snippets
- das Anwenden eines kleinen, expliziten Patches
- das Erstellen eines Backups
- das Rueckgaengigmachen des Patches
- die Dokumentation des Workflows

### Nicht Ziel dieses Repos

Dieses Repo kontrolliert nicht:

- die Codex-Erweiterung als Produkt
- die VS-Code- oder Code-OSS-Notification-Infrastruktur
- generische Extension-Patching-Frameworks
- laufende Hintergrundprozesse

## Orchestrierungsrichtung

Die beabsichtigte Richtung ist einfach und explizit:

```text
Dokumentierte Anweisung
  -> Skriptaufruf
  -> Zielpfad-Pruefung
  -> Hook-Pruefung
  -> Backup
  -> Mutation oder Restore
  -> klare Rueckmeldung an den Nutzer
```

## Kernprinzipien

- klein vor clever
- Backup vor Mutation
- Restore vor Feature-Ausbau
- explizites Scheitern vor stiller Unsicherheit
- lokale, rueckbaubare Aenderung statt tiefer Integration

## Aktuelle Bausteine

- `scripts/patch_codex_notify.sh`
- `scripts/unpatch_codex_notify.sh`
- `README.md`
- Architektur- und Prompt-Dokumente unter `docs/`

## Bewusst nicht implementiert

- automatischer Daemon
- Polling-Hintergrunddienst
- generischer Patch-Manager
- GUI
- Telemetrie
- Multi-Extension-Support als Framework
