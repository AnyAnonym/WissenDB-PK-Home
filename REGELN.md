# Regeln für die Wissensdatenbank

## Metadaten

- Zuletzt geändert: 2026-08-07

## Geltung und Prioritäten

- `AGENTS.md` enthält die ständige Orientierung, diese Datei die allgemeinen
  Datenbankregeln und der passende Workflow den konkreten Ablauf. Workflows
  dürfen diese Regeln nicht abschwächen oder ihnen widersprechen.
- Sicherheits- und Archivgrenzen haben Vorrang vor normalen Importregeln.
- Der Benutzer bestimmt Ziel, Struktur und persönliche Angaben. Überprüfbare
  externe Tatsachen richten sich nach verlässlichen Quellen. Abweichungen werden
  als Konflikt dokumentiert und nicht still überschrieben.

## Eingang und Import

- `00_Eingang` ist eine Warteschlange. Das Ablegen allein startet keinen Import;
  erst `Wissen eintragen` oder eine sinngleiche Aufforderung führt
  [80_Workflows/wissen-eintragen.md](80_Workflows/wissen-eintragen.md) aus.
  `KLAERUNGSBEDARF_*.md`-Dateien sind Arbeitsnotizen, keine Wissensquellen.
- Reguläre, unterstützte Quelldateien werden vollständig gelesen und
  selbstständig beschrieben. Sicherheits-, nicht lesbare und nicht sicher
  verarbeitbare Dateien sind davon ausgenommen.
- Quelle und mögliches Ziel erhalten vor einer Zusammenführung ein Zielprofil aus
  den fachlich relevanten Identitätsmerkmalen. Technische Felder sind nur bei
  passenden Themen erforderlich; unbekannte Werte werden nicht geraten. Nur
  vereinbare Profile werden zusammengeführt, abweichende Varianten bleiben
  getrennt.
- Trotz Unstimmigkeiten werden alle fachlich vertretbaren, quellengetragenen
  Einträge angelegt. Unsicherheiten bleiben `unbekannt` oder `offen`; spekulative
  Varianten und ungesicherte Tatsachen werden nicht erfunden.
- Benötigt eine materielle Unstimmigkeit eine Benutzerentscheidung, entsteht nach
  `70_Vorlagen/Klaerungsbedarf.md` eine Klärungsdatei mit Ort, Zeitpunkt,
  Beobachtung, vorläufigem Vorgehen und konkreter Rückfrage. Nach der Antwort
  werden Anweisung und Umsetzung dokumentiert und der Status auf `Erledigt`
  gesetzt. Löschen oder Verschieben erfolgt nur auf ausdrücklichen Auftrag.
- Externe Dateien werden nur auf ausdrücklichen Wunsch ins Repository kopiert.
  Das bewusste Ablegen im Eingang gilt als solcher Wunsch, aber niemals als
  Erlaubnis zum Öffnen oder Archivieren einer Sicherheitsdatei.

## Aktiver Wissensbestand

- Aktive Einträge müssen ohne ursprünglichen Chat, Eingang und Archiv vollständig
  verständlich sein. Sie verwenden keine Eingangs- oder Archivpfade als Quellen;
  der ursprüngliche Dateiname darf ohne Pfad unter `Herkunft` stehen.
- Verwende passende Vorlagen, konsolidiere kompatible Erkenntnisse und trenne
  Tatsachen, Annahmen, Konflikte, zeitabhängige Angaben und offene Fragen.
  Zielabhängige Einträge übernehmen ihr Zielprofil als Metadatenkarte.
- Neue Einträge erhalten `Erstellt` und `Zuletzt geändert`. `Erstellt` bleibt
  unverändert; nur inhaltliche Änderungen aktualisieren `Zuletzt geändert` auf
  das lokale Datum. Reine Lesezugriffe ändern keine Metadaten.
- Öffentlich zuverlässig verfügbare Formeln und Standardrechnungen werden nicht
  unnötig dupliziert. Erkläre Bedeutung, Voraussetzungen, Anwendung und Lösungsweg
  und erfinde keine Quellenlinks. Wichtige offizielle Formelsammlungen bleiben als
  unveränderte Originale erhalten, werden aktiv aber nicht als Archivdatei
  verlinkt.

## Archiv

- Erfolgreich verarbeitete Originale werden im Importworkflow unverändert und mit
  ihrer relativen Struktur unter
  `90_Archiv/Importe/JJJJ-MM-TT_HHMMSS/Originale/` abgelegt. Jeder Lauf erhält ein
  `IMPORTPROTOKOLL.md` nach den Vorgaben des Workflows.
- Dokumentierte Unstimmigkeiten verhindern die Archivierung nicht, wenn alle
  fachlich vertretbaren Einträge erstellt und Unsicherheiten sichtbar sind.
  Nicht sicher verarbeitbare Quellen bleiben im Eingang; bestätigte
  Sicherheitsdateien werden stattdessen ungeöffnet nach den Sicherheitsregeln
  verschoben.
- Das Archiv ist kein Wissensersatz. Abgeschlossene Läufe werden nur auf
  ausdrücklichen Benutzerwunsch oder zur Wiederherstellung verlorenen oder
  beschädigten Wissens geöffnet. Nur eine selbstständig veranlasste
  Wiederherstellung wird mit „Archiv nur im Notfall herangezogen“, Grund und
  Datum dokumentiert.
- Archivierte Originale und andere bestehende Inhalte werden nur auf
  ausdrücklichen Auftrag verändert oder gelöscht.

