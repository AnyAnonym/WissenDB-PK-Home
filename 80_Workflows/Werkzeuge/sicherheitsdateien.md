# Werkzeugregel: Sicherheitsdateien

## Schutzbereich

Der Ordner `Sicherheit` und alle seine Unterordner sind eine Blackbox. Der
Standardordner für Schlüsseldateien lautet `Sicherheit/Schlüssel`. Weitere
Unterordner dürfen passend zum vom Benutzer genannten Zweck angelegt werden.

## Erlaubt

- Datei- und Ordnernamen unter `Sicherheit` auflisten.
- Eine vom Benutzer ausdrücklich bezeichnete Sicherheitsdatei ungeöffnet in den
  passenden Sicherheitsunterordner verschieben.
- Für einen neuen Zweck einen verständlich benannten Unterordner anlegen.

## Verboten

- Inhalte öffnen, einlesen, durchsuchen, analysieren, parsen, rendern, ausführen
  oder in irgendeiner Form ausgeben.
- Inhaltsbasierte Dateityperkennung, Vorschauen, Hashwerte, Größen, Zeitstempel,
  Berechtigungen oder sonstige Metadaten ermitteln.
- Dateien umbenennen. Der vom Benutzer vorgegebene Name beschreibt ihren Zweck
  und bleibt exakt erhalten.
- Dateien überschreiben. Existiert der gleiche Name bereits am Ziel, wird die
  Aktion abgebrochen und der Benutzer gefragt.
- Sicherheitsdateien in Git, `90_Archiv`, aktive Wissenseinträge,
  Importprotokolle oder Klärungsdateien übernehmen.

## Verschieben aus dem Eingang

1. Verwende ausschließlich den vom Benutzer genannten Dateinamen.
2. Prüfe nur anhand des Namens, ob Quelle und Ziel existieren. Öffne die Datei
   nicht und berechne keinen Hash.
3. Lege bei Bedarf den Zielordner an.
4. Prüfe, dass Quelle und Ziel innerhalb der Wissensdatenbank liegen.
5. Verschiebe die Datei unter Beibehaltung ihres exakten Dateinamens.
6. Bestätige ausschließlich den Namen und den Zielordner, niemals Inhalt oder
   weitere Metadaten.
