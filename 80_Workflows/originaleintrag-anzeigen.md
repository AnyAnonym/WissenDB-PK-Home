# Workflow: Originaleintrag anzeigen

## Auslöser

- `Zeige mir den Originaleintrag zu <Thema>`
- `Gib mir den Originaleintrag zu <Thema>`
- Eindeutig sinngleiche Aufforderungen, den vollständigen Inhalt eines
  bestehenden Datenbankeintrags anzuzeigen

## Zweck

Den unveränderten Originalinhalt genau einer aktiven Datei der Wissensdatenbank
anzeigen. Unter dem Dateiinhalt wird als letzte Zeile der vollständige lokale
Pfad dieser Datei genannt.

## Geltungsbereich

- Durchsuche ausschließlich die aktiven Bereiche `10_Wissen`, `20_Projekte`,
  `30_Anleitungen`, `40_Personen_und_Kontakte`, `50_Dokumentation` und
  `60_Quellen`.
- Verwende weder das Internet noch `00_Eingang` oder `90_Archiv`.
- Vorlagen, Workflows und Steuerungsdateien sind keine Originaleinträge im Sinne
  dieses Workflows.
- Dieser Workflow ist vollständig lesend und verändert keine Datei oder Metadaten.

## Ablauf

1. Rufe [Werkzeuge/originaleintrag-anzeigen.ps1](Werkzeuge/originaleintrag-anzeigen.ps1)
   mit dem Thema als `-Suchbegriff` und dem nach
   [Werkzeuge/wissenssuche.md](Werkzeuge/wissenssuche.md) kleinsten plausiblen
   `-Startpfad` auf. Erweitere den Startpfad nur bei Bedarf.
2. Wenn genau eine Datei eindeutig passt, wähle diese aus.
3. Wenn mehrere Dateien infrage kommen, gib nur eine kurze Auswahlliste mit den
   jeweiligen relativen Pfaden aus und bitte den Benutzer um eine eindeutige
   Auswahl. Gib in diesem Schritt noch keinen Dateiinhalt aus.
4. Wenn keine Datei passt, melde dies knapp und erfinde keinen Eintrag oder Pfad.
5. Rufe das Skript nach einer Auswahl erneut mit `-Pfad` auf. Es liest die Datei
   und erzeugt den ausgabefertigen Codeblock. Lies die Datei nicht zusätzlich ein.
6. Übernimm die Skriptausgabe ohne Zusammenfassung, Korrektur, Umformulierung,
   Auslassung oder Zeilennummern. Sie enthält zuerst den gesamten Dateiinhalt in
   einem Codeblock und unmittelbar darunter als letzte Zeile:
   `Pfad: <vollständiger absoluter Dateipfad>`

## Ausgaberegeln

- Vor dem Dateiinhalt steht keine fachliche Einleitung.
- Nach der Pfadzeile folgt kein weiterer Text.
- Die Skriptausgabe wird unverändert als Antwort verwendet.
- Reicht eine einzelne Antwort technisch nicht für den vollständigen Inhalt aus,
  wird er ohne Auslassungen in fortlaufend nummerierten Teilen ausgegeben. Die
  Pfadzeile erscheint ausschließlich ganz unten im letzten Teil.
- Der genannte Pfad muss auf die tatsächlich gelesene aktive Datei zeigen.
