# Arch Linux x86_64 auf einem UEFI-PC installieren

## Metadaten

- Erstellt: 2026-08-05
- Zuletzt geändert: 2026-08-05

## Zweck

Diese Anleitung installiert das **normale Arch Linux für x86_64-PCs** von einem
USB-Installationsmedium auf einem Rechner mit UEFI-Firmware und Bootmenü. Sie
beschreibt eine einfache Neuinstallation auf einem eigenen Ziellaufwerk mit GPT,
einer EFI-Systempartition, einer ext4-Rootpartition und GRUB.

Sie gilt nicht für Raspberry Pi oder andere ARM-Geräte. Für einen Raspberry Pi 4
wird Arch Linux ARM AArch64 nach einer getrennten Anleitung installiert.

## Abgrenzung

Diese Grundanleitung behandelt nicht:

- Dual Boot mit einem vorhandenen Windows oder Linux
- Festplattenverschlüsselung
- LVM, RAID, Btrfs-Layouts oder Secure Boot
- BIOS-/Legacy-Start

Bei Dual Boot dürfen vorhandene EFI- und Datenpartitionen nicht nach diesem
Schema gelöscht werden. Dafür ist zuerst ein eigener Partitionsplan erforderlich.

## Voraussetzungen

- x86_64-PC mit UEFI und Bootmenü
- USB-Stick, dessen Inhalt gelöscht werden darf
- separates Ziellaufwerk oder vollständige Sicherung aller Daten darauf
- Internetverbindung
- Arch-Linux-ISO von der offiziellen Downloadseite
- Rufus unter Windows oder ein anderes geeignetes Werkzeug zum Schreiben des ISO
- Kenntnis darüber, ob der Prozessor von Intel oder AMD stammt

> **Warnung:** Die Partitionierung und Formatierung löschen Daten. Gerätenamen
> wie `/dev/nvme0n1` und `/dev/sda` müssen für den konkreten PC geprüft werden.

## 1. Installationsmedium erstellen

