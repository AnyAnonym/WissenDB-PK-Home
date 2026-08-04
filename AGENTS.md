# Arbeitsanweisung für KI-Assistenten

Du arbeitest in der persönlichen Wissensdatenbank `WissenDB-PK-Home`.
Unterstütze den Benutzer dabei, Wissen verständlich abzulegen, wiederzufinden,
zu ordnen und aktuell zu halten. Antworte grundsätzlich auf Deutsch, sofern der
Benutzer keine andere Sprache verlangt.

## Vorgehen zu Beginn jeder Sitzung

1. Lies diese Datei vollständig.
2. Lies anschließend [REGELN.md](REGELN.md).
3. Prüfe die für den Auftrag relevanten Ordner und Dateien.
4. Prüfe vor Änderungen den Git-Status und bewahre bereits vorhandene Änderungen
   des Benutzers.
5. Bearbeite nur Inhalte, die für den aktuellen Auftrag notwendig sind.

## Aufbau der Wissensdatenbank

- `00_Eingang`: vom Benutzer abgelegte Dateien, die auf den nächsten Import warten
- `10_Wissen`: dauerhaftes Wissen zu Alltag, Finanzen, Technik und Lernen
- `20_Projekte`: Vorhaben mit Ziel, Status, Aufgaben und nächstem Schritt
- `30_Anleitungen`: nachvollziehbare Schritt-für-Schritt-Anleitungen und Checklisten
- `40_Personen_und_Kontakte`: Personen, Firmen und Ansprechpartner
- `50_Dokumentation`: Geräte, Verträge und eigene technische Systeme
- `60_Quellen`: Bücher, Internetseiten, Schulmaterial und sonstige Quellen
- `70_Vorlagen`: Vorlagen für neue Einträge
- `90_Archiv`: unveränderte Originaldateien und interne Protokolle abgeschlossener
  Importläufe; kein regulärer Wissens- oder Quellenbereich

Die Projektübersicht befindet sich in
[20_Projekte/PROJEKTUEBERSICHT.md](20_Projekte/PROJEKTUEBERSICHT.md).

## Archivprinzip und selbstständige Wissenseinträge

Das Archiv dient ausschließlich der unveränderten, langfristigen Aufbewahrung.
Aktive Wissenseinträge, Projekte, Anleitungen, Dokumentationen und Quellenlisten
dürfen nicht auf Dateien oder Pfade in `90_Archiv` verweisen. Sie müssen so
vollständig und verständlich sein, dass sie im normalen Gebrauch ohne Zugriff auf
die Originaldatei und ohne Kenntnis des ursprünglichen Chats ausreichen.

Während eines Importlaufs darf der Assistent einen neuen Archivlauf anlegen, die
erfolgreich verarbeiteten Originale einmalig dorthin verschieben, ihre Integrität
prüfen und das Importprotokoll schreiben. Nach Abschluss des Laufs wird dieser
Archivbereich nicht mehr gelesen, durchsucht, verändert oder als Quelle für
laufende Arbeit verwendet.

Ein Zugriff auf einen abgeschlossenen Archivlauf ist nur zulässig, wenn der
Benutzer ihn ausdrücklich verlangt oder wenn verlorenes beziehungsweise
beschädigtes Wissen anders nicht wiederhergestellt werden kann. In diesem Fall
muss die betroffene Arbeitsnotiz den Satz „Archiv nur im Notfall herangezogen“
sowie Grund und Datum des Zugriffs enthalten. Ein bloß nützlicher Zusatz, eine
bequemere Recherche oder eine unvollständige Wissensnotiz ist kein Notfall.

KI-Assistenten dürfen die thematische Ordnerstruktur eigenständig festlegen und
verbessern. Dazu gehört, für das betroffene Wissen Ordner und Dateien anzulegen,
umzubenennen, zu verschieben oder bei inhaltlicher Überschneidung
zusammenzuführen. Die Struktur muss mit sprechenden Namen und einer logisch
nachvollziehbaren Hierarchie auch ohne KI verständlich bleiben; unnötig tiefe,
komplizierte oder nur maschinenlesbare Strukturen sind zu vermeiden. Bei einer
Umstrukturierung müssen betroffene interne Verweise aktualisiert und die
Strukturänderungen im Importprotokoll festgehalten werden. Sachfremde Bereiche
bleiben unangetastet.

## Standardworkflow: neues Wissen eintragen

Wenn der Benutzer sinngemäß sagt, dass das neue Wissen aus `00_Eingang`
eingetragen oder verarbeitet werden soll, gilt dies als Auftrag für einen
vollständigen Importlauf. Das bloße Ablegen von Dateien löst noch keine
Verarbeitung aus.

1. Prüfe den Git-Status und erfasse alle regulären Dateien in `00_Eingang`, auch
   in Unterordnern. Bereits vorhandene Änderungen außerhalb des Importauftrags
   bleiben unangetastet.
2. Lege zu Beginn des Laufs einen lokalen Zeitstempel im Format
   `JJJJ-MM-TT_HHMMSS` (Zeitzone des Benutzers) fest. Der zugehörige Archivpfad
   lautet `90_Archiv/Importe/<Zeitstempel>/`.
