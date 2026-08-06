# Workflows

Dieser Ordner enthält festgelegte Abläufe für wiederkehrende Aufträge an einen
KI-Assistenten. Die hier aufgeführten Formulierungen und eindeutig sinngleiche
Anfragen starten den jeweiligen Workflow.

## Bestätigte Befehle

| Benutzerbefehl | Workflow | Wirkung |
|---|---|---|
| `Wissen eintragen` | [wissen-eintragen.md](wissen-eintragen.md) | Eingangs- oder ausdrücklich benannte externe Quelldateien anhand von Zielprofilen vollständig verarbeiten; erfolgreiche Eingangsoriginale archivieren und externe Originale unverändert am bestehenden Ort belassen |
| `Was weiß ich über <Thema>?` | [wissen-abfragen.md](wissen-abfragen.md) | Ausschließlich den aktiven lokalen Wissensbestand zum Thema zusammenfassen |
| `Zeige mir den Originaleintrag zu <Thema>` | [originaleintrag-anzeigen.md](originaleintrag-anzeigen.md) | Eine aktive Datei vollständig und unverändert ausgeben und darunter ihren Pfad nennen |
| `Zeige mir alle Schlüssel oder Sicherheitssachen in der Datenbank an` | [sicherheit-auflisten.md](sicherheit-auflisten.md) | Ausschließlich Datei- und Ordnernamen im Sicherheitsbereich auflisten |
| `Prüfe die Wissensdatenbank` | [wissensdatenbank-pruefen.md](wissensdatenbank-pruefen.md) | Struktur, Metadaten, Links, Dubletten und sensible Angaben prüfen |
| `Commit` | [commit.md](commit.md) | Alle von Git sichtbaren Änderungen lokal committen; nur eine ausdrückliche Einschränkung begrenzt den Umfang |

## Abgrenzung

- Das bloße Ablegen von Dateien in `00_Eingang` startet keinen Workflow.
- Offene `KLAERUNGSBEDARF_*.md`-Arbeitsnotizen im Eingang werden gemeldet, aber
  nicht erneut als Wissensquellen importiert.
- Eine Wissensabfrage verändert keine Datei und verwendet weder Internet noch Archiv.
- Ein Originaleintrag wird ausschließlich aus dem aktiven Bestand gelesen; bei
  mehreren möglichen Dateien muss der Benutzer zuerst eine auswählen.
- Der Sicherheitsbereich ist eine Blackbox. Nur Namen dürfen aufgelistet werden;
  Inhalte und weitere Metadaten bleiben unberührt.
- Bei einer unklaren Zuordnung fragt der Assistent nach, bevor er einen
  schreibenden Workflow startet.

Neue Befehle werden erst nach Bestätigung des Benutzers in diese verbindliche
Übersicht aufgenommen.

## Gemeinsame Werkzeuge

- [Werkzeuge/wissenssuche.md](Werkzeuge/wissenssuche.md) legt für lesende
  Wissenssuchen eine stufenweise, Token-sparende Bereichsauswahl fest.
- [Werkzeuge/onedrive-zugang.md](Werkzeuge/onedrive-zugang.md) regelt den Zugriff
  auf die OneDrive-Stämme `Kilian – Linzer Technikum` und `Kilian – Pimminger`,
  einschließlich gesperrter Ordner und der erforderlichen Schreibfreigaben.
- [Werkzeuge/originaleintrag-anzeigen.ps1](Werkzeuge/originaleintrag-anzeigen.ps1)
  sucht aktive Einträge und erzeugt die unveränderte, ausgabefertige Darstellung.
- [Werkzeuge/git-commit.ps1](Werkzeuge/git-commit.ps1) übernimmt das sichere
  Vormerken, Prüfen und lokale Committen aller Änderungen oder einer ausdrücklich
  eingeschränkten Dateiliste.
