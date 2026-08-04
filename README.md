# WissenDB-PK-Home

Persönliche Wissensdatenbank für zuhause.

Die Inhalte werden hauptsächlich als Markdown-Dateien gespeichert. Neue
Quelldateien können ohne Vorsortierung in `00_Eingang` abgelegt werden. Ein
KI-Assistent fasst sie auf Anforderung zusammen, gleicht sie mit dem vorhandenen
Wissen ab, führt die Erkenntnisse thematisch zusammen und archiviert danach die
unveränderten Originale.

Die zentrale Arbeitsanweisung für KI-Assistenten steht in
[AGENTS.md](AGENTS.md), die verbindlichen Kurzregeln in
[REGELN.md](REGELN.md).

## Workflow für neues Wissen

1. Beliebige zu verarbeitende Dateien in `00_Eingang` ablegen. Unterordner sind
   erlaubt und bleiben beim Archivieren erhalten.
2. Codex oder einen anderen eingewiesenen KI-Assistenten zum Beispiel so
   beauftragen:

   > Trage das neue Wissen aus `00_Eingang` ein.

3. Der Assistent liest jede unterstützte Datei und erstellt pro Datei eine
   Zusammenfassung.
4. Er vergleicht die Inhalte mit dem vorhandenen Bestand. Ergänzungen werden in
   passende Wissenseinträge eingearbeitet; nur für wirklich neue Themen entstehen
   neue Einträge. Dubletten werden nicht als separates Wissen abgelegt und
   Widersprüche werden sichtbar gekennzeichnet.
5. Nach erfolgreicher Prüfung verschiebt der Assistent die unveränderten
   Originaldateien in einen datierten Archivlauf und meldet das Ergebnis.

Das Verwalten der genauen Themenstruktur übernimmt der Assistent eigenständig.
Wenn es die Übersicht verbessert, darf er für das betroffene Wissen Ordner und
Dateien anlegen, umbenennen, verschieben oder zusammenführen. Dabei aktualisiert
er interne Verweise und dokumentiert die Umstrukturierung im Importprotokoll. Die
Struktur bleibt mit einer logischen Hierarchie und sprechenden Namen für Menschen
verständlich, damit Wissen auch bei einem Fehler ohne KI gefunden und geprüft
werden kann.

### Ergebnis eines Importlaufs

Ein Lauf vom 4. August 2026 um 14:30:05 Uhr sieht beispielsweise so aus:

```text
90_Archiv/
└── Importe/
    └── 2026-08-04_143005/
        ├── IMPORTPROTOKOLL.md
        └── Originale/
            ├── beispiel.pdf
            └── unterordner/
                └── notizen.docx
```

Das `IMPORTPROTOKOLL.md` macht den Lauf nachvollziehbar. Es enthält für jede
erfasste Datei die Zusammenfassung, den Bearbeitungsstatus, die neu erstellten
oder aktualisierten Zielartikel sowie Hinweise auf Dubletten, Konflikte und
offene Fragen. Die Wissenseinträge verweisen bei Bedarf auf die endgültige Datei
im Archiv.

Nicht lesbare, nicht unterstützte oder fehlerhaft verarbeitete Dateien bleiben in
`00_Eingang`. Dadurch geht bei einem unvollständigen Lauf nichts verloren. Auch
Dateien mit vermuteten Passwörtern, Zugangsschlüsseln oder anderen Geheimnissen
werden nicht übernommen, sondern zur manuellen Prüfung im Eingang belassen.

## Bereiche

- `00_Eingang`: Warteschlange für neue, noch nicht verarbeitete Dateien
- `10_Wissen`: dauerhaftes Wissen nach Themen
- `20_Projekte`: Vorhaben mit Ziel, Status und nächstem Schritt
- `30_Anleitungen`: Schritt-für-Schritt-Anleitungen und Checklisten
- `40_Personen_und_Kontakte`: Personen, Firmen und Ansprechpartner
- `50_Dokumentation`: Geräte, Verträge und eigene Systeme
- `60_Quellen`: Bücher, Internetquellen, Schulmaterial und sonstige Quellen
- `70_Vorlagen`: Vorlagen für einheitliche Einträge
- `90_Archiv`: nicht mehr aktive Inhalte und Originale abgeschlossener Importläufe

Bilder, PDFs und andere Dateien werden im Importworkflow nicht dupliziert: Nach
erfolgreicher Wissensübernahme werden die Originale aus `00_Eingang` in den
jeweiligen Archivlauf verschoben. Externe Dateien außerhalb des Repositorys
werden nur auf ausdrücklichen Wunsch kopiert.
