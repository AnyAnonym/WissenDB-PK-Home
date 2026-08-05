# Arch Linux x86_64 auf UEFI-PC – Installationsentwurf

## Metadaten

- Erstellt: 2026-08-05
- Zuletzt geändert: 2026-08-05

## Angaben

- Typ: eigene Stichpunkte mit KI-erweiterter Fassung
- Ursprünglicher Dateiname: `Aufsetzten von Arch Linux.md`
- Erfasst am: 2026-08-05
- Beabsichtigte Zielarchitektur laut Klarstellung des Benutzers: x86_64
- Zielgerät: normaler PC mit UEFI-Bootmenü

## Kurzbeschreibung

Die Datei enthält zunächst Stichpunkte für eine typische Arch-Linux-Installation:
Installationsabbild mit Rufus auf ein Medium schreiben, Live-System über ein
Bootmenü starten, deutsches Tastaturlayout setzen, WLAN mit `iwctl` verbinden,
Systemzeit und UEFI-Modus prüfen, GPT-Partitionen und Dateisysteme erstellen,
alles einhängen, das Basissystem mit `pacstrap` installieren, `fstab` erzeugen,
mit `arch-chroot` wechseln, Zeitzone, Hardware-Uhr, Locale, Tastatur und Hostname
konfigurieren, Initramfs und Root-Passwort behandeln, GRUB und `efibootmgr`
installieren sowie aushängen und neu starten.

Danach folgt eine als OpenCode-Text bezeichnete Erweiterung, welche denselben
Ablauf fälschlich als Raspberry-Pi-4- und ARM-Anleitung formuliert. Sie ersetzt
das normale x86_64-ISO durch Arch Linux ARM, verwendet ARM-Paket- und
Bootloaderbezeichnungen und vermischt damit zwei unterschiedliche
Architekturen.

## Verbindliche Klarstellung und Konfliktbehandlung

Der Benutzer stellte am 2026-08-05 ausdrücklich klar, dass diese Datei als
Anleitung für **normales Arch Linux x86_64 auf einem PC mit Bootmenü** gedacht
ist. Die Raspberry-Pi-Formulierungen im eigenen Titelbereich sowie die
ARM-Erweiterungen von OpenCode werden deshalb als fehlerhafte Vermischung und
nicht als Zieldefinition behandelt.

Für die aktive Anleitung wurden die brauchbaren x86_64-Schritte mit der aktuellen
ArchWiki-Installations- und GRUB-Dokumentation abgeglichen. Dabei wurden unter
anderem korrigiert:

- aktuelles ISO von `archlinux.org/download` statt des Paket-/Snapshotarchivs
- x86_64-UEFI-Prüfung und UEFI-Start über das PC-Bootmenü
- normales Kernelpaket `linux` statt `linux-aarch64`
- CPU-abhängiges `intel-ucode` oder `amd-ucode`
- aktueller `pacstrap -K`-Aufruf
- GRUB-Ziel `x86_64-efi` statt `arm64-efi`
- reale GRUB-Konfiguration über `grub-mkconfig` statt einer fehlerhaften
  statischen ARM-Loaderdatei
- Hinweis, dass eine neue Initramfs-Erzeugung bei unveränderter
  Standardinstallation normalerweise bereits durch die Kernelinstallation
  erfolgt

## Verwendet für

- `30_Anleitungen/Technik/Betriebssysteme/Arch Linux/Arch Linux x86_64 auf UEFI-PC installieren.md`

## Quellen

- ArchWiki, [Installation guide](https://wiki.archlinux.org/title/Installation_guide), geprüft am 2026-08-05.
- ArchWiki, [GRUB](https://wiki.archlinux.org/title/GRUB), geprüft am 2026-08-05.
- Arch Linux, [Download](https://archlinux.org/download/), geprüft am 2026-08-05.
- Rufus, [offizielle Website](https://rufus.ie/), geprüft am 2026-08-05.
