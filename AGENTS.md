# Arbeitsanweisung für KI-Assistenten

Du arbeitest in der persönlichen Wissensdatenbank `WissenDB-PK-Home`.
Unterstütze den Benutzer dabei, Wissen verständlich abzulegen, wiederzufinden,
zu ordnen und aktuell zu halten. Antworte grundsätzlich auf Deutsch, sofern der
Benutzer keine andere Sprache verlangt.

## Metadaten

- Erstellt: 2026-08-03
- Zuletzt geändert: 2026-08-05

## Vorgehen zu Beginn jeder Sitzung

1. Lies diese Datei vollständig.
2. Lies anschließend [REGELN.md](REGELN.md).
3. Prüfe die für den Auftrag relevanten Ordner und Dateien.
4. Prüfe vor Änderungen den Git-Status und bewahre bereits vorhandene Änderungen
   des Benutzers.
5. Bearbeite nur Inhalte, die für den aktuellen Auftrag notwendig sind.

## Aufbau der Wissensdatenbank

- `00_Eingang`: vom Benutzer abgelegte Dateien, die auf den nächsten Import warten,
  sowie offene, von der KI erzeugte Klärungsdateien
- `10_Wissen`: dauerhaftes Wissen zu Alltag, Finanzen, Technik und Lernen
- `20_Projekte`: Vorhaben mit Ziel, Status, Aufgaben und nächstem Schritt
- `30_Anleitungen`: nachvollziehbare Schritt-für-Schritt-Anleitungen und Checklisten
- `40_Personen_und_Kontakte`: Personen, Firmen und Ansprechpartner
- `50_Dokumentation`: Geräte, Verträge und eigene technische Systeme
- `60_Quellen`: Bücher, Internetseiten, Schulmaterial und sonstige Quellen
- `70_Vorlagen`: Vorlagen für neue Einträge
- `80_Workflows`: festgelegte Abläufe für wiederkehrende KI-Aufträge
- `90_Archiv`: unveränderte Originaldateien und interne Protokolle abgeschlossener
  Importläufe; kein regulärer Wissens- oder Quellenbereich
- `Sicherheit`: Blackbox-Bereich für Schlüssel und andere vom Benutzer benannte
  Sicherheitsdateien; Dateinamen dürfen gelesen, Dateiinhalte niemals geöffnet
  oder ausgewertet werden

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
Archivbereich nicht mehr als Wissensgrundlage für laufende Arbeit verwendet.

Ein Zugriff auf einen abgeschlossenen Archivlauf ist nur zulässig, wenn der
Benutzer ihn ausdrücklich verlangt oder wenn verlorenes beziehungsweise
beschädigtes Wissen anders nicht wiederhergestellt werden kann. In diesem Fall
muss die betroffene Arbeitsnotiz den Satz „Archiv nur im Notfall herangezogen“
sowie Grund und Datum des Zugriffs enthalten. Ein bloß nützlicher Zusatz, eine
bequemere Recherche oder eine unvollständige Wissensnotiz ist kein Notfall.

Der Workflow `Zeige mir den Originaleintrag zu <Thema>` aus
`80_Workflows/originaleintrag-anzeigen.md` greift ausschließlich auf aktive
Einträge zu. Eingang und Archiv werden dabei weder durchsucht noch gelesen.

KI-Assistenten dürfen die thematische Ordnerstruktur eigenständig festlegen und
verbessern. Dazu gehört, für das betroffene Wissen Ordner und Dateien anzulegen,
umzubenennen, zu verschieben oder bei inhaltlicher Überschneidung
zusammenzuführen. Die Struktur muss mit sprechenden Namen und einer logisch
nachvollziehbaren Hierarchie auch ohne KI verständlich bleiben; unnötig tiefe,
komplizierte oder nur maschinenlesbare Strukturen sind zu vermeiden. Bei einer
Umstrukturierung müssen betroffene interne Verweise aktualisiert und die
Strukturänderungen im Importprotokoll festgehalten werden. Sachfremde Bereiche
bleiben unangetastet.

## Workflow-Auswahl

Die verbindliche Übersicht steht in
[80_Workflows/README.md](80_Workflows/README.md). Bei einem passenden
Benutzerauftrag wird die zugehörige Workflow-Datei vollständig gelesen und
ausgeführt:

- `Wissen eintragen` → `80_Workflows/wissen-eintragen.md`
- `Was weiß ich über <Thema>?` → `80_Workflows/wissen-abfragen.md`
- `Zeige mir den Originaleintrag zu <Thema>` →
  `80_Workflows/originaleintrag-anzeigen.md`
- `Zeige mir alle Schlüssel oder Sicherheitssachen in der Datenbank an` →
  `80_Workflows/sicherheit-auflisten.md`
- `Prüfe die Wissensdatenbank` → `80_Workflows/wissensdatenbank-pruefen.md`

Eindeutig sinngleiche Formulierungen gelten ebenfalls. Das bloße Ablegen von
Dateien löst keinen Workflow aus. Bei einer unklaren Zuordnung fragt der
Assistent nach, bevor er einen schreibenden Workflow startet. Beim Anzeigen
eines Originaleintrags muss vor der Ausgabe genau eine aktive Datei feststehen.

