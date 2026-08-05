# Importprotokoll

## Laufdaten

- Zeitstempel: 2026-08-05_081742
- Lokales Datum: 2026-08-05
- Auftrag: Zwei unterschiedliche Arch-Linux-Installationsanleitungen getrennt eintragen
- Benutzerklarstellung: `Arch-Linux-ARM-Raspberry-Pi-4-Installation.md` gilt für AArch64 auf dem Raspberry Pi; `Aufsetzten von Arch Linux.md` gilt für normales Arch Linux x86_64 auf einem PC mit UEFI-Bootmenü.
- Bereits vorhandene, nicht zu diesem Import gehörende Änderungen: vier geänderte Vorlagen unter `70_Vorlagen`; sie wurden nicht inhaltlich verändert.

## Dateiliste

1. `Arch-Linux-ARM-Raspberry-Pi-4-Installation.md`
2. `Aufsetzten von Arch Linux.md`

## Einzelbeschreibung: Arch-Linux-ARM-Raspberry-Pi-4-Installation.md

### Bearbeitungsstatus und Integrität

- Vollständig gelesen und erfolgreich verarbeitet
- Keine privaten Geheimnisse oder unnötigen personenbezogenen Daten erkannt
- SHA-256 vor Archivierung: `da3a4637dc34c396383bb5ec79dc4c75ac4975034f2422d8d71cb4f70a6e58eb`
- Größe: 2457 Byte

### Ausführliche Beschreibung

Die Datei ist eine Anleitung für Arch Linux ARM AArch64 auf dem Raspberry Pi 4
Model B, vorbereitet von einem laufenden Arch-Linux-Laptop. Sie grenzt das
AArch64-Abbild ausdrücklich vom normalen Arch Linux x86_64 ab und warnt, dass die
microSD-Karte vollständig gelöscht wird.

Vorgesehen sind eine MBR-Partitionstabelle, eine etwa 1 GiB große FAT32-
Bootpartition und eine ext4-Rootpartition. Die Anleitung verwendet `/dev/sdX`
als Platzhalter, verlangt die Prüfung mit `lsblk`, hängt vorhandene Partitionen
und Swap aus, erstellt mit `fdisk` beide Partitionen, formatiert sie und hängt
Root und Boot ein. Danach lädt sie den AArch64-Tarball von Arch Linux ARM,
entpackt ihn als root, kontrolliert die Bootdateien, synchronisiert und hängt die
Karte aus. Abschließend folgen Hinweise zu EEPROM, erster Anmeldung, Netzwerk
und SSH.

### Konflikte und Korrekturen

Die aktuelle Arch-Linux-ARM-Plattformseite verlangt für AArch64 zusätzlich die
Ersetzung von `mmcblk0` durch `mmcblk1` in `fstab`; dieser Schritt fehlt im
Entwurf. Der Hinweis, aktuelle EEPROM-Firmware sei für UEFI-Boot erforderlich,
vermischt den dokumentierten Direktweg mit einem separaten UEFI-Verfahren. Die
Aussage zur ersten Root-Anmeldung stimmt nicht mit den veröffentlichten
Standard-Anmeldedaten überein. Die Liste einzelner Bootdateinamen ist nicht
versionsstabil. Die aktive Anleitung korrigiert diese Punkte, ergänzt
Signaturprüfung, Erfolgskontrolle und Fehlerbehebung und speichert keine
Passwörter.

### Zielpfade

- Anleitung: `30_Anleitungen/Technik/Betriebssysteme/Arch Linux/Arch Linux ARM AArch64 auf Raspberry Pi 4 installieren.md`
- Quelle: `60_Quellen/Sonstige/Arch Linux ARM AArch64 auf Raspberry Pi 4 - Installationsentwurf.md`

## Einzelbeschreibung: Aufsetzten von Arch Linux.md

### Bearbeitungsstatus und Integrität

- Vollständig gelesen und erfolgreich verarbeitet
- Keine privaten Geheimnisse oder unnötigen personenbezogenen Daten erkannt
- SHA-256 vor Archivierung: `ef102349c9970f1cbf706bfdf21d5a66805117c6e17fd5957a843da268edb7d4`
- Größe: 4931 Byte

### Ausführliche Beschreibung

Die Datei enthält einen persönlichen Stichpunktteil und einen als OpenCode-Text
gekennzeichneten Ausbau. Die Stichpunkte folgen im Kern einer normalen
Arch-Linux-PC-Installation: ISO mit Rufus auf ein Installationsmedium schreiben,
Live-System starten, Tastaturlayout setzen, WLAN über `iwctl` einrichten,
Systemzeit und UEFI prüfen, GPT-Partitionen formatieren und einhängen,
Basissystem mit `pacstrap` installieren, `fstab` erzeugen, mit `arch-chroot` ins
Zielsystem wechseln, Zeitzone, Hardware-Uhr, Locale, Tastatur und Hostname
konfigurieren, Initramfs und Root-Passwort behandeln, GRUB und `efibootmgr`
installieren und initialisieren sowie aushängen und neu starten.

