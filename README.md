# WissenDB-PK-Home

Persönliche, Markdown-basierte Wissensdatenbank für die Zusammenarbeit mit
Codex, OpenCode und anderen KI-Assistenten.

## Schnellbefehle

| Befehl | Wirkung |
|---|---|
| `Wissen eintragen` | Verarbeitet die Dateien aus `00_Eingang`, übernimmt ihr Wissen und archiviert erfolgreiche Originale. |
| `Was weiß ich über <Thema>?` | Antwortet ausschließlich mit dem aktiven lokalen Wissensbestand. |
| `Gib mir alle Quellen von <Thema>` | Listet aktive Quellenangaben und die zugehörigen archivierten Originaldateien auf. |
| `Prüfe die Wissensdatenbank` | Prüft Struktur, Metadaten, Links, Dubletten und sensible Angaben. |

Die vollständigen und verbindlichen Abläufe stehen in
[80_Workflows/README.md](80_Workflows/README.md).

## Grundprinzipien

- `00_Eingang` ist eine Warteschlange. Das Ablegen einer Datei startet noch
  keinen Import.
- Aktive Wissenseinträge sind ohne ursprünglichen Chat, Eingangsdatei und
  Archivzugriff vollständig verständlich.
- Erfolgreich verarbeitete Originaldateien werden unverändert und mit
  Importprotokoll archiviert.
- Archivdateien ersetzen niemals eine vollständige Wissensbeschreibung. Nur der
  Quellenworkflow darf sie als Quellen aufführen.
- Widersprüche, offene Fragen und zeitabhängige Angaben werden sichtbar
  dokumentiert.
- Neue oder inhaltlich geänderte Wissenseinträge führen das Feld
  `Zuletzt geändert`.
- Formeln und Standardrechnungen werden nicht unnötig massenhaft dupliziert.
  Bedeutung, Voraussetzungen und Lösungsweg müssen trotzdem vollständig erklärt
  und nach Möglichkeit mit verlässlichen öffentlichen Quellen belegt werden.

## Bereiche

- `00_Eingang`: noch nicht verarbeitete Dateien
- `10_Wissen`: dauerhaftes Wissen nach Themen
- `20_Projekte`: Vorhaben mit Ziel, Status und nächstem Schritt
- `30_Anleitungen`: Schritt-für-Schritt-Anleitungen und Checklisten
- `40_Personen_und_Kontakte`: Personen, Firmen und Ansprechpartner
- `50_Dokumentation`: Geräte, Verträge und eigene Systeme
- `60_Quellen`: aktive Quellenlisten und bibliografische Angaben
- `70_Vorlagen`: Vorlagen für einheitliche Einträge
- `80_Workflows`: wiederkehrende KI-Aufträge und ihre Abläufe
- `90_Archiv`: unveränderte Originale und interne Importprotokolle

## Arbeitsanweisungen

KI-Assistenten lesen zuerst [AGENTS.md](AGENTS.md) und anschließend
[REGELN.md](REGELN.md). Schutzmuster für temporäre Dateien, lokale
Konfigurationen und Zugangsdaten stehen in [.gitignore](.gitignore).
