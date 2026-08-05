# Werkzeug: Token-sparende Wissenssuche

## Zweck

Aktive Wissensdateien mit möglichst wenig Verzeichnis- und Dateiausgabe finden,
ohne relevante Treffer zu übersehen. Die Suche wird stufenweise erweitert und
gibt zunächst nur passende Pfade aus. Dateiinhalte werden erst gelesen, wenn ein
Pfad fachlich als Kandidat feststeht.

## Suchrouting

Ordne das Anliegen zuerst nach Gegenstand und gewünschtem Eintragstyp ein. Beginne
in den kleinsten plausiblen Bereichen:

| Anliegen | Primärer Startbereich | Mögliche Ergänzung |
|---|---|---|
| Alltag | `10_Wissen/Alltag` | `30_Anleitungen` |
| Finanzen | `10_Wissen/Finanzen` | `50_Dokumentation` |
| Lernen oder Lernstoff | `10_Wissen/Lernen` | `60_Quellen/Schule` |
| Technisches Wissen | `10_Wissen/Technik` | `30_Anleitungen/Technik`, `50_Dokumentation` |
| Projekt oder Vorhaben | `20_Projekte/PROJEKTUEBERSICHT.md` | passender Projektordner unter `20_Projekte` |
| Anleitung oder Checkliste | `30_Anleitungen` | fachlich passender Wissensbereich |
| Person, Firma oder Ansprechpartner | `40_Personen_und_Kontakte` | fachlich verknüpfter aktiver Bereich |
| Gerät, Vertrag oder eigenes System | `50_Dokumentation` | `10_Wissen`, `30_Anleitungen` |
| Buch, Internetseite, Schulmaterial oder Quelle | passender Unterordner unter `60_Quellen` | fachlich verknüpfter aktiver Bereich |

Bei Überschneidungen bestimmt die gesuchte Eintragsart die Reihenfolge. Ein
Gerätehandbuch beginnt zum Beispiel in `50_Dokumentation`, eine allgemeine
technische Erklärung in `10_Wissen/Technik`.

## Stufenfolge

1. Bilde aus dem Thema einen kleinen Suchausdruck mit der genannten Schreibweise,
   eindeutigen Abkürzungen und höchstens wenigen naheliegenden Varianten.
2. Nutze die Routingtabelle und vorhandene Übersichtsdateien. Liste nicht zuerst
   den gesamten Verzeichnisbaum auf.
3. Suche im primären Startbereich zunächst nur nach passenden Dateinamen. Begrenze
   die ausgegebenen Kandidaten auf eine kleine, überprüfbare Menge.
4. Reicht der Dateiname nicht aus, führe im selben Bereich eine Volltextsuche aus,
   die nur die Namen der Dateien mit Treffern ausgibt. Gib keine Trefferzeilen oder
   ganzen Dateien als Suchergebnis aus.
5. Lies nur fachlich plausible Kandidaten vollständig. Folge ihren internen
   Verweisen nur, wenn diese für das Thema relevant sind und in einen erlaubten
   aktiven Bereich führen.
6. Fehlt ein eindeutiger oder ausreichender Treffer, wiederhole die Dateinamen-
   und danach die pfadbasierte Volltextsuche in den in der Tabelle genannten
   Ergänzungsbereichen.
7. Erweitere erst als letzte Stufe auf alle für den jeweiligen Workflow erlaubten
   aktiven Wissensbereiche. Auch dann werden zunächst ausschließlich passende
   Dateipfade ausgegeben.

## Suchdisziplin

- Verwende für Dateilisten bevorzugt `rg --files` und für die Inhaltssuche eine
  Ausgabe ausschließlich passender Dateinamen, beispielsweise `rg -l`.
- Kombiniere eindeutige Schreibvarianten möglichst in einem Suchlauf, statt für
  jede Variante den Verzeichnisbestand erneut auszugeben.
- Begrenze Zwischenausgaben. Erweitere die Suche, wenn die begrenzte Kandidatenliste
  keine sichere Auswahl oder vollständige Wissensabfrage erlaubt.
- Eine leere Suche im primären Bereich ist kein Beleg dafür, dass in der gesamten
  Wissensdatenbank nichts gespeichert ist. Melde einen fehlenden Eintrag erst nach
  der letzten zulässigen Suchstufe.
- Durchsuche niemals `00_Eingang`, `70_Vorlagen`, `80_Workflows`, `90_Archiv` oder
  `Sicherheit` als Wissensquelle. Der Bereich `Sicherheit` bleibt vollständig von
  dieser Suche ausgeschlossen.
- Die Suche ist lesend und ändert keine Inhalte oder Metadaten.

## Pflege

Wenn sich die thematische Ordnerstruktur ändert, aktualisiere die betroffene Zeile
der Routingtabelle und die Verweise in den aufrufenden Workflows. Eine vollständige
Liste aller Dateien wird bewusst nicht gepflegt, da sie schnell veraltet.
