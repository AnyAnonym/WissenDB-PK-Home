# Arch Linux ARM AArch64 auf einem Raspberry Pi 4 installieren

## Metadaten

- Erstellt: 2026-08-05
- Zuletzt geändert: 2026-08-05
- Eintragstyp: Anleitung
- Themenbereich: Technik / Betriebssysteme / Arch Linux ARM

## Zielprofil

- Gegenstand oder System: Installation von Arch Linux ARM
- Produkt oder Variante: Arch Linux ARM für Raspberry Pi 4 in AArch64
- Architektur oder Plattform: ARM64/AArch64, Raspberry-Pi-Bootablauf und MBR-partitionierte microSD-Karte
- Zielgerät oder Zielgruppe: Raspberry Pi 4 Model B
- Einsatzumgebung oder Verfahren: microSD-Karte auf einem laufenden Linux-Rechner vorbereiten und ein fertiges ARM-Root-Dateisystem entpacken
- Geltungsbereich: Direktinstallation von Arch Linux ARM AArch64 auf einer microSD-Karte
- Ausdrückliche Ausschlüsse: normales Arch Linux x86_64, PC-Bootmenü, UEFI-PC-Installation, `pacstrap` und GRUB

## Zweck

Diese Anleitung richtet **Arch Linux ARM in der 64-Bit-Architektur AArch64** auf
einer microSD-Karte für einen Raspberry Pi 4 Model B ein. Die Karte wird auf
einem bereits laufenden Linux-Rechner vorbereitet.

Dieser Weg verwendet kein normales Arch-Linux-x86_64-ISO, kein PC-Bootmenü,
kein `pacstrap`, kein GRUB und keine UEFI-PC-Installation. Arch Linux ARM wird
als fertiges ARM-Root-Dateisystem auf die Karte entpackt.

## Voraussetzungen

- Raspberry Pi 4 Model B
- zuverlässiges Netzteil mit 5 V und 3 A
- microSD-Karte, deren Inhalt vollständig gelöscht werden darf
- Linux-Rechner mit Root-Rechten und Kartenleser
- Internetzugang sowie `fdisk`, `dosfstools`, `e2fsprogs`, `libarchive` und
  `curl` oder `wget`
- möglichst GnuPG zur Prüfung der Downloadsignatur
- Ethernet für den ersten Start

> **Warnung:** `/dev/sdX` ist nur ein Platzhalter. Ein falscher Gerätename bei
> `fdisk` oder `mkfs` kann einen anderen Datenträger vollständig zerstören.

## 1. Aktuelle gerätespezifische Anleitung prüfen

Vor der Durchführung die aktuelle Plattformseite lesen:

- [Arch Linux ARM – Raspberry Pi 4](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4)

Die Seite unterscheidet ARMv7 und AArch64. Für diese Anleitung gilt der Abschnitt
**AArch64 Installation** mit dem AArch64-Tarball und der dort genannten
`fstab`-Anpassung.

## 2. Zielkarte eindeutig bestimmen

Karte einstecken und Datenträger anzeigen:

```bash
lsblk -o NAME,PATH,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
```

Gerätenamen anhand von Größe und Modell bestimmen und anschließend eine
Root-Shell öffnen:

```bash
sudo -i
```

Automatisch eingehängte Partitionen der Zielkarte über ihre konkreten
Mountpunkte aushängen. Mit `lsblk` kontrollieren, dass die Karte nicht mehr
eingehängt ist.

## 3. MBR-Partitionstabelle erstellen

Die gerätespezifische Anleitung verwendet:

1. FAT32-Bootpartition mit 1 GiB
2. ext4-Rootpartition mit dem restlichen Platz

```bash
fdisk /dev/sdX
```

Eingaben in `fdisk`:

```text
o
p
n
p
1
<Enter>
+1G
t
c
n
p
2
<Enter>
<Enter>
w
```

`o` erzeugt eine MBR-Tabelle. `t` und `c` markieren Partition 1 als „W95 FAT32
(LBA)“. Danach erneut prüfen:

```bash
lsblk -f /dev/sdX
```

## 4. Dateisysteme anlegen und getrennt einhängen

Bei `/dev/sdX` heißen die Partitionen gewöhnlich `/dev/sdX1` und `/dev/sdX2`:

```bash
mkfs.vfat -F 32 /dev/sdX1
mkfs.ext4 /dev/sdX2
mkdir -p /mnt/alarm-boot /mnt/alarm-root
mount /dev/sdX1 /mnt/alarm-boot
mount /dev/sdX2 /mnt/alarm-root
findmnt /mnt/alarm-boot
findmnt /mnt/alarm-root
```

Bei Geräten wie `/dev/mmcblk0` oder `/dev/nvme0n1` besitzen die Partitionen ein
zusätzliches `p`, beispielsweise `/dev/mmcblk0p1`.

## 5. AArch64-Abbild herunterladen und möglichst prüfen

```bash
cd /tmp
curl -LO http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz
curl -LO http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz.sig
```

