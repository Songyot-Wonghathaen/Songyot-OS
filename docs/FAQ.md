# Songyot OS - Frequently Asked Questions

## คำถามที่พบบ่อย / FAQ

### ทั่วไป / General

**Q: Songyot OS คืออะไร?**  
A: Songyot OS เป็น Linux Distribution ที่พัฒนาจาก Ubuntu โดยปรับแต่งให้เหมาะกับผู้ใช้ไทย มีการติดตั้งฟอนต์ไทย, ภาษาไทย, และโปรแกรมที่จำเป็นไว้แล้ว

**Q: ใช้งานฟรีจริงหรือไม่?**  
A: ใช่ ฟรี 100% และเป็น open source ภายใต้สัญญาอนุญาต GPL-3.0

**Q: ต่างจาก Ubuntu อย่างไร?**  
A: Songyot OS มี:
- ติดตั้งภาษาไทยและฟอนต์ไทยพร้อมใช้งาน
- ปรับแต่ง theme และ wallpaper สวยงาม
- คัดสรรโปรแกรมที่จำเป็น ไม่มี bloatware
- รองรับผู้ใช้ไทยโดยเฉพาะ

**Q: เหมาะกับใคร?**  
A: เหมาะกับทุกคนที่ต้องการใช้ Linux โดยเฉพาะ:
- ผู้เริ่มต้นใช้ Linux
- นักเรียน นักศึกษา
- ผู้ที่ต้องการระบบเบาและเสถียร
- คนที่ต้องการใช้ภาษาไทยบน Linux

---

### การติดตั้ง / Installation

**Q: ต้องลบ Windows ไหม?**  
A: ไม่จำเป็น สามารถติดตั้งควบคู่กับ Windows ได้ (Dual Boot)

**Q: ติดตั้งยากไหม?**  
A: ไม่ยาก มี wizard แนะนำทีละขั้นตอน ใช้เวลาประมาณ 15-30 นาที

**Q: จะกู้คืนเป็น Windows ได้ไหม?**  
A: ได้ แต่ต้องมี Windows installation media และอาจต้องฟอร์แมตพาร์ติชั่น

**Q: ควรแบ่งพาร์ติชั่นอย่างไร?**  
A: แนะนำ:
- `/` (root): 30-50 GB
- `/home`: พื้นที่ส่วนใหญ่ (เก็บข้อมูลส่วนตัว)
- `swap`: 4-8 GB (หรือเท่ากับ RAM)

**Q: สามารถติดตั้งจาก VirtualBox ได้ไหม?**  
A: ได้ เหมาะสำหรับทดลองก่อนติดตั้งจริง

---

### การใช้งาน / Usage

**Q: สามารถเปิดไฟล์ Office ได้ไหม?**  
A: ได้ ใช้ LibreOffice ที่รองรับไฟล์ .doc, .docx, .xls, .xlsx, .ppt, .pptx

**Q: ใช้โปรแกรม Windows ได้ไหม?**  
A: บางโปรแกรมสามารถใช้ผ่าน Wine ได้ แต่ไม่รับประกันว่าทุกโปรแกรมจะทำงาน แนะนำให้หาทางเลือกที่เป็น Linux native

**Q: เล่นเกมได้ไหม?**  
A: เกม Linux และ Steam (Proton) รองรับเกม Windows หลายเกม สามารถติดตั้ง Steam ได้

**Q: พิมพ์ภาษาไทยได้ไหม?**  
A: ได้ มีระบบ Thai input (IBus) ติดตั้งไว้แล้ว กด Super+Space เพื่อสลับภาษา

**Q: ดูหนัง ฟังเพลง ได้ไหม?**  
A: ได้ มี VLC Media Player ติดตั้งไว้แล้ว รองรับไฟล์เกือบทุกชนิด

---

### ปัญหาที่พบบ่อย / Common Issues

**Q: Wi-Fi ไม่เจอ?**  
A: ติดตั้ง firmware:
```bash
sudo apt install linux-firmware
sudo reboot
```

**Q: เสียงไม่ออก?**  
A: ติดตั้ง PulseAudio control:
```bash
sudo apt install pavucontrol
pavucontrol
```
จากนั้นเลือก output device

**Q: การ์ดจอ NVIDIA ใช้งานไม่ได้?**  
A: ติดตั้ง driver:
```bash
sudo ubuntu-drivers autoinstall
sudo reboot
```

**Q: ปริ้นเตอร์ใช้ไม่ได้?**  
A: เปิด Settings → Printers → Add Printer หรือติดตั้ง driver เพิ่มเติม

**Q: แป้นพิมพ์ภาษาไทยไม่ทำงาน?**  
A: ตรวจสอบ IBus:
```bash
ibus-setup
```
เพิ่ม Thai input method ในแท็บ "Input Method"

**Q: ระบบช้า?**  
A: ลองปิด visual effects และลบ startup programs ที่ไม่จำเป็น

---

### การอัปเดต / Updates

**Q: อัปเดตยังไง?**  
A: เปิด terminal แล้วรันคำสั่ง:
```bash
sudo apt update
sudo apt upgrade
```

**Q: อัปเดตบ่อยแค่ไหน?**  
A: แนะนำอัปเดตอย่างน้อยเดือนละครั้ง หรือเมื่อมีการแจ้งเตือน

**Q: จะอัปเกรดเป็นเวอร์ชันใหม่ได้ไหม?**  
A: ได้ เมื่อมีเวอร์ชันใหม่ ระบบจะแจ้งเตือน

---

### ความปลอดภัย / Security

**Q: ปลอดไวรัสจริงไหม?**  
A: Linux มีความปลอดภัยสูงกว่า Windows มาก ไวรัสที่โจมตี Linux มีน้อยมาก

**Q: ต้องใช้ antivirus ไหม?**  
A: ไม่จำเป็น แต่ควรอัปเดตระบบเป็นประจำ

**Q: ใช้ firewall ไหม?**  
A: มี UFW (Uncomplicated Firewall) ติดตั้งไว้แล้ว เปิดใช้งานด้วย:
```bash
sudo ufw enable
```

---

### การสนับสนุน / Support

**Q: มีปัญหาต้องถามที่ไหน?**  
A: 
1. อ่าน documentation ใน `docs/`
2. ค้นหา [GitHub Issues](https://github.com/songyot-os/songyot-os/issues)
3. สร้าง issue ใหม่พร้อมแนบข้อมูล

**Q: จะช่วยพัฒนาได้ไหม?**  
A: ได้! เปิดรับ contribution:
- แก้ไข bug
- เพิ่ม features
- แปลภาษา
- เขียน documentation
- ทดสอบและรายงาน bug

**Q: จะบริจาคสนับสนุนได้ไหม?**  
A: ขอบคุณมาก! รายละเอียดการบริจาคอยู่ที่หน้า GitHub

---

### ข้อมูลเพิ่มเติม / More Information

**Documentation:**
- [BUILD.md](BUILD.md) - วิธีสร้าง ISO
- [INSTALL.md](INSTALL.md) - วิธีติดตั้ง
- [README.md](../README.md) - ข้อมูลทั่วไป

**Links:**
- GitHub: https://github.com/songyot-os/songyot-os
- Website: https://songyot-os.local

**ยังมีคำถามอื่นๆ?**
สร้าง issue บน GitHub เราจะตอบเร็วที่สุด! 🇹🇭
