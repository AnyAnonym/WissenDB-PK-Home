# Werkzeug: OneDrive-Zugang

## Zweck und Freigabe

Dieses Werkzeug regelt den Zugriff auf die persönlichen und schulischen
OneDrive-Bestände von Kilian. Ein OneDrive-Bestand wird nur verwendet, wenn der
konkrete Auftrag den Zugriff erfordert oder der Benutzer ihn ausdrücklich
verlangt.

Der normale Zugriff ist lesend und beginnt mit Datei- und Ordnernamen. Dateien
werden nur geöffnet, wenn dies für den Auftrag erforderlich und nach den
Schutzgrenzen dieses Werkzeugs erlaubt ist. Dateien oder Ordner dürfen nur nach
einem ausdrücklichen, auf den konkreten Schreibvorgang bezogenen Auftrag erstellt,
verändert, verschoben, umbenannt, kommentiert, kopiert, hochgeladen oder gelöscht
werden. Das Kopieren von OneDrive-Inhalten in die Wissensdatenbank benötigt
ebenfalls einen ausdrücklichen Auftrag.

## Lokale OneDrive-Pfade

Die folgenden Angaben gelten für das Gerät **Lap21 von Kilian**. Unter dem
Windows-Benutzerkonto `PK` sind dort zwei OneDrive-Stämme lokal synchronisiert:

| Gerät | Bereich | Lokaler Pfad |
|---|---|---|
| Lap21 von Kilian | Schule | `C:\Users\PK\OneDrive - Linzer Technikum` |
| Lap21 von Kilian | Persönlich/Familie | `C:\Users\PK\OneDrive - Pimminger` |

Der Windows-Explorer kann den Benutzerordner lokalisiert als `C:\Benutzer\PK`
anzeigen. Für Skripte, Werkzeuge und direkte Dateizugriffe ist auf diesem Gerät
der tatsächliche Dateisystempfad `C:\Users\PK` zu verwenden.

## Verbindliche Schutzgrenzen

- Ordner, deren Name mit `Microsoft` beginnt, Ordner mit `TANZ` im Namen sowie
  die Ordner `Aufnahmen`, `Besprechungen` und `Programming - Minecraft` sind auf
  jeder Hierarchieebene gesperrt.
- Der Name eines gesperrten Ordners darf nur im übergeordneten Verzeichnis
  erkannt werden, damit der Ordner übersprungen werden kann. Der Ordner selbst
  darf nicht betreten, geöffnet, aufgelistet, durchsucht, als Vorschau angesehen
  oder anderweitig untersucht werden. Inhalte und weitere Metadaten daraus werden
  weder erhoben noch verwendet.
- OneDrive-Ordner namens `Sicherheit` und alle Unterordner sind eine Blackbox. Von
  ihnen dürfen ausschließlich Datei- und Ordnernamen gelesen werden, niemals
  Inhalte, Vorschauen, Volltextsuchen, Hashwerte, Größen, Zeitstempel,
  Berechtigungen oder andere Metadaten.
- Eine mysteriöse oder potenziell sicherheitsrelevante Datei wird nicht geöffnet.
  Nur ihr Dateiname darf zur Einordnung verwendet werden. Eine vom Benutzer
  erlaubte Verschiebung erhält den exakten Dateinamen; bei einer Namenskollision
  wird abgebrochen und nachgefragt.
- Verweise werden nicht in andere OneDrive-Stämme oder außerhalb des ausdrücklich
  ausgewählten Stamms verfolgt. Zugangsdaten, Zugriffstoken, Sitzungsdaten und
  Freigabe-URLs mit eingebetteten Berechtigungsparametern werden nicht im
  Repository gespeichert.

## Zugriffsablauf

1. Bestimme anhand des Auftrags den passenden OneDrive-Stamm und prüfe, dass der
   aufgelöste Pfad innerhalb dieses Stamms liegt.
2. Prüfe vor jeder Verzeichnisauflistung den Ordnernamen gegen die verbindlichen
   Schutzgrenzen. Überspringe gesperrte Ordner vollständig.
3. Suche bei Wissensfragen zuerst thematisch passend und sparsam im aktiven
   Bestand der Wissensdatenbank nach
   [wissenssuche.md](wissenssuche.md). Ergänze OneDrive nur, soweit der Auftrag
   dies erfordert.
4. Beginne sparsam mit passenden Datei- und Ordnernamen. Öffne nur fachlich
   plausible, nicht gesperrte Dateien und nur so weit, wie der Auftrag es
   erfordert.
5. Verwende nach Möglichkeit reine Lese- oder Exportfunktionen. Öffne Dateien
   nicht in einer Anwendung, die beim Anzeigen automatisch Änderungen oder neue
   Versionen speichern könnte.
6. Prüfe vor einem erlaubten Schreibvorgang Quelle, Ziel und mögliche
   Namenskollisionen ausschließlich im erforderlichen Bereich. Verändere keine
   Dateiinhalte, wenn nur eine strukturelle Ablage beauftragt wurde.
7. Kennzeichne bei einer inhaltlichen Antwort, welche Aussagen aus der
   Wissensdatenbank und welche aus OneDrive stammen. Nenne für OneDrive-Quellen
   den Dateinamen und einen verständlichen relativen Pfad, aber keine
   Zugangsdaten oder Freigabetoken.
8. Ist eine relevante Datei nicht lesbar oder fehlt der Zugriff, melde den
   konkreten Zugriffsbedarf. Umgehe fehlende Berechtigungen nicht.

## Einrichtungsstand

- Stand: 2026-08-06
- Beide OneDrive-Stämme wurden auf **Lap21 von Kilian** anhand der lokalen
  Windows-Explorer-Ansicht und der synchronisierten Dateisystempfade bestätigt.
- Eine authentifizierte Microsoft-365-, SharePoint- oder Microsoft-Graph-
  Verbindung ist nicht dokumentiert. Der lokale synchronisierte Bestand ist der
  vorgesehene Zugriffsweg.
