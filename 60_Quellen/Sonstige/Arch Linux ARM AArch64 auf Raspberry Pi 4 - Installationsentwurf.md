# Arch Linux ARM AArch64 auf Raspberry Pi 4 – Installationsentwurf

## Metadaten

- Erstellt: 2026-08-05
- Zuletzt geändert: 2026-08-05

## Angaben

- Typ: eigene technische Anleitung
- Ursprünglicher Dateiname: `Arch-Linux-ARM-Raspberry-Pi-4-Installation.md`
- Erfasst am: 2026-08-05
- Zielarchitektur: AArch64/ARM64
- Zielgerät: Raspberry Pi 4 Model B

## Kurzbeschreibung

Der Entwurf beschreibt das Vorbereiten einer microSD-Karte auf einem laufenden
Arch-Linux-Laptop für Arch Linux ARM AArch64. Er grenzt das ARM-Abbild ausdrücklich
vom normalen Arch Linux für x86_64 ab und warnt vor der vollständigen Löschung
der Karte.

Die Karte erhält eine MBR-Partitionstabelle, eine etwa 1 GiB große
FAT32-Bootpartition und eine ext4-Rootpartition. Der Ablauf umfasst das Prüfen des
Gerätenamens mit `lsblk`, Aushängen, Partitionieren mit `fdisk`, Formatieren,
Einhängen, Herunterladen und Entpacken des Raspberry-Pi-AArch64-Tarballs sowie
Synchronisieren und Aushängen. Ergänzende Hinweise betreffen Bootdateien,
EEPROM, erste Anmeldung, Netzwerk und SSH.

## Prüfung und Korrekturen

Der Grundweg stimmt weitgehend mit der am 2026-08-05 gelesenen Plattformseite von
Arch Linux ARM überein. Folgende Punkte mussten korrigiert oder ergänzt werden:

- Für AArch64 verlangt die Plattformseite derzeit zusätzlich, in `fstab`
  `mmcblk0` durch `mmcblk1` zu ersetzen.
- Der dokumentierte Direktweg verwendet den Raspberry-Pi-Bootablauf und kein
  PC-artiges UEFI-Installationsverfahren.
- Die konkrete Liste erwarteter Bootdateien ist nicht dauerhaft verlässlich.
- Die Behauptung zur ersten Root-Anmeldung widerspricht den aktuell auf der
  Plattformseite veröffentlichten Standard-Anmeldedaten.
- Öffentliche Standardpasswörter wurden nicht in den aktiven Bestand übernommen.
- Wegen der HTTP-Weiterleitung des Tarball-Downloads wurde eine Signaturprüfung
  ergänzt.

## Verwendet für

- `30_Anleitungen/Technik/Betriebssysteme/Arch Linux/Arch Linux ARM AArch64 auf Raspberry Pi 4 installieren.md`

## Quellen

- Arch Linux ARM, [Raspberry Pi 4](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4), geprüft am 2026-08-05.
- Arch Linux ARM, [Package Signing](https://archlinuxarm.org/about/package-signing), geprüft am 2026-08-05.
