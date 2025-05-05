# 🌀 NVIDIA Fan Control on Wayland (Hyprland) using Xvfb

Automatically set your NVIDIA GPU fan speed on boot — even under Wayland — by faking an X session with Xvfb.

---

## 📦 Requirements

Install NVIDIA tools and virtual X server:

```bash
sudo pacman -S nvidia nvidia-utils nvidia-settings xorg-server-xvfb xorg-xauth
```

---

## ⚙️ Enable Coolbits

### Edit/create this file:
```
sudo nano /etc/X11/xorg.conf.d/20-nvidia.conf
```
### Paste:
```
Section "Device"
    Identifier "Nvidia Card"
    Driver "nvidia"
    Option "Coolbits" "4"
EndSection
```
### Then reboot.

---

## 🚀 Setup

### 1. Copy the files from this repo

```bash
sudo cp set-fan-xvfb.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/set-fan-xvfb.sh

sudo cp set-nvidia-fan.service /etc/systemd/system/
```

### 2. Enable and start the service
```
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now set-nvidia-fan.service
```
This will now run the fan script automatically at every boot.

---

### ✅ Verify

After reboot, check that the fan speed is applied:
```
nvidia-settings -q "[fan:0]/GPUTargetFanSpeed"
```