Sowohl der einleitende Titel als auch der OpenCode-Ausbau bezeichnen das Ziel
jedoch als Raspberry Pi 4. Der Ausbau verwendet eine Arch-Linux-ARM-Seite,
ARM-Paketnamen, `/dev/mmcblk0`, systemd-boot mit ARM-bezogenen Loaderdateien und
alternativ GRUB mit `arm64-efi`. Dadurch werden PC-x86_64- und
Raspberry-Pi-AArch64-Verfahren vermischt.

### Benutzerklarstellung, Konflikte und Korrekturen

Der Benutzer hat am 2026-08-05 ausdrücklich klargestellt, dass diese Anleitung
für **normales Arch Linux x86_64 auf einem anderen PC mit Bootmenü** bestimmt ist.
Diese Klarstellung bestimmt das Ziel; die Raspberry-Pi- und ARM-Bezeichnungen in
der Datei werden als fehlerhaft behandelt.

Die aktive Anleitung wurde deshalb gegen die aktuelle ArchWiki-Installation und
GRUB-Dokumentation aufgebaut. Sie verwendet das aktuelle ISO von der offiziellen
Arch-Linux-Downloadseite, UEFI-Start über das PC-Bootmenü, GPT mit
EFI-Systempartition und Rootpartition, `base`, `linux`, `linux-firmware`, das
zum Prozessor passende Microcode-Paket, `pacstrap -K`, `genfstab`, den aktuell
dokumentierten systemd-Modus von `arch-chroot`, Locale, Benutzer und GRUB mit dem
Ziel `x86_64-efi`. ARM-Pakete, ARM-Bootloader und Raspberry-Pi-Gerätenamen wurden
nicht übernommen.

### Zielpfade

- Anleitung: `30_Anleitungen/Technik/Betriebssysteme/Arch Linux/Arch Linux x86_64 auf UEFI-PC installieren.md`
- Quelle: `60_Quellen/Sonstige/Arch Linux x86_64 auf UEFI-PC - Installationsentwurf.md`

## Abgrenzung statt Zusammenführung

Die Dateien wurden ausdrücklich **nicht zusammengeführt**. Sie führen zu zwei
selbstständigen Anleitungen in demselben Arch-Linux-Themenordner:

- AArch64/ARM64 und Raspberry-Pi-Bootablauf
- x86_64 und PC-UEFI-Bootablauf

Gemeinsame Begriffe wie `fdisk`, FAT32, ext4 oder Netzwerk ändern nichts daran,
dass Abbilder, Installationsmethode, Kernel, Bootloader und Zielhardware
unterschiedlich sind.

## Öffentliche Prüfung

Am 2026-08-05 vollständig beziehungsweise gezielt geprüft und erreichbar:

- Arch Linux ARM – Raspberry Pi 4
- Arch Linux ARM – Package Signing
- ArchWiki – Installation guide
- ArchWiki – GRUB
- Arch Linux – Download
- Rufus – offizielle Website

## Strukturänderungen

- Neuer gemeinsamer Themenordner für Arch-Linux-Anleitungen unter `30_Anleitungen/Technik/Betriebssysteme/Arch Linux`
- Zwei getrennte aktive Anleitungen nach Architektur und Zielgerät
- Zwei getrennte Quelleneinträge unter `60_Quellen/Sonstige`
- Keine vorhandenen aktiven Dateien verschoben oder umbenannt

## Offene Fragen

- Ob später eigene Anleitungen für Dual Boot, Verschlüsselung oder Secure Boot benötigt werden
- Arch-Linux- und Arch-Linux-ARM-Schritte müssen wegen ihres Rolling-Release-Charakters vor einer praktischen Durchführung erneut mit den offiziellen Seiten verglichen werden

## Abschlussprüfung und Archivierung

- Beide Anleitungen sind als getrennte Verfahren für AArch64/Raspberry Pi und x86_64/UEFI-PC angelegt.
- Alle vier neuen aktiven Einträge sind ohne Originaldateien verständlich und nutzbar.
- Metadaten, relative Markdown-Links und die Architekturabgrenzung wurden geprüft.
- Die neuen aktiven Einträge enthalten weder Eingangs- noch Archivpfade.
- Es wurden keine Geheimnisse, privaten Netzwerkadressen oder unnötigen personenbezogenen Daten erkannt.
- Beide Originale wurden unverändert in `Originale/` verschoben.
- Die SHA-256-Werte nach dem Verschieben stimmen exakt mit den vorher erfassten Werten überein.
- Im Eingang verbleibt nur `.gitkeep`; keine Datei wartet auf Verarbeitung.
- Der Importlauf ist erfolgreich abgeschlossen.
