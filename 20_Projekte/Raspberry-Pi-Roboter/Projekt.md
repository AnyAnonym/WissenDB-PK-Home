# Raspberry-Pi-Roboter

## Metadaten

- Erstellt: 2026-08-03
- Zuletzt geändert: 2026-08-05
- Eintragstyp: Projekt

## Zielprofil

- Gegenstand oder System: kleiner programmierbarer Roboter
- Produkt oder Variante: Eigenbau auf Basis eines Raspberry Pi 4 Model B
- Architektur oder Plattform: Raspberry Pi 4 Model B, Raspberry Pi OS Lite, Python für Hardware-I/O
- Zielgerät oder Zielgruppe: eigener Lern- und Entwicklungsroboter; spätere Zusammenarbeit mit einem Freund
- Einsatzumgebung oder Verfahren: schrittweiser Aufbau mit GPIO, Webanwendung, Tailscale, Bluetooth und ergänzbarer Sensorik beziehungsweise Aktorik
- Geltungsbereich: Planung, Aufbau, Programmierung und Dokumentation des konkreten Roboters
- Ausdrückliche Ausschlüsse: private Tailnet-Adressen, Kontokennungen und Namen anderer Geräte

## Überblick

- Status: In Arbeit
- Begonnen: 2026-07-11
- Zieltermin: noch offen
- Nächster Schritt: Nächste gewünschte Roboterfunktion festlegen und die dafür benötigte Hardware planen
- Zusammenarbeit: Ein Freund wird zu einem späteren Zeitpunkt dazustoßen

## Ziel

Einen kleinen Roboter auf Basis eines Raspberry Pi 4 Model B bauen. Die
Ein- und Ausgänge des Roboters werden mit Python gesteuert. Später soll das
Projekt gemeinsam mit einem Freund weiterentwickelt werden.

## Aktueller Stand

### Hardware und I/O

- Zentrale Recheneinheit: Raspberry Pi 4 Model B
- Programmiersprache für Robotersteuerung und I/O: Python
- Ein Taster kann eingelesen werden.
- Solange der Taster gedrückt gehalten wird, leuchtet eine LED.

### Netzwerk und Webanwendung

- Caddy-Webserver ist installiert und funktioniert.
- Tailscale ist installiert und funktioniert.
- Der Raspberry Pi ist als Linux-Gerät über Tailscale erreichbar.
- Private Tailnet-IP-Adressen, Kontokennungen und Namen anderer Geräte werden
  nicht in der Wissensdatenbank gespeichert.
- Die Webanwendung verwendet HTML, CSS und JavaScript im Frontend.
- Das Backend wird mit JavaScript im Backend betrieben.

### Bluetooth und Audio

- Eine Bluetooth-Verbindung mit den Kopfhörern `X80` wurde eingerichtet.
- Die Verbindung funktioniert.

## Aufgaben

- [x] Raspberry Pi 4 Model B als Grundlage auswählen
- [x] Python für die Roboter- und I/O-Steuerung auswählen
- [x] Taster einlesen und LED während des Tastendrucks einschalten
- [x] Caddy-Webserver installieren und testen
- [x] Tailscale installieren und testen
- [x] Bluetooth-Verbindung mit den X80-Kopfhörern herstellen
- [ ] Nächste gewünschte Roboterfunktion festlegen
- [ ] Benötigte Sensoren, Aktoren und weitere Bauteile planen
- [ ] Aufgaben für die spätere Zusammenarbeit mit dem Freund abstimmen
