# Workflow: Wissen eintragen

## Auslöser

- `Wissen eintragen`
- `Trage das neue Wissen aus 00_Eingang ein`
- Eindeutig sinngleiche Aufträge zur vollständigen Verarbeitung des Eingangs oder
  ausdrücklich benannter externer Quelldateien

Das bloße Ablegen von Dateien in `00_Eingang` startet diesen Workflow nicht.

## Zweck

Alle unterstützten Eingangsdateien oder ausdrücklich benannten externen Quelldateien
vollständig auswerten und ihr nutzbares Wissen in selbstständige aktive Einträge
übernehmen. Erfolgreich verarbeitete Eingangsoriginale werden unverändert und
nachvollziehbar archiviert; externe Originale bleiben an ihrem bestehenden Ablageort.

## Externe Quellen außerhalb von 00_Eingang

- Eine Datei außerhalb von `00_Eingang` wird nur verarbeitet, wenn der Benutzer sie oder
  ihren eng abgegrenzten Ordner ausdrücklich als Quelle benennt und der Zugriff nach den
  für den Ablageort geltenden Schutzregeln erlaubt ist.
- Externe Originale werden ausschließlich lesend ausgewertet. Sie werden nicht verändert,
  verschoben, umbenannt oder gelöscht. Eine Kopie in die Wissensdatenbank wird nur auf
  ausdrücklichen Wunsch erstellt.
- Externe Originale werden nicht in `90_Archiv` kopiert und lösen keinen Archivlauf aus,
  weil ihr bestehender Ablageort die Originalaufbewahrung übernimmt. Für einen rein
  externen Lauf wird daher auch kein `IMPORTPROTOKOLL.md` im Archiv angelegt.
- Der aktive Eintrag nennt unter `Herkunft` mindestens den ursprünglichen Dateinamen und
  bei Bedarf eine verständliche Sammlung, aber keinen unnötigen rechnerspezifischen
  Absolutpfad. Er bleibt ohne Zugriff auf die externe Datei vollständig verständlich.

## Ablauf

1. Prüfe den Git-Status und erfasse alle regulären Quelldateien in `00_Eingang` oder die
   vom Benutzer ausdrücklich benannten externen Quelldateien,
   auch in Unterordnern. Dateien nach dem Muster `KLAERUNGSBEDARF_*.md` sind
   offene Arbeitsnotizen: Weise auf sie hin, aber behandle sie nicht erneut als
   Wissensquelle. Vom Benutzer als Schlüssel oder Sicherheitsdateien bezeichnete
   Dateien dürfen nur anhand ihres Namens erkannt und nach den Regeln in
   `80_Workflows/Werkzeuge/sicherheitsdateien.md` ungeöffnet verschoben werden;
   sie gehören nicht zu den Quelldateien. Bereits vorhandene Änderungen außerhalb
   des Importauftrags bleiben unangetastet.
2. Lege zu Beginn einen lokalen Zeitstempel im Format `JJJJ-MM-TT_HHMMSS` fest.
   Wenn mindestens eine Eingangsdatei verarbeitet wird, lautet der Archivpfad
   `90_Archiv/Importe/<Zeitstempel>/`. Bei ausschließlich externen Quellen wird kein
   Archivpfad angelegt.
3. Lies jede unterstützte Datei vollständig und erstelle für jede Datei eine
   ausführliche Einzelbeschreibung. Sie enthält alle wesentlichen Aussagen,
   Daten, Voraussetzungen, Abläufe, Entscheidungen, Einschränkungen und offenen
   Fragen. Tatsachen, Vermutungen und zeitabhängige Angaben werden getrennt.
4. Erstelle für jede Eingangs- oder externe Quelle ein Zielprofil. Bestimme darin:
   - Eintragstyp und Zweck,
   - Gegenstand oder System,
   - Produkt oder Variante,
   - Architektur oder Plattform,
   - Zielgerät oder Zielgruppe,
   - Einsatzumgebung, Boot-, Installations- oder sonstiges Verfahren,
   - Geltungsbereich und ausdrückliche Ausschlüsse.
   Verwende `unbekannt`, wenn ein Wert nicht zuverlässig bestimmbar ist, und
   `nicht relevant`, wenn ein Feld sachlich nicht zutrifft.
5. Erstelle dasselbe Zielprofil für jeden möglicherweise passenden aktiven
   Zieleintrag und vergleiche die Profile vor jeder Zusammenführung. Führe
   Inhalte nur zusammen, wenn die Profile vereinbar sind. Abweichungen bei
   Produktvariante, Architektur, Plattform, Zielgerät oder Verfahren sind keine
   Dubletten, sondern erfordern getrennte Einträge. Thematische Ähnlichkeit allein
   reicht nicht für eine Zusammenführung.
6. Behandle Unstimmigkeiten nach folgender Rangfolge:

   1. aktuelle ausdrückliche Anweisung des Benutzers,
   2. eindeutig benutzerverfasste Angabe,
   3. geprüfte verlässliche öffentliche oder bibliografische Quelle,
   4. ältere oder KI-erzeugte Ergänzung.

   Dokumentiere verbleibende Konflikte mit Herkunft und Datum und löse sie nicht
   still auf.
7. Lege alle technisch möglichen getrennten oder vorläufigen Einträge trotz
   offener Punkte an. Kennzeichne unsichere Aussagen und fehlende Angaben darin
   als `unbekannt` oder `offen`; übernimm keine ungesicherte Entscheidung als
   Tatsache. Erstelle bei Unstimmigkeiten zusätzlich die unter
   „Klärungsdateien im Eingang“ beschriebene Arbeitsnotiz.
