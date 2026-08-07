# Werkzeug: Pimminger-Dev-Zugang

## Zweck und Freigabe

Dieses Werkzeug regelt den Zugriff auf den lokal synchronisierten
Pimminger-Entwicklungsbestand. Er darf bei fachlich passenden Fragen oder auf
ausdrücklichen Benutzerwunsch ergänzend als Wissensquelle gelesen werden.

Der normale Zugriff ist ausschließlich lesend. Dateien und Ordner dürfen nur
nach einem ausdrücklichen, auf den konkreten Vorgang bezogenen Auftrag erstellt,
verändert, verschoben, umbenannt, kopiert oder gelöscht werden. Inhalte werden
nicht ohne ausdrücklichen Auftrag in die Wissensdatenbank übernommen.

## Verbindliche Quellwurzel

| Gerät | Bereich | Einzige erlaubte Quellwurzel |
|---|---|---|
| Lap21 von Kilian | Pimminger Dev | `C:\Users\PK\Pimminger\PiPA2KTStorage - Dev` |

Die Wissensquelle beginnt exakt bei `PiPA2KTStorage - Dev`. Der übergeordnete
Pfad `C:\Users\PK\Pimminger` und alle neben `PiPA2KTStorage - Dev` liegenden
Ordner gehören nicht zur freigegebenen Quelle.

## Strikte Zugriffsgrenzen

- Starte jede Auflistung, Suche und jeden Dateizugriff unmittelbar bei der oben
  genannten Quellwurzel oder einem eindeutig darunterliegenden Pfad.
- Liste, durchsuche, öffne oder inspiziere niemals den Elternordner
  `C:\Users\PK\Pimminger` oder einen seiner anderen Unterordner. Ermittle auch
  keine Namen, Inhalte, Vorschauen, Suchtreffer oder weiteren Metadaten der
  Nachbarordner.
- Verwende keine rekursive Suche, deren Startpfad oberhalb der erlaubten
  Quellwurzel liegt. Verwende keine Pfade mit `..`, um die Quellwurzel zu
  verlassen.
- Löse einen angeforderten Zielpfad vor dem Zugriff auf und prüfe, dass er
  entweder exakt der Quellwurzel entspricht oder mit der Quellwurzel und einem
  anschließenden Pfadtrenner beginnt.
- Folge keinen symbolischen Links, Junctions, Verknüpfungen oder sonstigen
  Verweisen aus der Quellwurzel hinaus. Kann die Grenze nicht sicher bestätigt
  werden, wird der Eintrag nicht geöffnet und der Benutzer informiert.
- Ein fehlender Treffer, ein Zugriffsfehler oder eine unklare Ordnerstruktur
  erlaubt keine Ausweitung der Suche auf Eltern- oder Nachbarordner.

## Zusätzliche Vorsicht im Entwicklungsbestand

- Beginne mit einer eng begrenzten Suche nach passenden Datei- und Ordnernamen.
  Öffne nur fachlich plausible Dateien und nur so weit, wie es der konkrete
  Auftrag erfordert.
- Führe keine Programme, Skripte, Makros, Builds, Tests, Installationen,
  Datenbankzugriffe oder Netzwerkverbindungen aus dem Entwicklungsbestand aus,
  solange dies nicht ausdrücklich und konkret beauftragt wurde.
- Öffne keine mutmaßlichen Geheimnis- oder Zugangsdaten-Dateien wie `.env`,
  private Schlüssel, Zertifikate, Token- oder Kennwortspeicher. Melde bei einem
  fachlich relevanten Fund ausschließlich den Dateinamen und frage vor jedem
  Inhaltszugriff nach.
- Verwende reine Leseverfahren, die keine Dateien, Zeitstempel, Arbeitsstände,
  Indizes, Caches oder sonstigen Nebenprodukte im Entwicklungsbestand verändern.
- Nenne bei einer Antwort den Dateinamen und einen verständlichen relativen Pfad
  ab `PiPA2KTStorage - Dev`, aber keine Zugangsdaten oder geheimen Inhalte.

## Zugriffsablauf

1. Lies diese Werkzeugdatei vor jedem Zugriff vollständig.
2. Setze die Quellwurzel direkt auf
   `C:\Users\PK\Pimminger\PiPA2KTStorage - Dev`; ermittle sie nicht durch eine
   Auflistung des Elternordners.
3. Prüfe die Pfadgrenze und beginne die Suche innerhalb der Quellwurzel mit der
   kleinstmöglichen fachlich plausiblen Teilstruktur.
4. Lies nur die zur Beantwortung erforderlichen, unkritischen Kandidaten.
5. Trenne in der Antwort Erkenntnisse aus der Wissensdatenbank und aus dem
   Pimminger-Dev-Bestand sichtbar.
6. Stoppe bei einer Grenzverletzung, einem unklaren Verweis oder fehlender
   Berechtigung und frage nach, statt den Suchbereich zu erweitern.

## Einrichtungsstand

- Stand: 2026-08-07
- Die exakte Quellwurzel wurde auf **Lap21 von Kilian** als vorhandener Ordner
  bestätigt.
- Bei der Bestätigung wurden weder der Elternordner noch Nachbarordner oder
  Inhalte der Quellwurzel aufgelistet beziehungsweise geöffnet.
