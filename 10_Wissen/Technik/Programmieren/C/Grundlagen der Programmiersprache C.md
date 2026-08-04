# Grundlagen der Programmiersprache C

## Kurzfassung

Der importierte C-Kurs ist eine schulische Einführung mit Microsoft Visual Studio. Er behandelt den Weg vom ersten Konsolenprogramm bis zu Funktionen, Zeigern, Arrays, Strukturen, Dateien, Bitoperationen und dynamischem Speicher.

## Fachzuordnung

Die Stundentafel ordnet C dem technischen Pflichtgegenstand „Fachspezifische Informationstechnik“ zu. C wird im ersten und zweiten Jahr behandelt; im dritten Jahr folgen hardwarenahe Programmierung in C und Mikrocontroller.

## Lernpfad

1. Entwicklungsumgebung, Übersetzen und Ausführen verstehen.
2. Variablen, Datentypen, Operatoren sowie Ein- und Ausgabe sicher verwenden.
3. Programmfluss mit Bedingungen, Auswahl und Schleifen steuern.
4. Fehler mit Debugger, Haltepunkten und schrittweiser Ausführung untersuchen.
5. Programme mit Funktionen strukturieren; Parameter, Rückgabewerte und Rekursion einordnen.
6. Speicherbezug durch Zeiger, Arrays und Zeichenketten verstehen.
7. Eigene Datentypen mit Aufzählungen und Strukturen modellieren.
8. Dateien, Bits und dynamischen Speicher erst mit sicherer Fehler- und Grenzfallbehandlung einsetzen.

## Wichtige Einordnung

- Der Kurs verwendet teilweise Microsoft-spezifische Funktionen wie die `_s`-Varianten der formatierten Eingabe und Windows-Konsolenfunktionen. Solcher Code ist nicht ohne Anpassung auf andere Plattformen übertragbar.
- Manche Beispiele werden in einer C++-Projektumgebung kompiliert. C und C++ sind verwandte, aber eigenständige Sprachen; Compiler-Modus und Dateiendung müssen zum Lernziel passen.
- Ein portables, standardkonformes Programm verwendet für den Programmeinstieg `int main(...)`. Die im Kurs vorkommende Schreibweise `void main` ist nicht der portable C-Standard.
- Bei Eingaben, Zeigern, Zeichenketten, Dateien und dynamischem Speicher sind Rückgabewerte, Grenzen und Freigaben ausdrücklich zu prüfen.

## Praktische Arbeitsweise

- Mit kleinen, kompilierbaren Schritten arbeiten und Warnungen ernst nehmen.
- Variablen initialisieren und Gültigkeitsbereiche möglichst klein halten.
- Jede Schleife auf Start, Fortsetzungsbedingung und Fortschritt prüfen.
- Funktionen nach einer klaren Aufgabe benennen und Ein-/Ausgaben dokumentieren.
- Fehlerfälle genauso testen wie den Normalfall.

## Herkunft und abgedeckter Umfang

- `C-Kurs 2024-12-01.pdf`: vollständiger schulischer Lernpfad von den Grundlagen bis zu Dateien, Bitoperationen und dynamischem Speicher
- `HTL_Elektrotechnik-Stundentafel.pdf`: Einordnung von C in die Fachspezifische Informationstechnik

## Quellen

- Microsoft Learn, [main-Funktion und Programmausführung](https://learn.microsoft.com/de-de/cpp/c-language/main-function-and-program-execution), geprüft am 2026-08-04.
- Kursinhalt und Beispiele: schulischer C-Kurs, Fassung 2024-12-01; die wesentlichen Themen und Besonderheiten sind oben beschrieben.
- Schulische Fachzuordnung: undatierte Stundentafel der elektrotechnischen Ausbildung, erfasst am 2026-08-04.

## Metadaten

- Bereich: Technik / Programmieren / C
- Erstellt: 2026-08-04
- Überprüft: 2026-08-04
- Status: aktuell
