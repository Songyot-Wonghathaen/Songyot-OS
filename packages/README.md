# Songyot OS - Custom Packages

This directory will contain custom packages specific to Songyot OS.

## Package Types

### 1. System Packages
Custom system utilities and tools:
- `songyot-welcome` - Welcome application for first boot
- `songyot-settings` - System settings manager
- `songyot-updater` - Update manager
- `songyot-backup` - Backup and restore tool

### 2. Thai-Specific Packages
Applications for Thai users:
- `songyot-thai-dict` - Thai-English dictionary
- `songyot-thai-fonts` - Additional Thai fonts
- `songyot-thai-input` - Enhanced Thai input methods

### 3. Utilities
Helper applications:
- `songyot-hardware-info` - Hardware information display
- `songyot-driver-manager` - Driver installation wizard
- `songyot-app-store` - Curated application store

## Package Structure

```
package-name/
├── debian/
│   ├── control
│   ├── changelog
│   ├── rules
│   └── install
├── src/
│   └── (source files)
└── README.md
```

## Building Packages

To build a package:

```bash
cd packages/package-name
dpkg-buildpackage -b -uc -us
```

## Installing Packages

```bash
sudo dpkg -i package-name.deb
sudo apt-get install -f  # Fix dependencies
```

## Contributing

Want to create a custom package?

1. Follow Debian packaging guidelines
2. Use `songyot-` prefix for package names
3. Test thoroughly
4. Submit via Pull Request

## Package Repository

In the future, we'll host packages at:
- `deb https://repo.songyot-os.local/ubuntu jammy main`

---

**Coming soon!** 🚧
