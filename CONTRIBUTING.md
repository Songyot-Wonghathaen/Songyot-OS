# Contributing to Songyot OS

ขอบคุณที่สนใจมีส่วนร่วมในการพัฒนา Songyot OS! 🇹🇭

## วิธีการมีส่วนร่วม / How to Contribute

### 1. รายงานปัญหา / Report Bugs

หากพบปัญหา กรุณา:
1. ตรวจสอบว่ามี [issue](https://github.com/songyot-os/songyot-os/issues) ที่คล้ายกันหรือไม่
2. สร้าง issue ใหม่พร้อมข้อมูล:
   - เวอร์ชัน Songyot OS
   - ขั้นตอนการทำให้เกิดปัญหา
   - ผลลัพธ์ที่คาดหวัง vs ที่เกิดขึ้นจริง
   - Screenshot (ถ้ามี)
   - ข้อความ error (ถ้ามี)

### 2. แนะนำ Features

หากมีไอเดีย features ใหม่:
1. เปิด issue พร้อมรายละเอียด
2. อธิบายว่า feature นี้จะมีประโยชน์อย่างไร
3. ยกตัวอย่างการใช้งาน

### 3. Code Contribution

#### ขั้นตอน:

1. **Fork repository**
```bash
# คลิก Fork บน GitHub
```

2. **Clone fork**
```bash
git clone https://github.com/YOUR-USERNAME/Songyot-OS.git
cd Songyot-OS
```

3. **สร้าง branch ใหม่**
```bash
git checkout -b feature/your-feature-name
# หรือ
git checkout -b fix/your-bug-fix
```

4. **ทำการแก้ไข**
- เขียน code ตาม coding standards (ดูด้านล่าง)
- ทดสอบให้แน่ใจว่าทำงานถูกต้อง

5. **Commit changes**
```bash
git add .
git commit -m "Add: description of your changes"
```

Commit message format:
- `Add: ...` - เพิ่ม feature ใหม่
- `Fix: ...` - แก้ไข bug
- `Update: ...` - อัปเดตโค้ดที่มีอยู่
- `Remove: ...` - ลบโค้ดที่ไม่ใช้แล้ว
- `Docs: ...` - แก้ไข documentation

6. **Push to your fork**
```bash
git push origin feature/your-feature-name
```

7. **Create Pull Request**
- ไปที่ GitHub repository
- คลิก "New Pull Request"
- เลือก branch ของคุณ
- เขียนรายละเอียด PR:
  - ทำอะไร
  - แก้ไขปัญหาอะไร
  - ทดสอบแล้วอย่างไร

### 4. Documentation

ช่วยปรับปรุง documentation:
- แก้ไขคำผิด
- เพิ่มตัวอย่าง
- แปลภาษา
- เพิ่มรายละเอียดที่ยังขาด

### 5. Testing

ช่วยทดสอบ:
- ทดสอบ ISO ใหม่
- ทดสอบบน hardware ต่างๆ
- รายงานผลการทดสอบ

---

## Coding Standards

### Bash Scripts

```bash
#!/bin/bash

# Script description
# Author, date

set -e  # Exit on error

# Use meaningful variable names
VARIABLE_NAME="value"

# Use functions
function_name() {
    # Function code
}

# Comments for complex logic
# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi
```

### File Structure

```
Songyot-OS/
├── build/          # Build scripts
├── config/         # Configuration files
├── branding/       # Visual assets
├── packages/       # Custom packages
├── scripts/        # Utility scripts
└── docs/           # Documentation
```

### Naming Conventions

- Scripts: `kebab-case.sh` (e.g., `build-iso.sh`)
- Variables: `UPPER_SNAKE_CASE`
- Functions: `snake_case`
- Files: `kebab-case`

---

## Pull Request Guidelines

### ✅ Good PR:

- มีชื่อและคำอธิบายชัดเจน
- แก้ไขเฉพาะสิ่งที่จำเป็น
- ทดสอบแล้วว่าทำงานได้
- ไม่มี conflicts กับ main branch
- มี commit message ที่ดี

### ❌ Bad PR:

- ไม่มีคำอธิบาย
- แก้ไขหลายอย่างในครั้งเดียว
- ไม่ได้ทดสอบ
- มี conflicts
- Commit message ไม่ชัดเจน

---

## Code Review Process

1. **Submit PR** - สร้าง Pull Request
2. **Automatic Checks** - ระบบจะตรวจสอบอัตโนมัติ
3. **Review** - Maintainers จะ review โค้ด
4. **Feedback** - อาจมีข้อเสนอแนะให้แก้ไข
5. **Merge** - เมื่อผ่านการ review จะถูก merge

---

## Development Setup

### ติดตั้ง Development Environment

```bash
# ติดตั้ง dependencies
sudo apt-get install -y \
    debootstrap \
    squashfs-tools \
    xorriso \
    isolinux \
    syslinux-utils \
    grub-pc-bin \
    grub-efi-amd64-bin

# Clone repository
git clone https://github.com/songyot-os/Songyot-OS.git
cd Songyot-OS

# Test build
cd build
sudo ./build-iso.sh
```

---

## Areas Where We Need Help

### 🔴 High Priority

- [ ] Hardware testing (รายงานผลการทดสอบบน hardware ต่างๆ)
- [ ] Bug fixes
- [ ] Performance improvements
- [ ] Security patches

### 🟡 Medium Priority

- [ ] New features
- [ ] Desktop customization
- [ ] Additional software packages
- [ ] Documentation improvements

### 🟢 Low Priority

- [ ] UI/UX improvements
- [ ] Translations
- [ ] Website development
- [ ] Community building

---

## Community Guidelines

### ✅ DO:

- เคารพผู้อื่น
- ให้ feedback ที่สร้างสรรค์
- ช่วยเหลือผู้อื่น
- แชร์ความรู้
- รายงานปัญหาที่พบ

### ❌ DON'T:

- ใช้ภาษารุนแรงหรือไม่เหมาะสม
- Spam
- โพสต์ off-topic
- แชร์ข้อมูลส่วนตัวของผู้อื่น

---

## License

การ contribute หมายความว่าคุณยินยอมให้โค้ดของคุณอยู่ภายใต้ MIT License

---

## Questions?

หากมีคำถาม:
- เปิด issue บน GitHub
- อ่าน [FAQ](docs/FAQ.md)
- ติดต่อ maintainers

---

## Contributors

ขอบคุณทุกคนที่มีส่วนร่วม! ❤️

รายชื่อ contributors: [Contributors Page](https://github.com/songyot-os/songyot-os/graphs/contributors)

---

สร้างด้วยความรักสำหรับชุมชนคนไทย 🇹🇭
