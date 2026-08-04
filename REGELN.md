# Regeln für die Wissensdatenbank

Diese Regeln gelten für Menschen sowie für Werkzeuge wie Codex und OpenCode.

1. Neue Dateien, deren Wissen übernommen werden soll, kommen in `00_Eingang`.
   Dieser Ordner ist eine Warteschlange und kein dauerhafter Ablageort.
2. Das Ablegen allein startet keine Verarbeitung. Die Aufforderung `Wissen
   eintragen` oder eine sinngleiche Formulierung startet den vollständigen Ablauf
   nach `80_Workflows/wissen-eintragen.md`.
3. Jede Eingangsdatei wird vollständig gelesen, ausführlich beschrieben und
   anschließend mit dem relevanten vorhandenen Wissen verglichen. Die
   Beschreibung muss für den normalen Gebrauch ohne Originaldatei ausreichen.
4. Neue Erkenntnisse werden in passende bestehende Einträge integriert. Nur wenn
   kein passender Eintrag existiert, wird mit einer geeigneten Vorlage aus
   `70_Vorlagen` ein neuer angelegt. Unnötige Dubletten sind zu vermeiden.
5. Widersprüche werden mit Quelle und Datum sichtbar dokumentiert und nicht still
   überschrieben. Fehlende Angaben werden als unbekannt oder offen markiert.
6. Aktive Einträge dürfen weder Eingangs- noch Archivpfade als Quellen oder
   weiterführende Lesestellen verwenden. Ein sonst notwendiger Dateiverweis wird
   durch eine vollständigere Beschreibung ersetzt. Der ursprüngliche Dateiname
   darf zur Herkunft genannt werden, ohne Pfad und ohne Abhängigkeit vom Original.
7. Online zuverlässig verfügbare Formeln, Formeltabellen und vorgerechnete
   Standardbeispiele werden nicht massenhaft in Wissenseinträge übernommen.
   Stattdessen werden Bedeutung, Anwendung, Voraussetzungen und Lösungsweg
   vollständig erklärt und konkrete Formeln nach Möglichkeit über verlässliche
   öffentliche Quellen belegt. Nicht geprüfte Links dürfen nicht erfunden werden.
8. Offizielle schulische Formelsammlungen, insbesondere die für die Matura
   benötigte Formelsammlung, bleiben als unveränderte Originalquellen erhalten.
   Sie dürfen nicht als vermeintliche Dublette entfernt werden, auch wenn ihre
   Formeln online verfügbar sind. Aktive Einträge verweisen nicht auf das
   archivierte Exemplar, sondern beschreiben Aufbau, Themenumfang,
   Zulassungskontext und Verwendung selbstständig.
9. Erfolgreich verarbeitete Originaldateien werden unverändert unter
   `90_Archiv/Importe/JJJJ-MM-TT_HHMMSS/Originale/` archiviert. Ihre relative
   Struktur aus dem Eingang bleibt erhalten.
10. Das Archiv dient nur der unveränderten Aufbewahrung und nicht als Ersatz für
    aktive Wissenseinträge. Der Workflow `Gib mir alle Quellen von <Thema>` darf
    Importprotokolle durchsuchen und archivierte Originaldateien ausschließlich
    als Quellen auflisten. Er wertet ihren Inhalt nicht als Wissensersatz aus.
11. Jeder Importlauf erhält unter seinem Zeitstempel eine Datei
    `IMPORTPROTOKOLL.md` mit ausführlichen Einzelbeschreibungen,
    Bearbeitungsstatus, Merge-Zielen, Konflikten und offenen Fragen. Das Protokoll
    ist interne Archivmetadokumentation und wird nicht aus aktiven Bereichen
    verlinkt.
12. Eine Datei wird erst aus `00_Eingang` verschoben, wenn Wissensübernahme,
    selbstständige Beschreibung und Protokoll geprüft sind und außerhalb des
    neuen Archivlaufs keine Archivpfade eingetragen wurden. Bei Fehlern bleibt sie
    im Eingang und der Benutzer erhält einen Hinweis.
13. Archivierte Originale werden nicht verändert oder gelöscht. Bestehende Inhalte
    werden ebenfalls nicht ohne ausdrücklichen Auftrag gelöscht.
14. Ein sonstiger Zugriff auf einen abgeschlossenen Archivlauf ist nur auf
    ausdrücklichen Benutzerwunsch oder zur Wiederherstellung verlorenen
    beziehungsweise beschädigten Wissens erlaubt. Die betroffene Notiz muss dann
    „Archiv nur im Notfall herangezogen“, Grund und Datum enthalten. Die reine
    Quellenauflistung nach Regel 10 ist kein Notfallzugriff.
15. Der KI-Assistent darf die thematische Ordnerstruktur eigenständig wählen und
    verbessern. Er darf dazu betroffene Ordner und Dateien anlegen, umbenennen,
    verschieben oder sinnvoll zusammenführen. Die Hierarchie und ihre Namen müssen
    für Menschen logisch nachvollziehbar bleiben; interne Verweise sind bei
    Änderungen anzupassen.
16. Projektstatus sind: `Idee`, `Geplant`, `In Arbeit`, `Wartet`, `Pausiert`,
    `Abgeschlossen` und `Verworfen`.
17. Ein Projekt mit dem Status `In Arbeit` besitzt einen konkreten nächsten Schritt.
18. Externe Dateien werden nur auf ausdrücklichen Wunsch in das Repository kopiert.
    Das bewusste Ablegen durch den Benutzer in `00_Eingang` gilt als solcher Wunsch.
19. Passwörter, Zugangsdaten und andere Geheimnisse werden weder in Wissen noch
    Archiv übernommen. Verdächtige Dateien bleiben ungeändert im Eingang und
    werden dem Benutzer gemeldet.
20. Neue Wissenseinträge enthalten `Erstellt` und `Zuletzt geändert`. Bei jeder
    inhaltlichen Änderung wird `Zuletzt geändert` auf das aktuelle lokale Datum
    gesetzt; ein reiner Lesezugriff ändert es nicht.
21. `Was weiß ich über <Thema>?` verwendet ausschließlich den aktiven lokalen
    Wissensbestand, weder Internet noch Eingang oder Archiv, und verändert nichts.
22. `Prüfe die Wissensdatenbank` kontrolliert Struktur, Metadaten, Links,
    Dubletten und sensible Angaben nach
    `80_Workflows/wissensdatenbank-pruefen.md` und ist ohne zusätzlichen
    Änderungsauftrag rein lesend.
23. Änderungen sollen nachvollziehbar, quellenbezogen und in verständlichem
    Deutsch sein.
