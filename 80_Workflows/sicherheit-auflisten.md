# Workflow: Sicherheitsdateien auflisten

## Auslöser

- `Zeige mir alle Schlüssel oder Sicherheitssachen in der Datenbank an`
- Eindeutig sinngleiche Aufforderungen, Schlüssel, Keys oder Sicherheitsdateien
  aufzulisten

## Zweck

Dem Benutzer ausschließlich die Namen der unter `Sicherheit` abgelegten Dateien
und Ordner zeigen. Der Sicherheitsbereich bleibt inhaltlich eine Blackbox.

## Ablauf

1. Lies vollständig `80_Workflows/Werkzeuge/sicherheitsdateien.md`.
2. Erfasse unter `Sicherheit` ausschließlich Datei- und Ordnernamen.
3. Gib die Namen als knappe relative Baumstruktur aus. Die Einrückung darf die
   Ordnerzuordnung zeigen.
4. Blende rein technische Strukturmarker wie `.gitkeep` aus.

## Verbote

- Keine Datei öffnen, einlesen, durchsuchen, parsen, rendern oder ausführen.
- Keine Vorschau, Zusammenfassung oder Inhaltsangabe erzeugen.
- Keine Dateigröße, Zeitstempel, Berechtigung, Prüfsumme oder sonstige Metadaten
  ermitteln oder ausgeben.
- Keine Datei umbenennen, verschieben, kopieren, verändern oder löschen.
- Keine Dateiinhalte in Git, Archiv, aktive Einträge, Protokolle oder Antworten
  übernehmen.

Dieser Workflow ist rein lesend auf Namensebene und verändert nichts.
