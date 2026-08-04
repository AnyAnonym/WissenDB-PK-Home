# Workflow: Wissen eintragen

## Auslöser

- `Wissen eintragen`
- `Trage das neue Wissen aus 00_Eingang ein`
- Eindeutig sinngleiche Aufträge zur vollständigen Verarbeitung des Eingangs

Das bloße Ablegen von Dateien in `00_Eingang` startet diesen Workflow nicht.

## Zweck

Alle unterstützten Eingangsdateien vollständig auswerten, ihr nutzbares Wissen in
selbstständige aktive Einträge übernehmen und erfolgreich verarbeitete Originale
unverändert und nachvollziehbar archivieren.

## Ablauf

1. Prüfe den Git-Status und erfasse alle regulären Dateien in `00_Eingang`, auch
   in Unterordnern. Bereits vorhandene Änderungen außerhalb des Importauftrags
   bleiben unangetastet.
2. Lege zu Beginn einen lokalen Zeitstempel im Format `JJJJ-MM-TT_HHMMSS` fest.
   Der Archivpfad lautet `90_Archiv/Importe/<Zeitstempel>/`.
3. Lies jede unterstützte Datei vollständig und erstelle für jede Datei eine
   ausführliche Einzelbeschreibung. Sie enthält alle wesentlichen Aussagen,
   Daten, Voraussetzungen, Abläufe, Entscheidungen, Einschränkungen und offenen
   Fragen. Tatsachen, Vermutungen und zeitabhängige Angaben werden getrennt.
4. Vergleiche die Informationen mit dem gesamten relevanten aktiven Bestand.
   Aktualisiere passende Einträge statt parallele Dubletten anzulegen. Verbessere
   die thematische Ordnerstruktur nur im betroffenen Bereich und aktualisiere
   dabei interne Verweise.
5. Führe ergänzende Informationen sachlich zusammen. Entferne keine weiterhin
   gültigen Aussagen. Bei Widersprüchen werden beide Angaben mit Herkunft und
   Datum dokumentiert oder als offene Frage gekennzeichnet.
6. Verwende für neue Wissenseinträge möglichst
   `70_Vorlagen/Wissensnotiz.md`. Setze `Erstellt` nur beim Anlegen und
   `Zuletzt geändert` bei jeder inhaltlichen Änderung auf das aktuelle lokale
   Datum. Ein reiner Lesezugriff ändert dieses Datum nicht.
7. Übernimm das nutzbare Wissen vollständig in die aktiven Einträge. Verweise
   dort weder auf den Eingangspfad noch auf den späteren Archivpfad. Der
   ursprüngliche Dateiname darf unter `Herkunft` genannt werden.
8. Erstelle im Laufordner `IMPORTPROTOKOLL.md`. Es enthält Zeitstempel,
   Dateiliste und je Datei mindestens Bearbeitungsstatus, ausführliche
   Einzelbeschreibung, Ziel- oder Merge-Pfad, Dubletten, Konflikte und offene
   Fragen. Strukturänderungen werden ebenfalls festgehalten.
9. Prüfe vor dem Verschieben, dass jeder aktive Eintrag ohne Originaldatei
   verständlich und nutzbar ist und außerhalb des neuen Archivlaufs kein
   Archivpfad eingetragen wurde.
10. Verschiebe nur erfolgreich verarbeitete Originaldateien unverändert und unter
    Beibehaltung ihrer relativen Eingangsstruktur nach
    `90_Archiv/Importe/<Zeitstempel>/Originale/`. Prüfe ihre Integrität.
11. Nicht lesbare, nicht unterstützte, geheimnishaltige oder fehlerhaft
    verarbeitete Dateien bleiben mit dokumentiertem Grund in `00_Eingang`.
12. Berichte abschließend knapp über verarbeitete Dateien, neue oder aktualisierte
    Einträge, archivierte Originale und noch wartende Dateien.

## Formeln und Rechenbeispiele

Formeln, Formeltabellen und vorgerechnete Standardbeispiele werden nicht
unnötig vollständig abgeschrieben, wenn sie zuverlässig öffentlich verfügbar
sind. Beschreibe Bedeutung, Voraussetzungen, Anwendung und Lösungsverfahren
vollständig und verweise möglichst auf eine geprüfte öffentliche Quelle. Erfinde
keinen Link. Offizielle schulische Formelsammlungen bleiben als wichtige
Originale erhalten.

## Archivprinzip

Archivierte Originale bleiben unverändert. Aktive Einträge müssen ohne sie
vollständig verständlich sein. Der spätere Workflow `Quellen anzeigen` darf die
Originale als Quellen auflisten; diese Möglichkeit ist kein Grund, aktive
Einträge kürzer oder unvollständiger zu verfassen.
