# Workflows

Dieser Ordner enthält festgelegte Abläufe für wiederkehrende Aufträge an einen
KI-Assistenten. Die hier aufgeführten Formulierungen und eindeutig sinngleiche
Anfragen starten den jeweiligen Workflow.

## Bestätigte Befehle

| Benutzerbefehl | Workflow | Wirkung |
|---|---|---|
| `Wissen eintragen` | [wissen-eintragen.md](wissen-eintragen.md) | Dateien aus `00_Eingang` vollständig verarbeiten und erfolgreiche Originale archivieren |
| `Was weiß ich über <Thema>?` | [wissen-abfragen.md](wissen-abfragen.md) | Ausschließlich den aktiven lokalen Wissensbestand zum Thema zusammenfassen |
| `Gib mir alle Quellen von <Thema>` | [quellen-anzeigen.md](quellen-anzeigen.md) | Aktive Quellenangaben und zugehörige archivierte Originaldateien auflisten |
| `Prüfe die Wissensdatenbank` | [wissensdatenbank-pruefen.md](wissensdatenbank-pruefen.md) | Struktur, Metadaten, Links, Dubletten und sensible Angaben prüfen |

## Abgrenzung

- Das bloße Ablegen von Dateien in `00_Eingang` startet keinen Workflow.
- Eine Wissensabfrage verändert keine Datei und verwendet weder Internet noch Archiv.
- Eine Quellenabfrage darf das Archiv ausschließlich zur Quellenauflistung durchsuchen.
- Bei einer unklaren Zuordnung fragt der Assistent nach, bevor er einen
  schreibenden Workflow startet.

Neue Befehle werden erst nach Bestätigung des Benutzers in diese verbindliche
Übersicht aufgenommen.
