# Workflow: Git-Commit erstellen

## Auslöser

- `Committe die Änderungen`
- Eindeutig sinngleiche Aufforderungen, lokale Änderungen zu committen

## Zweck

Ausdrücklich gewünschte und zuvor geprüfte Änderungen reproduzierbar committen,
ohne andere Benutzeränderungen einzuschließen oder zu pushen.

## Ablauf

1. Prüfe den Git-Status und bestimme den vom Benutzer verlangten Umfang.
2. Lies beziehungsweise prüfe den Diff jeder zu committenden Datei. Ist der
   Umfang nicht eindeutig, frage nach, bevor Dateien vorgemerkt werden.
3. Formuliere eine verständliche Commit-Nachricht.
4. Rufe ausschließlich für die geprüften Einzeldateien auf:

   ```powershell
   & ./80_Workflows/Werkzeuge/git-commit.ps1 `
     -Nachricht "Commit-Nachricht" `
     -Dateien @(
       "pfad/datei1"
       "pfad/datei2"
     )
   ```

5. Melde den erzeugten Commit und verbleibende, nicht einbezogene Änderungen.

## Grenzen

- Der Workflow startet nur auf ausdrücklichen Commit-Wunsch.
- Das Skript akzeptiert keine Ordner oder pauschale Repository-Pfade.
- Bereits vorgemerkte Dateien außerhalb der expliziten Dateiliste führen zum
  Abbruch.
- Vor dem Commit wird `git diff --cached --check` ausgeführt.
- Ein Push ist nicht Bestandteil dieses Workflows und benötigt einen eigenen
  ausdrücklichen Auftrag.