3. Lies jede unterstützte Datei vollständig und erstelle für jede Datei eine
   ausführliche Einzelbeschreibung. Sie muss alle für die spätere Nutzung
   wesentlichen Aussagen, Daten, Voraussetzungen, Abläufe, Entscheidungen,
   Einschränkungen und offenen Fragen enthalten. Trenne Tatsachen, Vermutungen,
   offene Fragen und zeitabhängige Angaben. Beachte bei Formeln und
   Rechenbeispielen die unten festgelegten Sonderregeln.
4. Vergleiche die gewonnenen Informationen mit dem gesamten relevanten Bestand.
   Wähle oder verbessere dabei selbstständig eine passende, menschlich
   nachvollziehbare Ordnerstruktur. Aktualisiere passende Einträge, statt
   parallele Dubletten anzulegen. Erstelle nur dann einen neuen Eintrag, wenn noch
   kein sinnvoller Zielartikel existiert, und verwende dafür möglichst eine
   Vorlage aus `70_Vorlagen`.
5. Führe ergänzende Informationen sachlich zusammen. Entferne keine weiterhin
   gültigen Aussagen oder früheren Projektfortschritte. Bei Widersprüchen darf
   keine Variante still überschrieben werden: dokumentiere beide Angaben mit
   Quelle und Datum oder kennzeichne die Klärung als offene Frage.
6. Übernimm das nutzbare Wissen vollständig in die aktiven Einträge. Verweise
   weder auf den Eingangspfad noch auf den späteren Archivpfad. Der ursprüngliche
   Dateiname darf zur Herkunft genannt werden, aber nicht als notwendige
   Lesestelle. Wenn ein Eintrag ohne die Originaldatei unverständlich oder
   unvollständig wäre, muss seine Beschreibung vor der Archivierung verbessert
   werden.
7. Erstelle im Laufordner eine Datei `IMPORTPROTOKOLL.md`. Sie ist interne
   Archivmetadokumentation und wird nicht aus aktiven Bereichen verlinkt. Sie
   enthält den Zeitstempel, eine Liste aller erfassten Dateien und je Datei
   mindestens: Bearbeitungsstatus, ausführliche Einzelbeschreibung, Zielpfad oder
   Merge-Ziel sowie Hinweise auf Dubletten, Konflikte oder offene Fragen.
8. Prüfe vor dem Verschieben, dass Einzelbeschreibungen, Merge-Ergebnisse und
   Protokoll vollständig sind und jeder aktive Eintrag ohne Originaldatei
   verständlich und nutzbar ist. Prüfe außerdem, dass außerhalb des neuen
   Archivlaufs kein Archivpfad eingetragen wurde. Verschiebe anschließend nur
   erfolgreich verarbeitete Originaldateien unverändert und unter Beibehaltung
   ihrer relativen Eingangsstruktur nach
   `90_Archiv/Importe/<Zeitstempel>/Originale/`.
9. Nicht lesbare, nicht unterstützte oder fehlerhaft verarbeitete Dateien bleiben
   in `00_Eingang`. Vermerke den Grund im Importprotokoll und nenne ihn dem
   Benutzer. Lösche keine Eingangsdatei.
10. Berichte abschließend knapp, welche Dateien verarbeitet und welche
    Wissenseinträge neu erstellt oder aktualisiert wurden sowie was
    gegebenenfalls noch im Eingang wartet. Melde, dass die Originale archiviert
    wurden, ohne den Archivpfad als weiterführende Quelle oder Link anzubieten.

Der Importauftrag erlaubt ausdrücklich das Aktualisieren und sinnvolle
Umstrukturieren der betroffenen Wissenseinträge sowie das Verschieben erfolgreich
verarbeiteter Eingangsdateien ins oben definierte Archiv. Er erlaubt weder das
Löschen von Originalen noch Änderungen an sachfremden Dateien. Archivierte
Originale sind unveränderlich und werden nach Abschluss nicht regulär verwendet;
spätere Korrekturen erfolgen in den selbstständigen Wissenseinträgen und werden
nachvollziehbar dokumentiert.

## Verhalten beim Ablegen von Wissen

- Verwende für neue Einträge möglichst eine passende Vorlage aus `70_Vorlagen`.
- Behandle `00_Eingang` als Warteschlange für noch nicht verarbeitete Dateien,
  nicht als dauerhaften Speicherort.
- Formuliere sachlich, verständlich und so vollständig, dass der Inhalt später
  ohne ursprünglichen Chat, Eingangsdatei oder Archivzugriff nachvollziehbar und
  praktisch nutzbar ist.
- Trenne bestätigte Tatsachen klar von Vermutungen, Ideen und offenen Fragen.
- Halte bei zeitabhängigen Informationen das Datum der Erfassung oder Prüfung fest.
- Verweise bei Bedarf auf verlässliche öffentliche oder bibliografische Quellen,
  niemals im normalen Betrieb auf archivierte Originaldateien.
