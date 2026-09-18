# Supported Ubuntu Versions

## 🐧 Ubuntu Versions ที่รองรับ

Songyot OS สามารถ build บน Ubuntu หลายเวอร์ชัน:

---

## ✅ Recommended Versions

### Ubuntu 22.04 LTS "Jammy Jellyfish" (แนะนำ)
- **Status**: ✅ Fully Supported (Default)
- **Release**: April 2022
- **Support Until**: April 2027
- **Kernel**: Linux 5.15+
- **Why**: Stable, tested, long-term support

### Ubuntu 24.04 LTS "Noble Numbat"
- **Status**: ✅ Supported
- **Release**: April 2024
- **Support Until**: April 2029
- **Kernel**: Linux 6.8+
- **Why**: Newer packages, longer support

---

## ⚠️ Other Versions

### Ubuntu 20.04 LTS "Focal Fossa"
- **Status**: ⚠️ Works but not recommended
- **Support Until**: April 2025
- **Why Avoid**: Older packages, support ending soon

### Ubuntu 23.10, 24.10 (Non-LTS)
- **Status**: ⚠️ Should work but untested
- **Support**: Short-term (9 months)
- **Why Avoid**: Not stable for production

### Debian 11/12
- **Status**: ⚠️ Possible but requires script modifications
- **Note**: Package names differ from Ubuntu

---

## 🔧 How to Change Ubuntu Version

แก้ไขไฟล์: `build/build-iso.sh`

```bash
# Line 13: Change BASE_VERSION
BASE_VERSION="24.04"  # Ubuntu 24.04 LTS
```

**Supported values:**
- `"22.04"` - Ubuntu 22.04 LTS (default)
- `"24.04"` - Ubuntu 24.04 LTS
- `"20.04"` - Ubuntu 20.04 LTS (not recommended)

---

## 📊 Version Comparison

| Version | Release | EOL | Kernel | XFCE | Recommended |
|---------|---------|-----|--------|------|-------------|
| 20.04 LTS | 2020-04 | 2025-04 | 5.4 | 4.14 | ❌ Too old |
| 22.04 LTS | 2022-04 | 2027-04 | 5.15 | 4.16 | ✅ **Default** |
| 24.04 LTS | 2024-04 | 2029-04 | 6.8 | 4.18 | ✅ Newer |

---

## 🎯 Which Version to Choose?

### For Production (ใช้งานจริง):
- **Use 22.04 LTS** (default)
- Stable, well-tested, documented

### For Latest Features:
- **Use 24.04 LTS**
- Newer packages, longer support
- But less tested with our scripts

### For Testing Only:
- **Use 20.04 LTS** or non-LTS versions
- Not recommended for distribution

---

## 🐛 Known Issues

### Ubuntu 24.04
- ⚠️ Wayland by default (XFCE still uses X11)
- ⚠️ Some package names changed
- ✅ Build script works with minor adjustments

### Ubuntu 20.04
- ⚠️ Support ends April 2025
- ⚠️ Older XFCE version (4.14)
- ⚠️ Missing some packages

---

## 📝 Build Host vs ISO Base

**Important distinction:**

**Build Host** (เครื่องที่ใช้ build):
- Can be Ubuntu 22.04, 24.04, or 20.04
- Where you run `make build`

**ISO Base** (ระบบใน ISO):
- Defined by `BASE_VERSION` in build-iso.sh
- The Ubuntu version users will get

**Example:**
```bash
# Build on Ubuntu 24.04 → Creates ISO with Ubuntu 22.04 base
Build Host: Ubuntu 24.04
BASE_VERSION="22.04"
Result: Songyot OS ISO based on Ubuntu 22.04
```

---

## 🔄 Migration Guide

### From 22.04 → 24.04

1. Edit `build/build-iso.sh`:
   ```bash
   BASE_VERSION="24.04"
   ```

2. Test build:
   ```bash
   sudo ./build-iso.sh
   ```

3. Test ISO in VM

4. Update documentation:
   - README.md
   - docs/BUILD.md
   - CHANGELOG.md

### From 20.04 → 22.04

Same process, change to `"22.04"`

---

## 📚 References

- [Ubuntu Release Schedule](https://wiki.ubuntu.com/Releases)
- [Ubuntu LTS Release Cycle](https://ubuntu.com/about/release-cycle)
- [Debootstrap Supported Suites](https://salsa.debian.org/installer-team/debootstrap)

---

## 💡 Recommendations

### For Songyot OS v1.0:
- ✅ **Stick with Ubuntu 22.04 LTS** (current default)
- Proven stability
- 5-year support
- All scripts tested

### For Songyot OS v2.0 (future):
- 🎯 **Migrate to Ubuntu 24.04 LTS**
- Better hardware support
- Longer support (until 2029)
- Modern features

---

**Current Default**: Ubuntu 22.04 LTS ✅

*Updated: September 18, 2026*