## Projekte und Struktur

- Projektstatus sind `Idee`, `Geplant`, `In Arbeit`, `Wartet`, `Pausiert`,
  `Abgeschlossen` und `Verworfen`. `In Arbeit` benötigt einen konkreten nächsten
  Schritt; neue Projekte werden in `20_Projekte/PROJEKTUEBERSICHT.md` ergänzt.
- Die Struktur darf im betroffenen Bereich verständlich verbessert werden.
  Aktualisiere interne Verweise, vermeide unnötige Hierarchietiefe und lasse
  sachfremde Bereiche unangetastet. Löschen und Überschreiben erfordern einen
  ausdrücklichen Auftrag.
- Rechnerspezifische Pfade, Programmeinstellungen und lokale Zugriffswege werden
  immer mit dem Namen des zugehörigen Geräts dokumentiert und nicht ungeprüft auf
  andere Rechner übertragen. Die derzeit dokumentierten lokalen Angaben gelten
  für **Lap21 von Kilian**; weitere Geräte erhalten eigene Zuordnungen.

## OneDrive-Zugriff

- Vor jedem Zugriff auf einen OneDrive-Ordner ist
  [80_Workflows/Werkzeuge/onedrive-zugang.md](80_Workflows/Werkzeuge/onedrive-zugang.md)
  vollständig zu lesen und zu beachten. Die dokumentierten lokalen Pfade gelten
  für **Lap21 von Kilian**.
- Folgende OneDrive-Ordner sind unabhängig von ihrer Hierarchieebene gesperrt:
  Ordner, deren Name mit `Microsoft` beginnt, Ordner mit `TANZ` im Namen sowie
  die Ordner `Aufnahmen`, `Besprechungen` und `Programming - Minecraft`.
- Ein gesperrter Ordner darf ausschließlich anhand seines Namens im
  übergeordneten Verzeichnis als gesperrt erkannt werden. Er darf nicht betreten,
  geöffnet, aufgelistet, durchsucht, als Vorschau angesehen oder anderweitig
  untersucht werden. Inhalte und weitere Metadaten daraus dürfen nicht erhoben
  oder verwendet werden.
- OneDrive-Ordner namens `Sicherheit` und ihre Unterordner sind ebenfalls eine
  Blackbox. Bei mysteriösen oder potenziell sicherheitsrelevanten OneDrive-Dateien
  darf nur der Dateiname gelesen und für eine vom Benutzer erlaubte Zuordnung
  verwendet werden; der Inhalt bleibt ungeöffnet und unverändert.
- OneDrive-Dateien und -Ordner werden nur auf einen ausdrücklichen, zum konkreten
  Schreibvorgang passenden Auftrag erstellt, verändert, verschoben, umbenannt,
  kopiert, hochgeladen oder gelöscht. Namenskollisionen werden nicht durch
  Überschreiben oder eigenmächtiges Umbenennen gelöst.

## Sicherheitsbereich

- `Sicherheit` und alle Unterordner sind eine Blackbox. Ein KI-Assistent darf nur
  Datei- und Ordnernamen lesen, niemals Inhalte, Vorschauen, Volltextsuchen,
  Hashwerte, Größen, Zeitstempel, Berechtigungen oder andere Metadaten.
- Eine nur vermutlich geheimnishaltige Datei bleibt ungeöffnet im Eingang. Eine
  ausdrücklich bezeichnete Sicherheitsdatei darf nach
  [80_Workflows/Werkzeuge/sicherheitsdateien.md](80_Workflows/Werkzeuge/sicherheitsdateien.md)
  ungeöffnet verschoben werden. Ihr Name bleibt exakt; bei einer Namenskollision
  wird nachgefragt, nicht überschrieben oder umbenannt.
- Sicherheitsdateien werden nicht in Git, Archiv, aktive Einträge,
  Importprotokolle oder Klärungsdateien übernommen.

## Pimminger-Dev-Zugriff

- Vor jedem Zugriff auf den Pimminger-Entwicklungsbestand ist
  [80_Workflows/Werkzeuge/pimminger-dev-zugang.md](80_Workflows/Werkzeuge/pimminger-dev-zugang.md)
  vollständig zu lesen und zu beachten.
- Auf **Lap21 von Kilian** beginnt die einzige erlaubte Quellwurzel exakt bei
  `C:\Users\PK\Pimminger\PiPA2KTStorage - Dev`. Der Elternordner
  `C:\Users\PK\Pimminger` und alle Nachbarordner dürfen nicht aufgelistet,
  durchsucht, geöffnet oder anderweitig untersucht werden.
- Der Zugriff ist normalerweise ausschließlich lesend. Ohne ausdrücklichen,
  konkreten Auftrag werden aus dem Entwicklungsbestand weder Inhalte verändert
  noch Programme, Skripte, Builds, Tests, Installationen, Datenbankzugriffe oder
  Netzwerkverbindungen ausgeführt.

## Workflows und Qualität

- Die bestätigten Befehle stehen in
  [80_Workflows/README.md](80_Workflows/README.md). Der passende Workflow wird
  vollständig gelesen und ausgeführt.
- `Originaleintrag` bezeichnet eine aktive Datenbankdatei, nicht eine archivierte
  Quelldatei. Lesende Workflows verändern ohne zusätzlichen Auftrag weder Inhalte
  noch Metadaten.
- Änderungen werden nachvollziehbar, quellenbezogen und in verständlichem Deutsch
  formuliert.