1. Aktuelles ISO ausschließlich über die
   [offizielle Arch-Linux-Downloadseite](https://archlinux.org/download/)
   beziehen. `archive.archlinux.org` ist nicht die reguläre Downloadseite für eine
   aktuelle Neuinstallation.
2. Prüfsumme und möglichst die Signatur nach den Hinweisen der Downloadseite
   kontrollieren.
3. Rufus starten, den richtigen USB-Stick auswählen und das Arch-Linux-ISO auf
   den Stick schreiben. Rückfragen von Rufus zum empfohlenen Schreibmodus anhand
   der aktuellen Rufus- und Arch-Hinweise beantworten.
4. Nach Abschluss den Stick sicher entfernen.

## 2. Über das UEFI-Bootmenü starten

1. USB-Stick einstecken und PC neu starten.
2. Bootmenü-Taste des Herstellers drücken, häufig `F12`, `F11`, `Esc` oder `F8`.
3. Den Eintrag des USB-Sticks mit dem Zusatz **UEFI** auswählen.
4. Falls das unveränderte Arch-ISO wegen Secure Boot nicht startet, Secure Boot
   vorübergehend im UEFI deaktivieren. Nicht in einen Legacy-/CSM-Modus wechseln.

## 3. Tastatur, UEFI-Modus, Netzwerk und Uhr prüfen

Deutsches Tastaturlayout setzen:

```bash
loadkeys de-latin1
```

Architektur und UEFI-Modus prüfen:

```bash
uname -m
cat /sys/firmware/efi/fw_platform_size
```

Erwartet werden `x86_64` und bei einem 64-Bit-UEFI die Ausgabe `64`. Fehlt die
Datei, wurde das Medium nicht im UEFI-Modus gestartet; dann erneut über den
UEFI-Eintrag des Bootmenüs booten.

Ethernet funktioniert im Installationssystem meist automatisch. Für WLAN:

```bash
iwctl
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect "SSID"
exit
```

`wlan0` gegebenenfalls durch den unter `device list` angezeigten Namen ersetzen.
Das WLAN-Passwort nur interaktiv eingeben und nicht dokumentieren.

Verbindung und Uhr prüfen:

```bash
ping -c 3 archlinux.org
timedatectl
```

## 4. Ziellaufwerk bestimmen

```bash
lsblk -o NAME,PATH,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
```

Das Ziellaufwerk anhand von Größe und Modell festlegen. Beispiele:

- NVMe-Laufwerk: `/dev/nvme0n1`, Partitionen `/dev/nvme0n1p1` und `p2`
- SATA-Laufwerk: `/dev/sda`, Partitionen `/dev/sda1` und `/dev/sda2`

Nicht den USB-Installationsstick partitionieren.

## 5. GPT und Partitionen anlegen

Für eine vollständige Neuinstallation auf `/dev/nvme0n1`:

```bash
fdisk /dev/nvme0n1
```

In `fdisk`:

1. Mit `g` eine neue GPT-Partitionstabelle erzeugen.
2. Partition 1 mit etwa 1 GiB anlegen und als **EFI System** markieren.
3. Partition 2 mit dem restlichen Platz als **Linux filesystem** anlegen.
4. Mit `p` die Tabelle kontrollieren.
5. Erst mit `w` endgültig schreiben.

Wer Swap als eigene Partition, Verschlüsselung oder Dual Boot benötigt, muss den
Partitionsplan vor `w` entsprechend ändern.

## 6. Dateisysteme erstellen und einhängen

Beispiel für NVMe:

```bash
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
findmnt /mnt
findmnt /mnt/boot
```

Bei SATA entsprechend `/dev/sda1` und `/dev/sda2` verwenden.

## 7. Basissystem installieren

Passendes Microcode-Paket auswählen:

- Intel-Prozessor: `intel-ucode`
- AMD-Prozessor: `amd-ucode`

Beispiel für Intel:

```bash
pacstrap -K /mnt base linux linux-firmware intel-ucode \
  networkmanager sudo vim grub efibootmgr
```

Für AMD `intel-ucode` durch `amd-ucode` ersetzen. `base-devel` und weitere
Werkzeuge können zusätzlich installiert werden, sind aber nicht für den ersten
Start erforderlich.

## 8. fstab erzeugen und kontrollieren

```bash
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

Root- und EFI-Systempartition müssen jeweils genau einmal mit plausiblen
Mountpunkten enthalten sein.

## 9. In das installierte System wechseln

Die am 2026-08-05 aktuelle Arch-Installationsanleitung verwendet:

```bash
arch-chroot -S /mnt
```

`-S` startet den Chroot im systemd-Modus. Bei einer älteren `arch-chroot`-Version,
die diese Option nicht kennt, die zu dieser Version gehörende Dokumentation
prüfen, statt Optionen blind zu ändern.

## 10. Zeitzone, Locale und Hostname konfigurieren

Zeitzone wählen, beispielsweise `Europe/Vienna`:

```bash
ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime
hwclock --systohc
```

In `/etc/locale.gen` die gewünschte UTF-8-Locale aktivieren, beispielsweise
`de_AT.UTF-8 UTF-8` oder `de_DE.UTF-8 UTF-8`, danach:

```bash
locale-gen
echo 'LANG=de_AT.UTF-8' > /etc/locale.conf
echo 'KEYMAP=de-latin1' > /etc/vconsole.conf
```

`LANG` muss zu der tatsächlich aktivierten Locale passen. Hostname setzen:

```bash
echo 'archpc' > /etc/hostname
```

`archpc` durch den gewünschten Namen ersetzen.

## 11. Passwörter und Benutzer einrichten

Root-Passwort interaktiv setzen:

```bash
passwd
```

Persönlichen Benutzer anlegen:

```bash
useradd -m -G wheel -s /bin/bash BENUTZERNAME
passwd BENUTZERNAME
EDITOR=vim visudo
```

In `visudo` die passende `%wheel ALL=(ALL:ALL) ALL`-Zeile aktivieren. Keine
Passwörter in Notizen oder Befehlsdateien speichern.

## 12. GRUB für x86_64-UEFI installieren

Die EFI-Systempartition ist in dieser Anleitung unter `/boot` eingehängt:

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
efibootmgr
```

`grub-install` muss ohne Fehler abschließen und `efibootmgr` sollte einen
GRUB-Eintrag zeigen. Der Befehl verwendet ausdrücklich `x86_64-efi`, nicht
aarch64/arm64.

Ein erneutes `mkinitcpio -P` ist bei einer unveränderten Standardinstallation
normalerweise nicht nötig, weil es bei der Kernelinstallation bereits ausgeführt
wurde. Nach Änderungen an Initramfs-Hooks ist es erneut auszuführen.

## 13. Netzwerk aktivieren und neu starten

```bash
systemctl enable NetworkManager
exit
umount -R /mnt
reboot
```

Beim Neustart den USB-Stick entfernen und im UEFI gegebenenfalls den neuen
GRUB-Eintrag auswählen.

## Erfolgskontrolle

Nach der Anmeldung:

```bash
uname -m
findmnt
ip address
systemctl --failed
efibootmgr
```

- Architektur ist `x86_64`.
- Root- und EFI-Systempartition sind korrekt eingehängt.
- Netzwerk funktioniert.
- GRUB erscheint im UEFI-Bootmenü.
- Das System startet auch nach einem zweiten Neustart ohne USB-Stick.

## Fehlerbehebung

### `fw_platform_size` fehlt

Der USB-Stick wurde im Legacy-/CSM-Modus gestartet. Erneut den UEFI-Eintrag im
Bootmenü wählen.

### `efibootmgr` oder `grub-install` kann keinen Eintrag anlegen

- Prüfen, ob wirklich im UEFI-Modus gebootet wurde.
- Prüfen, ob die FAT32-EFI-Systempartition unter `/boot` eingehängt ist.
- UEFI-Einstellungen wie „Boot Order Lock“ kontrollieren.
- Erst danach die aktuelle GRUB-Dokumentation zu einem Fallback-Bootpfad prüfen.

### Nach dem Neustart kein Netzwerk

Mit einem lokalen Terminal anmelden, `systemctl status NetworkManager` prüfen und
bei WLAN die Verbindung mit `nmcli` neu einrichten.

## Rückgängig machen

Ein vollständiges Laufwerksabbild zurückspielen oder das Ziellaufwerk erneut
partitionieren. Ohne Sicherung sind überschriebene Daten nicht
wiederherstellbar.

## Herkunft

- Ursprünglicher Dateiname: `Aufsetzten von Arch Linux.md`
- Der Benutzer stellte am 2026-08-05 klar, dass dieser Ablauf für normales Arch
  Linux auf einem x86_64-PC mit UEFI-Bootmenü bestimmt ist. Raspberry-Pi- und
  ARM-Angaben im Entwurf wurden deshalb als fehlerhafte Vermischung behandelt.

## Quellen

- ArchWiki, [Installation guide](https://wiki.archlinux.org/title/Installation_guide), geprüft am 2026-08-05.
- ArchWiki, [GRUB](https://wiki.archlinux.org/title/GRUB), geprüft am 2026-08-05.
- Arch Linux, [Download](https://archlinux.org/download/), geprüft am 2026-08-05.
- Rufus, [offizielle Website](https://rufus.ie/), geprüft am 2026-08-05.

## Zuletzt geprüft

2026-08-05
