# Songyot OS - Quick Start Guide

## เริ่มต้นใช้งาน Songyot OS ภายใน 5 นาที! ⚡

### สำหรับผู้ใช้ทั่วไป

#### 1️⃣ ดาวน์โหลด ISO
```bash
# ดาวน์โหลดจาก releases page
wget https://github.com/songyot-os/songyot-os/releases/latest/download/songyot-os-1.0-amd64.iso
```

#### 2️⃣ สร้าง Bootable USB (ใน Linux)
```bash
sudo dd if=songyot-os-1.0-amd64.iso of=/dev/sdX bs=4M status=progress
sudo sync
```
**หมายเหตุ:** เปลี่ยน `sdX` เป็น USB drive ของคุณ (ดูด้วย `lsblk`)

#### 3️⃣ Boot และติดตั้ง
1. เสียบ USB → รีสตาร์ท → กด F12/F2/Delete เข้า Boot Menu
2. เลือก USB drive
3. เลือก "Install Songyot OS"
4. ทำตาม wizard (เลือกภาษา → พาร์ติชั่น → สร้าง user → รอติดตั้ง)
5. เสร็จแล้ว! 🎉

---

### สำหรับ Developers

#### Build ISO จาก Source

**Requirements:**
- Ubuntu 22.04 LTS หรือใหม่กว่า
- RAM: 8 GB+
- Storage: 50 GB free space
- Root access

**Build Steps:**

```bash
# 1. Clone repository
git clone https://github.com/songyot-os/Songyot-OS.git
cd Songyot-OS

# 2. ติดตั้ง dependencies (อัตโนมัติโดย script)
cd build

# 3. Build ISO (ใช้เวลา 30-60 นาที)
sudo ./build-iso.sh

# 4. ISO จะอยู่ที่
# dist/songyot-os-1.0-amd64.iso
```

**Test ใน VirtualBox:**
```bash
# สร้าง VM
VBoxManage createvm --name "SongyotOS" --ostype Ubuntu_64 --register
VBoxManage modifyvm "SongyotOS" --memory 4096 --vram 128
VBoxManage createhd --filename ~/VMs/SongyotOS.vdi --size 25000
VBoxManage storagectl "SongyotOS" --name "SATA" --add sata
VBoxManage storageattach "SongyotOS" --storagectl "SATA" --port 0 --device 0 --type hdd --medium ~/VMs/SongyotOS.vdi
VBoxManage storageattach "SongyotOS" --storagectl "SATA" --port 1 --device 0 --type dvddrive --medium dist/songyot-os-1.0-amd64.iso

# เริ่ม VM
VBoxManage startvm "SongyotOS"
```

---

### คำสั่งที่มีประโยชน์

#### อัปเดตระบบ
```bash
sudo apt update && sudo apt upgrade -y
```

#### ติดตั้งโปรแกรมเพิ่มเติม
```bash
cd /usr/share/songyot/scripts
sudo ./install-packages.sh
```

#### ดูข้อมูลระบบ
```bash
bash scripts/system-info.sh
```

#### ตั้งค่า Thai Input
```bash
ibus-setup
# เพิ่ม Thai ใน Input Method
```

---

### โครงสร้างโปรเจกต์

```
Songyot-OS/
├── build/                  # Build scripts
│   └── build-iso.sh       # Main ISO builder
├── config/                 # Configuration files
│   ├── os-release         # OS identification
│   └── songyot-config.json
├── branding/              # Visual assets
│   ├── logos/
│   ├── wallpapers/
│   └── themes/
├── packages/              # Custom packages
├── scripts/               # Utility scripts
│   ├── customize-desktop.sh
│   ├── install-packages.sh
│   └── system-info.sh
├── docs/                  # Documentation
│   ├── BUILD.md          # Build instructions
│   ├── INSTALL.md        # Installation guide
│   ├── FAQ.md            # Frequently asked questions
│   └── QUICKSTART.md     # This file
├── README.md
├── LICENSE
└── CONTRIBUTING.md
```

---

### ปัญหาที่พบบ่อย

**Q: Build ล้มเหลว?**
```bash
# ตรวจสอบ dependencies
sudo apt install debootstrap squashfs-tools xorriso isolinux

# เคลียร์ build cache
sudo rm -rf build/iso-build/

# Build ใหม่
cd build && sudo ./build-iso.sh
```

**Q: USB boot ไม่ได้?**
- ปิด Secure Boot ใน BIOS
- เปลี่ยน boot mode เป็น Legacy/UEFI
- ลองสร้าง bootable USB ใหม่

**Q: หา package ไม่เจอ?**
```bash
sudo apt update
sudo apt install <package-name>
```

---

### Next Steps

✅ ติดตั้งแล้ว → อ่าน [User Guide](USER_GUIDE.md)  
🔧 จะ contribute → อ่าน [CONTRIBUTING.md](../CONTRIBUTING.md)  
❓ มีคำถาม → อ่าน [FAQ.md](FAQ.md)  
🐛 เจอ bug → [Report Issue](https://github.com/songyot-os/songyot-os/issues)

---

### ติดต่อและสนับสนุน

- 📧 Email: support@songyot-os.local
- 🐙 GitHub: https://github.com/songyot-os/songyot-os
- 💬 Issues: https://github.com/songyot-os/songyot-os/issues

---

**สร้างด้วยความรักสำหรับชุมชนคนไทย** 🇹🇭  
**Built with love for Thai community**
