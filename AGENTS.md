# Arbeitsanweisung für KI-Assistenten

## Metadaten

- Erstellt: 2026-08-03
- Zuletzt geändert: 2026-08-05

## Auftrag und Sitzungsbeginn

Du arbeitest in der persönlichen Wissensdatenbank `WissenDB-PK-Home` und
unterstützt den Benutzer beim Ablegen, Ordnen, Wiederfinden und Aktualisieren von
Wissen. Antworte auf Deutsch, sofern keine andere Sprache verlangt wird.

Zu Beginn jeder Sitzung:

1. Lies diese Datei und anschließend [REGELN.md](REGELN.md) vollständig.
2. Lies bei einem passenden Auftrag die Übersicht
   [80_Workflows/README.md](80_Workflows/README.md) und den zugehörigen Workflow
   vollständig.
3. Prüfe die relevanten Ordner und Dateien sowie vor Änderungen den Git-Status.
4. Bewahre vorhandene Benutzeränderungen und bearbeite nur den notwendigen
   Bereich.

`REGELN.md` und die auftragsspezifischen Workflows sind verbindliche Ergänzungen
dieser kompakten Orientierung.

## Bereiche

- `00_Eingang`: noch nicht verarbeitete Dateien und offene Klärungsnotizen
- `10_Wissen`: dauerhaftes Wissen zu Alltag, Finanzen, Technik und Lernen
- `20_Projekte`: Vorhaben; Übersicht in
  [20_Projekte/PROJEKTUEBERSICHT.md](20_Projekte/PROJEKTUEBERSICHT.md)
- `30_Anleitungen`: Anleitungen und Checklisten
- `40_Personen_und_Kontakte`: Personen, Firmen und Ansprechpartner
- `50_Dokumentation`: Geräte, Verträge und eigene Systeme
- `60_Quellen`: Quellenlisten und bibliografische Angaben
- `70_Vorlagen`: Vorlagen für neue Einträge
- `80_Workflows`: verbindliche Abläufe für wiederkehrende Aufträge
- `90_Archiv`: unveränderte Originale und interne Importprotokolle
- `Sicherheit`: inhaltlich unzugängliche Blackbox für Sicherheitsdateien

## Dauerhafte Grundsätze

- Aktive Einträge müssen ohne ursprünglichen Chat, Eingangsdatei und Archivzugriff
  vollständig verständlich sein. Sie dürfen keine Eingangs- oder Archivpfade als
  Quellen oder weiterführende Lesestellen verwenden.
- Ein neuer Archivlauf darf nur innerhalb des Importworkflows angelegt und
  beschrieben werden. Abgeschlossene Archivläufe werden nur auf ausdrücklichen
  Benutzerwunsch oder zur Wiederherstellung verlorenen beziehungsweise
  beschädigten Wissens geöffnet. Bei einer Wiederherstellung dokumentiere
  „Archiv nur im Notfall herangezogen“, Grund und Datum.
- Verwende passende Vorlagen und halte die Metadatenregeln aus `REGELN.md` ein.
  Trenne Tatsachen, Vermutungen, Konflikte und offene Fragen sichtbar.
- Beim Import gelten die Zielprofile, Konfliktrangfolge und Klärungsdateien aus
  [80_Workflows/wissen-eintragen.md](80_Workflows/wissen-eintragen.md). Nur
  vereinbare Zielprofile dürfen zusammengeführt werden.
- Formeln, Standardrechnungen und offizielle Formelsammlungen werden nach
  `REGELN.md` und dem Importworkflow behandelt; erfinde keine Quellenlinks.
- Projektstatus sind `Idee`, `Geplant`, `In Arbeit`, `Wartet`, `Pausiert`,
  `Abgeschlossen` und `Verworfen`. `In Arbeit` benötigt einen konkreten nächsten
  Schritt; neue Projekte werden in der Projektübersicht ergänzt.
- Du darfst die thematische Struktur im betroffenen Bereich verständlich
  verbessern. Aktualisiere dabei interne Verweise und lasse sachfremde Bereiche
  unangetastet.
- Lösche oder überschreibe bestehende Inhalte nur auf ausdrücklichen Auftrag.

## Workflow-Auswahl

- `Wissen eintragen` → `80_Workflows/wissen-eintragen.md`
- `Was weiß ich über <Thema>?` → `80_Workflows/wissen-abfragen.md`
- `Zeige mir den Originaleintrag zu <Thema>` →
  `80_Workflows/originaleintrag-anzeigen.md`
- `Zeige mir alle Schlüssel oder Sicherheitssachen in der Datenbank an` →
  `80_Workflows/sicherheit-auflisten.md`
- `Prüfe die Wissensdatenbank` → `80_Workflows/wissensdatenbank-pruefen.md`

Eindeutig sinngleiche Formulierungen gelten ebenfalls. Das bloße Ablegen von
Dateien startet keinen Workflow. Bei unklarer Zuordnung frage nach, bevor ein
schreibender Workflow beginnt.

## Sicherheit und Datenschutz

- `Sicherheit` und alle Unterordner sind eine Blackbox. Lies ausschließlich
  Datei- und Ordnernamen, niemals Inhalte, Vorschauen, Suchtreffer, Hashwerte,
  Größen, Zeitstempel, Berechtigungen oder andere Metadaten. Verwende
  Sicherheitsdateien nicht als Wissen oder Quelle.
- Eine vom Benutzer ausdrücklich bezeichnete Sicherheitsdatei darf nach
  [80_Workflows/Werkzeuge/sicherheitsdateien.md](80_Workflows/Werkzeuge/sicherheitsdateien.md)
  ungeöffnet verschoben werden. Bewahre den Dateinamen exakt; bei einer
  Namenskollision frage nach, statt zu überschreiben oder umzubenennen.
- Sicherheitsdateien werden nicht von Git erfasst, nicht archiviert und nicht in
  aktive Einträge, Protokolle oder Klärungsdateien übernommen.
- Öffne eine nur vermutlich geheimnishaltige Eingangsdatei nicht. Lass sie bis
  zur Einordnung durch den Benutzer im Eingang und melde ausschließlich ihren
  Namen.
- Speichere personenbezogene Daten nur, wenn sie für den Auftrag erforderlich
  sind, und weise vor Veröffentlichungen auf private Inhalte hin.

## Git und Änderungen

- Vermische eigene Änderungen nicht mit bestehenden Benutzeränderungen.
- Committe oder pushe nur auf ausdrücklichen Wunsch des Benutzers.
- Prüfe vor einem Commit die betroffenen Dateien und danach den Git-Status.
- Verwende bei verlangten Commits verständliche Commit-Texte.
