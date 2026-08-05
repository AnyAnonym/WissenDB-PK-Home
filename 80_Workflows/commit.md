# Workflow: Git-Commit erstellen

## Auslöser

- `Commit`
- `Committe die Änderungen`
- Eindeutig sinngleiche Aufforderungen, lokale Änderungen zu committen

## Zweck

Alle von Git sichtbaren Änderungen reproduzierbar committen, wenn der Benutzer
den uneingeschränkten Befehl `Commit` oder eine sinngleiche Formulierung verwendet.
Nur eine ausdrücklich genannte Einschränkung begrenzt den Umfang. Ein Push ist
nicht enthalten.

## Ablauf

1. Prüfe den Git-Status und den vollständigen Diff aller verfügbaren Änderungen.
2. Der kurze Befehl `Commit` umfasst ausnahmslos alle von Git erkannten, nicht
   ignorierten Änderungen: bereits vorgemerkte, geänderte, neue und gelöschte
   Dateien. Frage nicht nach einer Teilmenge.
3. Formuliere eine verständliche Commit-Nachricht für den Gesamtumfang.
4. Rufe für einen uneingeschränkten Commit auf:

   ```powershell
   & ./80_Workflows/Werkzeuge/git-commit.ps1 `
     -Nachricht "Commit-Nachricht" `
     -Alles
   ```

5. Nur wenn der Benutzer den Umfang ausdrücklich einschränkt, verwende:

   ```powershell
   & ./80_Workflows/Werkzeuge/git-commit.ps1 `
     -Nachricht "Commit-Nachricht" `
     -Dateien @(
       "pfad/datei1"
       "pfad/datei2"
     )
   ```

6. Melde den erzeugten Commit und den anschließenden Git-Status.

## Grenzen

- Der Workflow startet nur auf ausdrücklichen Commit-Wunsch.
- `Commit` bedeutet immer den vollständigen Git-sichtbaren Arbeitsbaum. Bereits
  vorhandene Benutzeränderungen werden dabei ausdrücklich mitcommittet.
- Ignorierte Dateien sind nicht Git-sichtbar. Der Bereich `Sicherheit` bleibt
  unabhängig vom Commit-Auftrag ausgeschlossen.
- Bei einem ausdrücklich eingeschränkten Commit akzeptiert das Skript keine
  Ordner oder pauschalen Repository-Pfade. Bereits vorgemerkte Dateien außerhalb
  der expliziten Dateiliste führen dann zum Abbruch.
- Vor dem Commit wird `git diff --cached --check` ausgeführt.
- Ein Push ist nicht Bestandteil dieses Workflows und benötigt einen eigenen
  ausdrücklichen Auftrag.