## Verhalten beim Ablegen von Wissen

- Verwende für neue Einträge möglichst eine passende Vorlage aus `70_Vorlagen`.
- Jeder neue Wissenseintrag erhält `Erstellt` und `Zuletzt geändert`. Als
  `Erstellt` wird automatisch das lokale Datum verwendet, an dem der Eintrag
  erstmals in die Wissensdatenbank aufgenommen wird; der Benutzer muss dieses
  Datum nicht angeben. Bei einer inhaltlichen Änderung wird nur
  `Zuletzt geändert` auf das aktuelle lokale Datum gesetzt. `Erstellt` bleibt
  unverändert; reine Lesezugriffe ändern keines der beiden Daten.
- Behandle `00_Eingang` als Warteschlange für noch nicht verarbeitete Dateien,
  nicht als dauerhaften Speicherort. Dateien namens
  `KLAERUNGSBEDARF_*.md` sind offene Arbeitsnotizen und werden nicht
  erneut als Wissensquelle importiert.
- Erstelle vor dem Vergleich und einer möglichen Zusammenführung für jede
  Eingangsquelle und jeden möglichen Zieleintrag ein Zielprofil. Es beschreibt
  mindestens Eintragstyp und Zweck, Gegenstand oder System, Produkt oder
  Variante, Architektur oder Plattform, Zielgerät oder Zielgruppe,
  Einsatzumgebung oder Verfahren sowie Geltungsbereich und Ausschlüsse. Nicht
  ermittelbare Werte werden als `unbekannt`, sachlich unzutreffende Felder als
  `nicht relevant` markiert.
- Führe Inhalte nur zusammen, wenn ihre Zielprofile vereinbar sind. Abweichende
  Identitätsmerkmale wie Produktvariante, Architektur, Plattform, Zielgerät oder
  Verfahren erfordern getrennte Einträge. Übernimm das Zielprofil als
  Metadatenkarte in zielabhängige neue oder geänderte Einträge.
- Formuliere sachlich, verständlich und so vollständig, dass der Inhalt später
  ohne ursprünglichen Chat, Eingangsdatei oder Archivzugriff nachvollziehbar und
  praktisch nutzbar ist.
- Trenne bestätigte Tatsachen klar von Vermutungen, Ideen und offenen Fragen.
- Bewerte Unstimmigkeiten in dieser Reihenfolge: aktuelle ausdrückliche
  Benutzeranweisung, eindeutig benutzerverfasste Angabe, geprüfte verlässliche
  Quelle, ältere oder KI-erzeugte Ergänzung. Löse verbleibende Konflikte nicht
  still auf. Lege die technisch möglichen getrennten oder vorläufigen Einträge
  trotzdem an, kennzeichne offene Punkte und erstelle nach
  `70_Vorlagen/Klaerungsbedarf.md` eine Datei
  `00_Eingang/KLAERUNGSBEDARF_JJJJ-MM-TT_HHMMSS.md`. Sie nennt klar, wo, wann und was
  auffiel, welche Entscheidung vorläufig getroffen wurde und welche Anweisung
  des Benutzers benötigt wird.
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

- Behandle `Sicherheit` und insbesondere `Sicherheit/Schlüssel` als Blackbox. Du
  darfst ausschließlich Datei- und Ordnernamen lesen. Öffne, durchsuche,
  analysiere, indiziere, rendere, kopiere oder hashe keine dort abgelegte Datei
  und gib niemals ihren Inhalt aus. Verwende diese Dateien nicht als Wissen oder
  Quelle.
- Eine vom Benutzer ausdrücklich als Schlüssel oder Sicherheitsdatei bezeichnete
  Datei darf ungeöffnet nach `Sicherheit/Schlüssel` oder in einen anderen vom
  Benutzer bestimmten Sicherheitsunterordner verschoben werden. Bewahre den
  Dateinamen exakt. Bei einer Namenskollision wird weder überschrieben noch
  umbenannt, sondern nachgefragt.
- Wenn der Benutzer alle Schlüssel oder Sicherheitssachen sehen möchte, führe
  `80_Workflows/sicherheit-auflisten.md` aus. Gib ausschließlich die Namen aus,
  keine Inhalte, Größen, Zeitstempel, Prüfsummen oder sonstigen Metadaten.
- Schlüsseldateien und andere Geheimnisse werden nicht von Git erfasst, nicht
  archiviert und nicht in aktive Wissenseinträge übernommen.
- Übernimm personenbezogene Daten nur, wenn sie für den Auftrag notwendig sind.
- Weise vor einer Veröffentlichung auf möglicherweise private Inhalte hin.
- Lösche oder überschreibe bestehende Inhalte nur auf ausdrücklichen Auftrag.
- Wenn eine Eingangsdatei nur vermutlich ein Geheimnis enthält, öffne sie nicht.
  Lass sie bis zu einer ausdrücklichen Einordnung im Eingang und weise den
  Benutzer allein anhand des Dateinamens darauf hin. Bestätigt der Benutzer sie
  als Sicherheitsdatei, darfst du sie ungeöffnet in den Sicherheitsbereich
  verschieben.

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
