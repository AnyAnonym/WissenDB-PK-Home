# Regeln für die Wissensdatenbank

Diese Regeln gelten für Menschen sowie für Werkzeuge wie Codex und OpenCode.

1. Neue Dateien, deren Wissen übernommen werden soll, kommen in `00_Eingang`.
   Dieser Ordner ist eine Warteschlange und kein dauerhafter Ablageort.
2. Das Ablegen allein startet keine Verarbeitung. Die Aufforderung „neues Wissen
   eintragen“ oder eine sinngleiche Formulierung startet einen vollständigen
   Importlauf nach `AGENTS.md`.
3. Jede Eingangsdatei wird einzeln zusammengefasst und anschließend mit dem
   relevanten vorhandenen Wissen verglichen.
4. Neue Erkenntnisse werden in passende bestehende Einträge integriert. Nur wenn
   kein passender Eintrag existiert, wird mit einer geeigneten Vorlage aus
   `70_Vorlagen` ein neuer angelegt. Unnötige Dubletten sind zu vermeiden.
5. Widersprüche werden mit Quelle und Datum sichtbar dokumentiert und nicht still
   überschrieben. Fehlende Angaben werden als unbekannt oder offen markiert.
6. Erfolgreich verarbeitete Originaldateien werden unverändert unter
   `90_Archiv/Importe/JJJJ-MM-TT_HHMMSS/Originale/` archiviert. Ihre relative
   Struktur aus dem Eingang bleibt erhalten.
7. Jeder Importlauf erhält unter seinem Zeitstempel eine Datei
   `IMPORTPROTOKOLL.md` mit Einzelzusammenfassungen, Bearbeitungsstatus,
   Merge-Zielen, Konflikten und offenen Fragen.
8. Eine Datei wird erst aus `00_Eingang` verschoben, wenn Zusammenfassung,
   Wissensübernahme, Quellverweis und Protokoll geprüft sind. Bei Fehlern bleibt
   sie im Eingang und der Benutzer erhält einen Hinweis.
9. Archivierte Originale werden nicht verändert oder gelöscht. Bestehende Inhalte
   werden ebenfalls nicht ohne ausdrücklichen Auftrag gelöscht.
10. Der KI-Assistent darf die thematische Ordnerstruktur eigenständig wählen und
    verbessern. Er darf dazu betroffene Ordner und Dateien anlegen, umbenennen,
    verschieben oder sinnvoll zusammenführen. Die Hierarchie und ihre Namen müssen
    für Menschen logisch nachvollziehbar bleiben; interne Verweise sind bei
    Änderungen anzupassen.
11. Projektstatus sind: `Idee`, `Geplant`, `In Arbeit`, `Wartet`, `Pausiert`,
    `Abgeschlossen` und `Verworfen`.
12. Ein Projekt mit dem Status `In Arbeit` besitzt einen konkreten nächsten Schritt.
13. Externe Dateien werden nur auf ausdrücklichen Wunsch in das Repository kopiert.
    Das bewusste Ablegen durch den Benutzer in `00_Eingang` gilt als solcher Wunsch.
14. Passwörter, Zugangsdaten und andere Geheimnisse werden weder in Wissen noch
    Archiv übernommen. Verdächtige Dateien bleiben ungeändert im Eingang und
    werden dem Benutzer gemeldet.
15. Änderungen sollen nachvollziehbar, quellenbezogen und in verständlichem
    Deutsch sein.
