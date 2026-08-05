------------------------ Mein Text --------------------------------------
+Aufsetzen eines Arch Linux für Raspberry Pi 4 B 
+ISO-Image Download: https://archive.archlinux.org/
+Rufus Downlad und inbetriebnahme.
+	-GPT für Life System genommen da es ein Raspi 4 B "aushält"
+Arch Life system hochfahren
+loadkeys de-latin1
+Mit iwctl das WLAN eingestellt
+timedatectl to Look if System clock is accurate for package Download 
+Mit cat /sys/firmware/efi/fw_platform_size überprüfen ob wir efi sind
+mit fdisk die Partitionen für ein efi system herrichten 
+Mit mkfs die Partitionen formatieren
+Alle Partitionen mounten
+Alle Packages mit pacstrap installieren
+Einen fstab generieren
+Mit Charoot auf das Zielsystem verbinden
+ln und hwclock die Zeitzone eingestellt
+ Mit Echo die Keyboard Layouts in vconsole.conf und locale.conf reinschreiben
+ Hostname auch mit Echo erstellen
+ Initramfs mit mkinitcpio -P erstellen
+ Passwort für Root einstellen
+ grub und efibootmgr installieren 
+ Grub initialisieren 
+ Aus Charoot raus und alles unmounten 
+ Reboot



------------------------ Der Text von OpenCode -------------------------------
# Arch Linux auf Raspberry Pi 4B – Installationsanleitung

## 1. Vorbereitung
- **ISO-Image herunterladen:** https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4 (Arch Linux ARM für RPi 4)
- **Rufus herunterladen & starten:** https://rufus.ie/
  - Ziel: microSD-Karte
  - Partitionsschema: **GPT** (Raspberry Pi 4B unterstützt UEFI/GPT)
  - Dateisystem: FAT32 für die EFI-Partition

## 2. Live-System booten & Grundeinrichtung
1. **Arch Linux ARM booten** (via microSD)
2. **Tastaturlayout setzen:**
   ```bash
   loadkeys de-latin1
   ```
3. **Systemzeit prüfen/synchronisieren:**
   ```bash
   timedatectl set-ntp true
   timedatectl status
   ```
4. **Mit iwctl WLAN verbinden (Internet herstellen):**
   ```bash
   iwctl
   station wlan0 scan
   station wlan0 connect "SSID"
   # Passwort eingeben
   exit
   ```
5. **Internetverbindung prüfen:**
   ```bash
   ping -c 3 archlinux.org
   # oder
   curl -I https://archlinux.org
   ```
6. **UEFI-Modus prüfen:**
   ```bash
   cat /sys/firmware/efi/fw_platform_size
   # Ausgabe "64" = UEFI 64-bit (erwartet auf Pi 4B)
   ```

## 3. Partitionierung (GPT + EFI)
```bash
fdisk /dev/mmcblk0
# g  → neue GPT-Tabelle
# n  → Partition 1 (EFI): +512M, Typ: EFI System Partition (ef00)
# n  → Partition 2 (Root): Rest, Typ: Linux filesystem (8300)
# w  → schreiben
```

## 4. Dateisysteme erstellen
```bash
mkfs.fat -F32 /dev/mmcblk0p1   # EFI-Partition
mkfs.ext4 /dev/mmcblk0p2       # Root-Partition
```

## 5. Partitionen mounten
```bash
mount /dev/mmcblk0p2 /mnt
mkdir -p /mnt/boot
mount /dev/mmcblk0p1 /mnt/boot
```

## 6. Basissystem installieren
```bash
pacstrap /mnt base linux-aarch64 linux-firmware base-devel networkmanager sudo vim nano
```

## 7. fstab generieren
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## 8. Ins Zielsystem wechseln (chroot)
```bash
arch-chroot /mnt
```

## 9. Systemkonfiguration im Chroot
```bash
# Zeitzone (Beispiel Berlin)
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

# Locale & Tastatur
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=de_DE.UTF-8" > /etc/locale.conf
echo "KEYMAP=de-latin1" > /etc/vconsole.conf

# Hostname
echo "archpi" > /etc/hostname
echo "127.0.1.1 archpi.localdomain archpi" >> /etc/hosts

# Root-Passwort
passwd

# Initramfs
mkinitcpio -P
```

## 10. Bootloader (systemd-boot empfohlen für ARM)
```bash
pacman -S systemd-boot
bootctl --path=/boot install
```
**/boot/loader/entries/arch.conf erstellen:**
```
title   Arch Linux ARM
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/mmcblk0p2) rw rootwait
```
**/boot/loader/loader.conf:**
```
default arch
timeout 3
console-mode keep
editor  no
```

> **Alternative GRUB (falls bevorzugt):**
> ```bash
> pacman -S grub efibootmgr
> grub-install --target=arm64-efi --efi-directory=/boot --bootloader-id=GRUB
> grub-mkconfig -o /boot/grub/grub.cfg
> ```

## 11. Netzwerk & SSH aktivieren
```bash
systemctl enable NetworkManager
systemctl enable sshd
```

## 12. Verlassen & Neustart
```bash
exit           # chroot verlassen
umount -R /mnt # alle Partitionen aushängen
reboot
```

---

## Wichtige Hinweise für Raspberry Pi 4B
- **Arch Linux ARM** verwenden (nicht x86_64 ISO): https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4
- **UEFI-Firmware** muss aktuell sein (EEPROM-Update via `rpi-eeprom-update` auf einem laufenden Pi)
- **Bootloader:** systemd-boot ist auf ARM oft einfacher als GRUB
- **Kernel:** `linux-aarch64` Paket verwenden (nicht `linux`)
- **Boot-Partition:** Muss FAT32 sein, mind. 512 MB empfohlen

## Nützliche Pakete nach dem Boot
```bash
pacman -S base-devel git networkmanager openssh vim htop btop
systemctl enable --now NetworkManager sshd
```