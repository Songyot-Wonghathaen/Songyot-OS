# Songyot OS 🇹🇭

<div align="center">

![Songyot OS](https://img.shields.io/badge/Songyot%20OS-v1.0-blue?style=for-the-badge)
![Ubuntu](https://img.shields.io/badge/Based%20on-Ubuntu%2022.04%20LTS-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Linux Distribution ที่สร้างขึ้นสำหรับคนไทยโดยเฉพาะ**

*A Linux Distribution Built Specifically for Thai Users*

[Download](https://github.com/songyot-os/songyot-os/releases) • [Documentation](docs/) • [Contributing](CONTRIBUTING.md) • [Roadmap](docs/ROADMAP.md)

</div>

---

## 🌟 Features

- **🇹🇭 Thai-First Design** - รองรับภาษาไทยเต็มรูปแบบ พร้อมฟอนต์และ input method
- **⚡ Lightweight** - ใช้ XFCE desktop environment เบาและเร็ว
- **🔒 Stable** - พัฒนาบน Ubuntu 22.04 LTS มั่นคงและปลอดภัย
- **📦 Ready to Use** - ติดตั้งโปรแกรมจำเป็นมาให้แล้ว
- **🎨 Beautiful** - ธีมสวยงาม wallpaper คมชัด
- **🆓 Free Forever** - ฟรีตลอดไป Open Source ภายใต้ MIT License

---

## 📥 Download

### Latest Release: v1.0.0 "Stable"

**สำหรับผู้ใช้ทั่วไป:**
- [📀 Songyot OS 1.0 ISO (AMD64)](https://github.com/songyot-os/songyot-os/releases/latest)
- File size: ~2.5 GB
- SHA256: Available in releases

**ความต้องการของระบบ:**
- CPU: 2 GHz dual-core or better
- RAM: 4 GB minimum (8 GB recommended)
- Storage: 25 GB available space
- Display: 1024×768 or higher

---

## 🚀 Quick Start

### ติดตั้ง Songyot OS

**1. ดาวน์โหลด ISO**
```bash
wget https://github.com/songyot-os/songyot-os/releases/latest/download/songyot-os-1.0-amd64.iso
```

**2. สร้าง Bootable USB (Linux)**
```bash
sudo dd if=songyot-os-1.0-amd64.iso of=/dev/sdX bs=4M status=progress
sudo sync
```

**3. Boot และติดตั้ง**
- เสียบ USB → รีสตาร์ท → เข้า Boot Menu (F12/F2/Delete)
- เลือก Install Songyot OS
- ทำตาม wizard

📖 ดูคู่มือฉบับเต็ม: [INSTALL.md](docs/INSTALL.md)

### Build จาก Source

**Requirements:**
- Ubuntu 22.04 LTS or newer
- 8 GB RAM minimum
- 50 GB free disk space
- Root access

**Build Steps:**
```bash
# Clone repository
git clone https://github.com/songyot-os/Songyot-OS.git
cd Songyot-OS

# Test build environment
sudo bash scripts/test-build-env.sh

# Build ISO (30-60 minutes)
cd build
sudo ./build-iso.sh

# ISO will be at: dist/songyot-os-1.0-amd64.iso
```

📖 ดูคู่มือฉบับเต็ม: [BUILD.md](docs/BUILD.md)

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [README.md](README.md) | โปรเจกต์โดยรวม / Project overview |
| [QUICKSTART.md](docs/QUICKSTART.md) | เริ่มต้นใน 5 นาที / Quick start guide |
| [INSTALL.md](docs/INSTALL.md) | วิธีติดตั้งฉบับสมบูรณ์ / Installation guide |
| [BUILD.md](docs/BUILD.md) | วิธี build ISO / How to build |
| [SUPPORTED_VERSIONS.md](docs/SUPPORTED_VERSIONS.md) | Ubuntu versions ที่รองรับ / Supported versions |
| [FAQ.md](docs/FAQ.md) | คำถามที่พบบ่อย / FAQ |
| [CONTRIBUTING.md](CONTRIBUTING.md) | วิธีมีส่วนร่วม / Contributing guide |
| [ROADMAP.md](docs/ROADMAP.md) | แผนการพัฒนา / Development roadmap |
| [NEXT_STEPS.md](docs/NEXT_STEPS.md) | ขั้นตอนต่อไป / Next steps |

---

## 🛠️ What's Included

### Desktop Environment
- **XFCE 4.16** - เบา เร็ว ปรับแต่งได้
- **LightDM** - Display manager
- **Custom Theme** - ธีม Songyot OS เฉพาะ

### Pre-installed Software
- 🌐 **Firefox** - เว็บเบราว์เซอร์
- 📝 **LibreOffice** - โปรแกรมสำนักงาน
- 🎨 **GIMP** - แก้ไขรูปภาพ
- 🎬 **VLC** - เล่นวิดีโอ/เพลง
- 💻 **Git** - Version control
- 📄 **Vim** - Text editor

### Thai Support
- ✅ Thai fonts (Sarabun, Loma, Garuda)
- ✅ Thai input method (IBus)
- ✅ Thai locale (th_TH.UTF-8)
- ✅ Thai keyboard layouts

---

## 🗺️ Roadmap

### ✅ Version 1.0 - "Stable" (Current)
- Ubuntu 22.04 LTS base
- XFCE desktop
- Thai language support
- Essential software
- Build automation

### 🚧 Version 1.1 - "Enhance" (Q4 2026)
- Improved hardware support
- GUI package manager
- System utilities
- Performance optimizations

### 🎯 Version 1.5 - "Expand" (Q2 2027)
- Multiple desktop environments
- Edition variants (Lite/Full/Pro)
- Cloud integration
- Gaming support

### 🚀 Version 2.0 - "Modern" (Q1 2028)
- Ubuntu 24.04 LTS base
- Wayland display server
- Modern features
- AI integration

📖 ดูแผนฉบับเต็ม: [ROADMAP.md](docs/ROADMAP.md)

---

## 🤝 Contributing

เรายินดีรับ contribution จากทุกคน! 🎉

**วิธีมีส่วนร่วม:**
- 🐛 Report bugs
- 💡 Suggest features
- 📝 Improve documentation
- 🎨 Design themes/logos
- 💻 Write code
- 🧪 Test on hardware

📖 อ่านเพิ่มเติม: [CONTRIBUTING.md](CONTRIBUTING.md)

---

## 📊 Project Status

- **Version**: 1.0.0 "Stable"
- **Status**: ✅ Active Development
- **Base**: Ubuntu 22.04 LTS (Jammy)
- **Desktop**: XFCE 4.16
- **License**: MIT

---

## 📸 Screenshots

*(Screenshots will be added after first build)*

---

## 🔗 Links

- **GitHub**: [github.com/songyot-os/songyot-os](https://github.com/songyot-os/songyot-os)
- **Releases**: [Releases Page](https://github.com/songyot-os/songyot-os/releases)
- **Issues**: [Issue Tracker](https://github.com/songyot-os/songyot-os/issues)
- **Discussions**: Coming soon

---

## 💬 Community

- **Discord**: Coming soon
- **Telegram**: Coming soon
- **Facebook**: Coming soon
- **Twitter**: Coming soon

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file.

Songyot OS includes software from Ubuntu and other open source projects, each under their respective licenses.

---

## 🙏 Credits

**Built with:**
- [Ubuntu Linux](https://ubuntu.com) - Solid foundation
- [XFCE](https://xfce.org) - Desktop environment
- [Debootstrap](https://wiki.debian.org/Debootstrap) - Bootstrap tool
- Countless open source contributors ❤️

**Special Thanks:**
- Ubuntu community
- XFCE developers
- Thai Linux community
- All contributors

---

## 📧 Contact

- **Email**: support@songyot-os.local
- **GitHub Issues**: For bug reports and feature requests
- **GitHub Discussions**: For questions and community chat

---

## 🎯 Mission

**สร้างระบบปฏิบัติการที่ดีที่สุดสำหรับคนไทย**

*Build the best operating system for Thai people*

เราเชื่อว่าทุกคนควรมีสิทธิ์เข้าถึงเทคโนโลยีที่ดีและฟรี Songyot OS ถูกสร้างขึ้นเพื่อให้ผู้ใช้ไทยมีตัวเลือก Linux distribution ที่ใช้งานง่าย สวยงาม และรองรับภาษาไทยอย่างสมบูรณ์

We believe everyone deserves access to great, free technology. Songyot OS is built to give Thai users a Linux distribution that is easy to use, beautiful, and fully supports the Thai language.

---

<div align="center">

**สร้างด้วยความรักสำหรับชุมชนคนไทย** 🇹🇭

**Built with love for Thai community**

---

⭐ ถ้าชอบโปรเจกต์นี้ อย่าลืม Star บน GitHub!

*If you like this project, don't forget to give us a Star on GitHub!*

</div>