Der Download wird derzeit über HTTP auf einen Spiegel umgeleitet. Deshalb ist
die Signaturprüfung besonders wichtig. Der am 2026-08-05 auf der
[Signaturseite von Arch Linux ARM](https://archlinuxarm.org/about/package-signing)
veröffentlichte Fingerabdruck des Build-Systems lautet:

```text
68B3537F39A313B3E574D06777193F152BDBE6A6
```

Schlüssel beziehen, den vollständigen Fingerabdruck mit der offiziellen Seite
vergleichen und die Datei prüfen:

```bash
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 68B3537F39A313B3E574D06777193F152BDBE6A6
gpg --fingerprint 68B3537F39A313B3E574D06777193F152BDBE6A6
gpg --verify ArchLinuxARM-rpi-aarch64-latest.tar.gz.sig \
  ArchLinuxARM-rpi-aarch64-latest.tar.gz
```

Nur bei gültiger Signatur und übereinstimmendem Fingerabdruck fortfahren.

## 6. Root-Dateisystem entpacken

Die offizielle Seite verlangt das Entpacken als `root`, nicht nur einen einzelnen
Aufruf über `sudo`:

```bash
bsdtar -xpf ArchLinuxARM-rpi-aarch64-latest.tar.gz -C /mnt/alarm-root
sync
test -f /mnt/alarm-root/etc/os-release && echo "Root-Dateisystem vorhanden"
```

## 7. AArch64-fstab anpassen

Für das AArch64-Abbild verlangt die Raspberry-Pi-4-Plattformseite derzeit:

```bash
sed -i 's/mmcblk0/mmcblk1/g' /mnt/alarm-root/etc/fstab
grep -v '^[[:space:]]*#' /mnt/alarm-root/etc/fstab
```

Diese Anpassung darf nicht ausgelassen werden, solange sie in der aktuellen
gerätespezifischen Anleitung steht.

## 8. Bootdateien auf die FAT-Partition verschieben

```bash
mv /mnt/alarm-root/boot/* /mnt/alarm-boot/
sync
ls -la /mnt/alarm-boot
```

Die Bootpartition darf nicht leer sein. Konkrete Dateinamen können sich zwischen
Abbildern ändern und sind deshalb keine dauerhaft zuverlässige Prüfliste.

## 9. Karte sicher aushängen

```bash
sync
umount /mnt/alarm-boot
umount /mnt/alarm-root
lsblk -f /dev/sdX
exit
```

Erst danach die Karte entfernen.

## 10. Erster Start

1. Karte in den ausgeschalteten Raspberry Pi einsetzen.
2. Ethernet anschließen und danach die Stromversorgung verbinden.
3. Die per DHCP vergebene Adresse im Router ermitteln.
4. Die auf der aktuellen Plattformseite veröffentlichten anfänglichen
   Anmeldedaten verwenden und alle Standardpasswörter sofort ändern. Passwörter
   werden nicht in dieser Wissensdatenbank gespeichert.
5. Paket-Schlüssel initialisieren und das System aktualisieren:

```bash
pacman-key --init
pacman -S archlinuxarm-keyring
pacman-key --populate archlinuxarm
pacman -Syu
```

6. Benutzer, Zeitzone, Locale, Hostname, Netzwerk und SSH für den eigenen Einsatz
   konfigurieren.

## Erfolgskontrolle

```bash
uname -m
findmnt
ip address
systemctl --failed
```

- `uname -m` muss `aarch64` ausgeben.
- Boot- und Rootdateisystem müssen auf den vorgesehenen Partitionen liegen.
- Das System muss nach einem weiteren Neustart wieder selbstständig starten.

## Fehlerbehebung

### Kein Start

- Stromversorgung prüfen.
- Sicherstellen, dass der Raspberry-Pi-4-AArch64-Tarball verwendet wurde.
- FAT32-Bootpartition und ext4-Rootpartition kontrollieren.
- Prüfen, ob die Bootdateien wirklich auf der FAT-Partition liegen.
- `fstab`-Anpassung von `mmcblk0` auf `mmcblk1` kontrollieren.
- Plattformseite auf geänderte Schritte prüfen.

### Kein Netzwerk oder SSH

- Beim ersten Start Ethernet verwenden.
- DHCP-Adresse im Router kontrollieren.
- Netzwerk- und SSH-Dienst lokal oder über eine serielle Konsole prüfen.
- Keine privaten IP-Adressen oder Zugangsdaten in der Wissensdatenbank speichern.

## Rückgängig machen

Ein vorhandenes Kartenabbild zurückspielen oder die microSD-Karte für ein anderes
Betriebssystem neu partitionieren. Ohne Sicherung sind die zuvor überschriebenen
Daten nicht wiederherstellbar.

## Herkunft

- Ursprünglicher Dateiname: `Arch-Linux-ARM-Raspberry-Pi-4-Installation.md`
- Die fehlende AArch64-`fstab`-Anpassung und missverständliche UEFI-Hinweise des
  Entwurfs wurden anhand der Plattformseite korrigiert.

## Quellen

- Arch Linux ARM, [Raspberry Pi 4](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4), geprüft am 2026-08-05.
- Arch Linux ARM, [Package Signing](https://archlinuxarm.org/about/package-signing), geprüft am 2026-08-05.

## Zuletzt geprüft

2026-08-05
