# Workflow: Wissensdatenbank prüfen

## Auslöser

- `Prüfe die Wissensdatenbank`
- Eindeutig sinngleiche Aufträge zur Qualitäts- oder Strukturprüfung

## Zweck

Strukturelle, inhaltliche und technische Qualitätsprobleme erkennen, ohne den
Wissensbestand allein durch die Prüfung zu verändern.

## Prüfumfang

1. Git-Status und unerwartete bestehende Änderungen
2. verständliche Ordnernamen und unnötig tiefe Ein-Datei-Unterordner
3. fehlende oder widersprüchliche Metadaten, insbesondere `Zuletzt geändert`
4. defekte relative Markdown-Links und Verweise auf nicht vorhandene Zielpfade
5. doppelte oder stark überschneidende Themen und Dateititel
6. unerlaubte Eingangs- oder Archivpfade in aktiven Einträgen
7. mögliche Geheimnisse, Zugangsdaten, private Netzwerkadressen und unnötige
   personenbezogene Daten
8. Konsistenz zwischen `AGENTS.md`, `REGELN.md`, `README.md` und
   `80_Workflows/README.md`
9. wartende Dateien in `00_Eingang`, ohne sie automatisch zu importieren
10. veraltete, ungeprüfte oder als offen gekennzeichnete Wissenseinträge

## Archivgrenze

Bei dieser allgemeinen Prüfung werden abgeschlossene Archivläufe weder gelesen
noch fachlich durchsucht. Ein Zugriff darauf ist nur nach den in `AGENTS.md` und
`REGELN.md` festgelegten Notfallregeln oder auf ausdrücklichen Benutzerwunsch
zulässig.

## Ergebnis

Der Bericht trennt mindestens:

- Fehler oder Sicherheitsprobleme,
- sinnvolle Verbesserungen,
- bewusste Strukturentscheidungen ohne unmittelbaren Handlungsbedarf.

Die reine Prüfung ist lesend. Änderungen erfolgen nur, wenn der Benutzer sie im
selben Auftrag ausdrücklich verlangt oder anschließend bestätigt.
