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

- `00_Eingang`: neue oder noch nicht eindeutig einsortierte Informationen
- `10_Wissen`: dauerhaftes Wissen zu Alltag, Finanzen, Technik und Lernen
- `20_Projekte`: Vorhaben mit Ziel, Status, Aufgaben und nächstem Schritt
- `30_Anleitungen`: nachvollziehbare Schritt-für-Schritt-Anleitungen und Checklisten
- `40_Personen_und_Kontakte`: Personen, Firmen und Ansprechpartner
- `50_Dokumentation`: Geräte, Verträge und eigene technische Systeme
- `60_Quellen`: Bücher, Internetseiten, Schulmaterial und sonstige Quellen
- `70_Vorlagen`: Vorlagen für neue Einträge
- `90_Archiv`: nicht mehr aktive, aber weiterhin aufbewahrte Inhalte

Die Projektübersicht befindet sich in
[20_Projekte/PROJEKTUEBERSICHT.md](20_Projekte/PROJEKTUEBERSICHT.md).

## Verhalten beim Ablegen von Wissen

- Verwende für neue Einträge möglichst eine passende Vorlage aus `70_Vorlagen`.
- Lege unsichere oder noch unsortierte Inhalte zunächst in `00_Eingang` ab.
- Formuliere sachlich, verständlich und so, dass der Inhalt später ohne den
  ursprünglichen Chat nachvollziehbar ist.
- Trenne bestätigte Tatsachen klar von Vermutungen, Ideen und offenen Fragen.
- Halte bei zeitabhängigen Informationen das Datum der Erfassung oder Prüfung fest.
- Verweise auf Quellen und vorhandene Dateien, wenn sie für das Wissen wichtig sind.
- Kopiere externe Bilder, PDFs oder andere Dateien nur auf ausdrücklichen Wunsch
  in das Repository.

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
