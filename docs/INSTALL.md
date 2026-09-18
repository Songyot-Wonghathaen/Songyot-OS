# Songyot OS - Installation Guide

## วิธีการติดตั้ง / Installation Guide

### ขั้นตอนที่ 1: ดาวน์โหลด ISO / Step 1: Download ISO

ดาวน์โหลดไฟล์ ISO ของ Songyot OS จาก:
- [Release Page](https://github.com/songyot-os/songyot-os/releases)
- หรือ build เองตาม [BUILD.md](BUILD.md)

### ขั้นตอนที่ 2: สร้าง Bootable USB / Step 2: Create Bootable USB

#### ใน Linux:
```bash
sudo dd if=songyot-os-1.0-amd64.iso of=/dev/sdX bs=4M status=progress
sudo sync
```
เปลี่ยน `/dev/sdX` เป็น USB ของคุณ (ตรวจสอบด้วย `lsblk`)

#### ใน Windows:
1. ดาวน์โหลด [Rufus](https://rufus.ie/)
2. เลือกไฟล์ ISO ของ Songyot OS
3. เลือก USB drive
4. คลิก "START"

#### ใน macOS:
```bash
sudo dd if=songyot-os-1.0-amd64.iso of=/dev/diskX bs=4m
sudo sync
```
เปลี่ยน `/dev/diskX` เป็น USB ของคุณ (ตรวจสอบด้วย `diskutil list`)

### ขั้นตอนที่ 3: Boot จาก USB / Step 3: Boot from USB

1. เสียบ USB เข้ากับคอมพิวเตอร์
2. รีสตาร์ทคอมพิวเตอร์
3. กด F2, F12, Delete หรือ Esc เพื่อเข้า Boot Menu (ขึ้นอยู่กับเมนบอร์ด)
4. เลือก boot จาก USB

### ขั้นตอนที่ 4: ติดตั้ง Songyot OS / Step 4: Install Songyot OS

หลังจาก boot แล้ว คุณจะเห็นหน้าจอ GRUB:

1. **Try Songyot OS without installing** - ทดลองใช้โดยไม่ต้องติดตั้ง
2. **Install Songyot OS** - ติดตั้งเข้าฮาร์ดดิสก์
3. **Check disk for defects** - ตรวจสอบความเสียหายของ USB

เลือก **Install Songyot OS** แล้วทำตามขั้นตอนต่อไปนี้:

#### 4.1 เลือกภาษา / Choose Language
- เลือก "ไทย" หรือ "English"

#### 4.2 เลือก Keyboard Layout
- เลือก "Thai" หรือ "US"

#### 4.3 เชื่อมต่อ Wi-Fi (ถ้ามี)
- เชื่อมต่อ Wi-Fi เพื่ออัปเดตระหว่างติดตั้ง (แนะนำ)

#### 4.4 เลือกประเภทการติดตั้ง

**Normal Installation:**
- ติดตั้งโปรแกรมพื้นฐานทั้งหมด
- เว็บเบราว์เซอร์, โปรแกรมสำนักงาน, เกม
- แนะนำสำหรับผู้ใช้ทั่วไป

**Minimal Installation:**
- ติดตั้งเฉพาะระบบพื้นฐาน
- เว็บเบราว์เซอร์เท่านั้น
- สำหรับผู้ที่ต้องการเลือกติดตั้งเองทีหลัง

**ตัวเลือกอื่นๆ:**
- ✅ Download updates while installing
- ✅ Install third-party software (แนะนำสำหรับ Wi-Fi และ graphics drivers)

#### 4.5 เลือกวิธีการติดตั้ง / Choose Installation Type

**Erase disk and install Songyot OS:**
- ลบข้อมูลในฮาร์ดดิสก์ทั้งหมดและติดตั้ง Songyot OS
- ⚠️ ข้อมูลทั้งหมดจะถูกลบ!

**Install alongside [OS name]:**
- ติดตั้งควบคู่กับ OS เดิม (Dual Boot)
- เลือกขนาดพาร์ติชั่นที่ต้องการ

**Something else:**
- แบ่งพาร์ติชั่นเอง (สำหรับผู้ใช้ขั้นสูง)

**แนะนำสำหรับการแบ่งพาร์ติชั่นเอง:**
- `/` (root): 25-50 GB (ext4)
- `/home`: พื้นที่ที่เหลือ (ext4)
- `swap`: 4-8 GB (หรือเท่ากับ RAM)

#### 4.6 เลือกเขตเวลา / Choose Timezone
- เลือก "Bangkok" หรือเมืองใกล้เคียง

#### 4.7 สร้างบัญชีผู้ใช้ / Create User Account
- Your name: ชื่อของคุณ
- Computer name: ชื่อคอมพิวเตอร์ (hostname)
- Username: ชื่อผู้ใช้ (ใช้ตัวอักษรพิมพ์เล็ก)
- Password: รหัสผ่าน
- Confirm password: ยืนยันรหัสผ่าน

**ตัวเลือกการเข้าสู่ระบบ:**
- Log in automatically (เข้าระบบอัตโนมัติ)
- Require password to log in (ต้องใช้รหัสผ่าน - แนะนำ)

#### 4.8 รอการติดตั้ง / Wait for Installation
- ระบบจะติดตั้งอัตโนมัติ (ประมาณ 10-30 นาที)
- คุณสามารถอ่านคุณสมบัติของ Songyot OS ระหว่างรอได้

#### 4.9 เสร็จสิ้นการติดตั้ง / Installation Complete
- คลิก "Restart Now"
- ถอด USB ออกเมื่อมีข้อความแจ้ง
- คอมพิวเตอร์จะรีสตาร์ทและเข้าสู่ Songyot OS

## หลังการติดตั้ง / Post-Installation

### อัปเดตระบบ / Update System
```bash
sudo apt update
sudo apt upgrade -y
```

### ติดตั้งโปรแกรมเพิ่มเติม / Install Additional Software
```bash
cd /usr/share/songyot/scripts
sudo ./install-packages.sh
```

### ติดตั้ง Thai Input Method
ระบบมี Thai input method ติดตั้งไว้แล้ว:
1. คลิกขวาที่ keyboard icon บนแถบเมนู
2. เลือก "IBus Preferences"
3. ไปที่แท็บ "Input Method"
4. คลิก "Add" → เลือก "Thai"

### ปรับแต่งเดสก์ท็อป / Customize Desktop
- Settings → Appearance → เลือก theme และ wallpaper
- Settings → Window Manager → ปรับแต่งหน้าต่าง
- Settings → Panel → จัดการแถบเมนู

## การแก้ปัญหา / Troubleshooting

### ไม่สามารถ boot จาก USB
1. ตรวจสอบว่า Secure Boot ปิดอยู่ใน BIOS
2. เปลี่ยน boot mode เป็น Legacy หรือ UEFI
3. ลองสร้าง bootable USB ใหม่

### Wi-Fi ไม่ทำงาน
```bash
sudo apt install linux-firmware
sudo reboot
```

### เสียงไม่ออก
```bash
sudo apt install pavucontrol
pavucontrol
```
จากนั้นเลือก output device ที่ถูกต้อง

### การ์ดจอไม่ทำงานเต็มประสิทธิภาพ

**สำหรับ NVIDIA:**
```bash
sudo apt install nvidia-driver-525
sudo reboot
```

**สำหรับ AMD:**
```bash
sudo apt install firmware-amd-graphics
sudo reboot
```

## ความต้องการของระบบ / System Requirements

### ต่ำสุด / Minimum:
- CPU: 2 GHz dual-core
- RAM: 4 GB
- Storage: 25 GB
- Display: 1024×768

### แนะนำ / Recommended:
- CPU: 2.5 GHz quad-core
- RAM: 8 GB
- Storage: 50 GB SSD
- Display: 1920×1080

## การสนับสนุน / Support

หากพบปัญหา:
1. อ่าน [FAQ](FAQ.md)
2. ค้นหาใน [GitHub Issues](https://github.com/songyot-os/songyot-os/issues)
3. สร้าง issue ใหม่พร้อมแนบข้อมูล:
   - เวอร์ชัน Songyot OS
   - ข้อความ error
   - Hardware ที่ใช้

## ขอบคุณ / Credits

Songyot OS สร้างขึ้นจาก:
- Ubuntu Linux
- XFCE Desktop Environment
- และ open source software มากมาย

สร้างด้วยความตั้งใจสำหรับชุมชนคนไทย 🇹🇭
