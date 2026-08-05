# Arch Linux ARM auf Raspberry Pi 4 Model B – Installation von einem laufenden Arch-Laptop

> **Wichtig:** Du brauchst **Arch Linux ARM aarch64** für Raspberry Pi 4 – nicht das normale x86_64 Arch Linux.
>
> Diese Installation löscht die microSD-Karte komplett. Für paralleles Laptop-Arch: zweite SD-Karte nutzen.

---

## Partitionierung der SD-Karte

```text
Partition 1: FAT32, ca. 1 GB, /boot
Partition 2: ext4, Rest der Karte, /
```

---

## Variante: Installation vom laufenden Arch-Laptop

Angenommen die SD-Karte ist `/dev/sdX` (mit `lsblk` prüfen!).

### 1. SD-Karte aushängen
```bash
umount /dev/sdX* 2>/dev/null
swapoff /dev/sdX* 2>/dev/null
```

### 2. Partitionstabelle erstellen (MBR + 2 Partitionen)
```bash
fdisk /dev/sdX
```

In `fdisk`:
```text
o
n
p
1

+1G
t
c
n
p
2


w
```

Bedeutung:
- `o` = neue MBR-Partitionstabelle
- Partition 1 = 1 GB FAT32 Boot
- Partition 2 = Rest für Root
- `t`, `c` = Partition 1 als W95 FAT32 LBA markieren
- `w` = speichern

---

### 3. Dateisysteme erstellen
```bash
mkfs.vfat -F32 /dev/sdX1
mkfs.ext4 /dev/sdX2
```

---

### 4. Mounten
```bash
mkdir -p /mnt/archarm
mount /dev/sdX2 /mnt/archarm
mkdir /mnt/archarm/boot
mount /dev/sdX1 /mnt/archarm/boot
```

---

### 5. Arch Linux ARM herunterladen (RPi 4 64-bit)
```bash
cd /tmp
curl -L -O http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz
# Falls curl fehlt: pacman -S curl
```

---

### 6. Als root entpacken
```bash
bsdtar -xpf ArchLinuxARM-rpi-aarch64-latest.tar.gz -C /mnt/archarm
# Falls bsdtar fehlt: pacman -S libarchive
```

---

### 7. Bootdateien richtig verschieben
Bei Arch Linux ARM liegen die Pi-Bootdateien nach dem Entpacken meist in:
```text
/mnt/archarm/boot
```
Da `/mnt/archarm/boot` aber gerade deine FAT32-Bootpartition ist, ist das normalerweise schon korrekt.

Zur Kontrolle:
```bash
ls /mnt/archarm/boot
```

Du solltest Dateien sehen wie:
```text
config.txt
cmdline.txt
start4.elf
fixup4.dat
kernel8.img
```

Wenn da nichts oder nur ein leerer Ordner ist, sag Bescheid.

---

### 8. Sync und aushängen
```bash
sync
umount /mnt/archarm/boot
umount /mnt/archarm
```

Dann SD-Karte in den Raspberry Pi stecken und starten.

---

## Hinweise

- **EEPROM-Firmware** auf dem Pi 4 sollte aktuell sein (für UEFI-Boot)
- **Erster Boot:** Root-Login ohne Passwort, dann `passwd` setzen
- **Netzwerk:** `systemctl enable --now systemd-networkd` oder `NetworkManager`
- **SSH:** `systemctl enable --now sshd`