8. Verwende für neue Einträge die passende Vorlage aus `70_Vorlagen`. Übernimm
   bei zielabhängigen Dateien das Zielprofil als Metadatenkarte. Setze `Erstellt`
   nur beim Anlegen und `Zuletzt geändert` bei jeder inhaltlichen Änderung auf
   das aktuelle lokale Datum. Ein reiner Lesezugriff ändert dieses Datum nicht.
9. Übernimm das nutzbare Wissen vollständig in die aktiven Einträge. Verweise
   dort weder auf den Eingangspfad noch auf den späteren Archivpfad. Der
   ursprüngliche Dateiname darf unter `Herkunft` genannt werden.
10. Erstelle für verarbeitete Eingangsdateien im Laufordner `IMPORTPROTOKOLL.md`. Es
    enthält Zeitstempel,
    Dateiliste und je Datei mindestens Bearbeitungsstatus, ausführliche
    Einzelbeschreibung, Zielprofil, Ziel- oder Merge-Pfad, getrennte Varianten,
    Dubletten, Konflikte, Klärungsdatei und offene Fragen. Strukturänderungen
    werden ebenfalls festgehalten. Bei ausschließlich externen Quellen entfällt dieses
    Archivprotokoll; deren Herkunft und Einzelbeschreibung stehen in den aktiven
    Einträgen.
11. Prüfe vor dem Abschluss und vor einem Verschieben von Eingangsoriginalen, dass jeder
    aktive Eintrag ohne Originaldatei verständlich und nutzbar ist und außerhalb des
    neuen Archivlaufs kein Archivpfad eingetragen wurde.
12. Verschiebe erfolgreich verarbeitete Eingangsoriginale unverändert und unter
    Beibehaltung ihrer relativen Eingangsstruktur nach
    `90_Archiv/Importe/<Zeitstempel>/Originale/` und prüfe ihre Integrität. Offene,
    klar dokumentierte Unstimmigkeiten verhindern dies nicht, wenn alle technisch
    möglichen Einträge erstellt und Unsicherheiten sichtbar markiert wurden.
13. Nicht lesbare, nicht unterstützte, geheimnishaltige oder nicht sicher
    verarbeitbare Eingangsquelldateien bleiben mit dokumentiertem Grund in
    `00_Eingang`; entsprechende externe Quelldateien bleiben unverändert an ihrem
    bestehenden Ort und werden nur als nicht verarbeitet gemeldet. Diese Sicherheits-
    und Verarbeitungsgrenze hat Vorrang vor der Regel, trotz Unstimmigkeiten Einträge
    anzulegen. Ausdrücklich bezeichnete Sicherheitsdateien im Eingang werden
    stattdessen ungeöffnet in den Sicherheitsbereich verschoben und weder archiviert
    noch beschrieben.
14. Berichte abschließend knapp über verarbeitete Dateien, neue oder aktualisierte
    Einträge, getrennte Varianten, archivierte Eingangsoriginale, unverändert am
    bestehenden Ort belassene externe Originale, erzeugte Klärungsdateien und noch
    wartende Dateien.

## Klärungsdateien im Eingang

Wenn während eines Importlaufs Widersprüche, ungewöhnliche Strukturen, unklare
Zielprofile oder Entscheidungen auftreten, die eine Benutzeranweisung benötigen,
erstelle genau eine Datei
`00_Eingang/KLAERUNGSBEDARF_JJJJ-MM-TT_HHMMSS.md`, wobei Datum und Uhrzeit durch
den zu Beginn festgelegten Zeitstempel ersetzt werden. Verwende dafür
`70_Vorlagen/Klaerungsbedarf.md`.

Die Datei enthält für jeden Punkt mindestens:

- **Wo:** betroffene Eingangs- oder externe Quelldatei und angelegter oder geänderter
  Zielpfad,
- **Wann:** lokales Datum und Uhrzeit der Feststellung,
- **Was:** konkrete Beobachtung oder Unstimmigkeit,
- **Warum ungewöhnlich:** mögliche Folgen für Inhalt oder Struktur,
- **Vorläufiges Vorgehen:** was trotz der Unklarheit angelegt, getrennt oder als
  offen markiert wurde,
- **Benötigte Anweisung:** eine konkrete, beantwortbare Rückfrage an den Benutzer.

Erstelle keine leere Klärungsdatei. Fasse mehrere Punkte desselben Importlaufs in
einer Datei zusammen. Kopiere keine Geheimnisse hinein. Solange ihr Status
`Offen` ist, bleibt sie im Eingang, wird bei späteren Importläufen gemeldet und
nicht selbst als Wissensquelle verarbeitet.

## Formeln und Rechenbeispiele

Formeln, Formeltabellen und vorgerechnete Standardbeispiele werden nicht
unnötig vollständig abgeschrieben, wenn sie zuverlässig öffentlich verfügbar
sind. Beschreibe Bedeutung, Voraussetzungen, Anwendung und Lösungsverfahren
vollständig und verweise möglichst auf eine geprüfte öffentliche Quelle. Erfinde
keinen Link. Offizielle schulische Formelsammlungen bleiben als wichtige
Originale erhalten.

## Archivprinzip

Archivierte Eingangsoriginale und am bestehenden Ort belassene externe Originale bleiben
unverändert. Aktive Einträge müssen ohne sie vollständig verständlich sein. Reguläre
Lese-Workflows verwenden ausschließlich den aktiven Wissensbestand und greifen weder auf
archivierte noch auf externe Originale zurück.
