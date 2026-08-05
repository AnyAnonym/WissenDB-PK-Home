# Workflows

Dieser Ordner enthält festgelegte Abläufe für wiederkehrende Aufträge an einen
KI-Assistenten. Die hier aufgeführten Formulierungen und eindeutig sinngleiche
Anfragen starten den jeweiligen Workflow.

## Bestätigte Befehle

| Benutzerbefehl | Workflow | Wirkung |
|---|---|---|
| `Wissen eintragen` | [wissen-eintragen.md](wissen-eintragen.md) | Dateien aus `00_Eingang` vollständig verarbeiten und erfolgreiche Originale archivieren |
| `Was weiß ich über <Thema>?` | [wissen-abfragen.md](wissen-abfragen.md) | Ausschließlich den aktiven lokalen Wissensbestand zum Thema zusammenfassen |
| `Zeige mir den Originaleintrag zu <Thema>` | [originaleintrag-anzeigen.md](originaleintrag-anzeigen.md) | Eine aktive Datei vollständig und unverändert ausgeben und darunter ihren Pfad nennen |
| `Prüfe die Wissensdatenbank` | [wissensdatenbank-pruefen.md](wissensdatenbank-pruefen.md) | Struktur, Metadaten, Links, Dubletten und sensible Angaben prüfen |

## Abgrenzung

- Das bloße Ablegen von Dateien in `00_Eingang` startet keinen Workflow.
- Eine Wissensabfrage verändert keine Datei und verwendet weder Internet noch Archiv.
- Ein Originaleintrag wird ausschließlich aus dem aktiven Bestand gelesen; bei
  mehreren möglichen Dateien muss der Benutzer zuerst eine auswählen.
- Bei einer unklaren Zuordnung fragt der Assistent nach, bevor er einen
  schreibenden Workflow startet.

Neue Befehle werden erst nach Bestätigung des Benutzers in diese verbindliche
Übersicht aufgenommen.