- Ersetze einen sonst notwendigen Dateiverweis durch eine bessere Beschreibung:
  übernimm relevante Tabellenwerte, Termine, Definitionen, Abläufe,
  Voraussetzungen, Ergebnisse und Einschränkungen in angemessenem Detail.
- Bevorzuge thematisch konsolidierte Wissenseinträge gegenüber einer neuen
  dauerhaften Notiz für jede einzelne Quelldatei.
- Kopiere externe Bilder, PDFs oder andere Dateien nur auf ausdrücklichen Wunsch
  in das Repository. Dateien, die der Benutzer selbst in `00_Eingang` ablegt,
  sind davon ausgenommen und werden gemäß Importworkflow archiviert.

## Umgang mit Formeln, Rechnungen und Formelsammlungen

- Schreibe Formeln, Formeltabellen und vorgerechnete Standardbeispiele aus
  Quelldateien nicht vollständig in die abgeleiteten Wissenseinträge ab, wenn sie
  zuverlässig im Internet nachgeschlagen werden können.
- Beschreibe stattdessen in verständlichen Worten, was der Zusammenhang bedeutet,
  wofür er verwendet wird, welche Voraussetzungen gelten und nach welcher Methode
  eine Aufgabe gelöst wird. Das gilt insbesondere für erklärende Inhalte aus der
  Elektrotechnik.
- Verweise für die konkrete Formel oder Rechnung möglichst auf eine verlässliche
  öffentliche Quelle. Verweise nicht auf die archivierte Originaldatei. Erfinde
  keinen Link. Wenn keine geeignete Quelle geprüft werden kann, beschreibe den
  Zusammenhang und das Lösungsverfahren so vollständig wie zuverlässig möglich
  und kennzeichne verbleibende Lücken als offen.
- Nenne in der Einzelzusammenfassung, welche Formeln oder Rechenarten eine Quelle
  behandelt, ohne sie unnötig zu transkribieren.
- Offizielle schulische Formelsammlungen, insbesondere die für die Matura
  benötigte Formelsammlung, sind wichtige aufzubewahrende Originale. Bewahre sie
  unverändert im Archiv auf, verweise aus aktiven Einträgen aber nicht darauf.
  Sondere sie nicht als vermeintlich redundanten Inhalt aus. Beschreibe Aufbau,
  Themenumfang, Zulassungskontext und richtige Verwendung selbstständig; konkrete
  Formeln können über verlässliche öffentliche Quellen belegt werden, ohne die
  gesamte Sammlung in Markdown zu kopieren.

## Verhalten bei Projekten

- Verwende einen dieser Zustände: `Idee`, `Geplant`, `In Arbeit`, `Wartet`,
  `Pausiert`, `Abgeschlossen` oder `Verworfen`.
- Ein Projekt mit dem Status `In Arbeit` benötigt einen konkreten nächsten Schritt.
- Aktualisiere bei einem neuen Projekt auch die Projektübersicht.
- Markiere erledigte Aufgaben, ohne frühere Fortschritte zu entfernen.
- Erfinde keine Termine, technischen Daten oder Projektentscheidungen. Kennzeichne
  fehlende Angaben als `unbekannt`, `noch offen` oder als offene Frage.

## Sicherheit und Datenschutz

- Speichere keine Passwörter, Zugangsschlüssel, Tokens oder anderen Geheimnisse.
- Übernimm personenbezogene Daten nur, wenn sie für den Auftrag notwendig sind.
- Weise vor einer Veröffentlichung auf möglicherweise private Inhalte hin.
- Lösche oder überschreibe bestehende Inhalte nur auf ausdrücklichen Auftrag.
- Wenn eine Eingangsdatei vermutlich Geheimnisse enthält, übernimm ihren Inhalt
  nicht in die Wissensdatenbank und verschiebe sie nicht ins Archiv. Lass sie im
  Eingang und weise den Benutzer darauf hin.

## Git und Änderungen

- Vermische eigene Änderungen nicht mit bereits vorhandenen Änderungen des Benutzers.
- Erstelle verständliche Commit-Texte, wenn ein Commit ausdrücklich verlangt wird.
- Committe oder pushe nur auf ausdrücklichen Wunsch des Benutzers.
- Prüfe vor einem Commit die betroffenen Dateien und nach einem Commit den Git-Status.

## Beispiel für einen Startprompt

Falls ein KI-Werkzeug diese Datei nicht automatisch lädt, kann der Benutzer die
Sitzung beispielsweise so beginnen:

> Arbeite mit meiner Wissensdatenbank in diesem Projekt. Lies zuerst die Datei
> `AGENTS.md` vollständig und halte dich an ihre Anweisungen. Lies danach
> `REGELN.md`, prüfe den Git-Status und bearbeite anschließend meinen Auftrag.
> Bewahre vorhandene Änderungen und frage nach, bevor du sensible Daten speicherst
> oder nicht ausdrücklich verlangte Änderungen veröffentlichst.

Diese Datei ist die zentrale Orientierung für KI-Assistenten. `REGELN.md` enthält
die ergänzenden Grundregeln für die Wissensdatenbank.
