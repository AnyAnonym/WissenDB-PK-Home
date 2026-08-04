# Workflow: Quellen anzeigen

## Auslöser

- `Gib mir alle Quellen von <Thema>`
- Eindeutig sinngleiche Aufforderungen, sämtliche gespeicherten Quellen eines
  Themas aufzulisten

## Zweck

Alle in der Wissensdatenbank nachvollziehbaren Quellen zu einem Thema auflisten.
Neben öffentlichen, bibliografischen und aktiven lokalen Quellen werden auch die
zugehörigen unveränderten Originaldateien im Archiv genannt.

## Besondere Archivausnahme

Dieser Workflow ist eine ausdrücklich erlaubte Ausnahme vom normalen
Archivzugriffsverbot. Der Assistent darf:

- archivierte `IMPORTPROTOKOLL.md`-Dateien nach Thema, Zielpfad und ursprünglichem
  Dateinamen durchsuchen,
- die zugehörigen Dateien unter `Originale/` lokalisieren,
- diese Dateien mit vollständigem lokalem Pfad als Quellen auflisten.

Der Assistent darf die archivierten Originaldateien in diesem Workflow nicht als
Wissensersatz auswerten, ihren Text nicht zur fachlichen Antwort zusammenfassen
und keine aktiven Einträge daraus still ergänzen. Der Archivzugriff wird nicht als
Notfallzugriff gekennzeichnet, weil er hier ausdrücklich nur zur Quellenauflistung
erlaubt ist.

## Ablauf

1. Ermittle die relevanten aktiven Wissenseinträge zum Thema.
2. Sammle daraus alle Angaben unter `Quellen`, `Herkunft` und vergleichbaren
   Abschnitten.
3. Suche in den Importprotokollen nach den relevanten Zielpfaden, Themen und
   ursprünglichen Dateinamen.
4. Ordne gefundene Originaldateien dem Thema zu. Unsichere Zuordnungen werden
   ausdrücklich als unsicher bezeichnet.
5. Gib das Ergebnis getrennt aus:
   - öffentliche und bibliografische Quellen,
   - aktive lokale Quellenlisten oder Wissenseinträge,
   - archivierte Originaldateien.
6. Weise auf fehlende Dateien, widersprüchliche Zuordnungen und Quellenangaben
   ohne überprüfbaren Fundort hin.

## Qualitätsregel

Ein Archivverweis darf niemals eine unvollständige Wissensbeschreibung
rechtfertigen. Wenn ein aktiver Eintrag ohne die archivierte Datei nicht
verständlich oder praktisch nutzbar ist, wird dies als Qualitätsmangel gemeldet.
Je wichtiger die archivierte Quelle ist, desto ausführlicher muss der aktive
Wissenseintrag ihren nutzbaren Inhalt selbstständig beschreiben.

Dieser Workflow ist grundsätzlich lesend und verändert keine Datei.
