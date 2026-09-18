# Building Songyot OS

This guide explains how to build a Songyot OS ISO image from source.

## Prerequisites

### System Requirements

- **Operating System**: Ubuntu 22.04 LTS or newer
- **RAM**: 8 GB minimum, 16 GB recommended
- **Storage**: 50 GB free space
- **Internet**: Stable connection required for downloading packages

### Required Software

The build script will automatically install these if missing:
- `debootstrap` - Bootstrap a basic Debian/Ubuntu system
- `squashfs-tools` - Create compressed filesystem
- `xorriso` - Create ISO images
- `isolinux` - Bootloader
- `syslinux-utils` - Syslinux utilities
- `grub-pc-bin` - GRUB bootloader
- `grub-efi-amd64-bin` - GRUB EFI support

## Building the ISO

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/Songyot-OS.git
cd Songyot-OS
```

### Step 2: Run the Build Script

```bash
cd build
sudo ./build-iso.sh
```

The build process will:
1. Check and install required dependencies
2. Bootstrap Ubuntu base system
3. Install desktop environment (XFCE)
4. Install Thai language support
5. Apply Songyot branding
6. Create bootable ISO image

**Note**: The first build can take 30-60 minutes depending on your internet speed and system performance.

### Step 3: Locate the ISO

After successful build, the ISO will be in:
```
Songyot-OS/dist/songyot-os-1.0-amd64.iso
```

A SHA256 checksum file will also be generated:
```
Songyot-OS/dist/songyot-os-1.0-amd64.iso.sha256
```

## Testing the ISO

### Using VirtualBox

1. Create a new VM:
   - Name: Songyot OS Test
   - Type: Linux
   - Version: Ubuntu (64-bit)
   - RAM: 4096 MB
   - Storage: 25 GB

2. Mount the ISO in the VM settings

3. Start the VM

### Using QEMU

```bash
qemu-system-x86_64 -cdrom dist/songyot-os-1.0-amd64.iso -m 4096 -boot d
```

### Creating Bootable USB

**Linux:**
```bash
sudo dd if=dist/songyot-os-1.0-amd64.iso of=/dev/sdX bs=4M status=progress
sudo sync
```

**Windows:**
Use [Rufus](https://rufus.ie/) or [Etcher](https://www.balena.io/etcher/)

**macOS:**
```bash
sudo dd if=dist/songyot-os-1.0-amd64.iso of=/dev/diskX bs=4m
sudo sync
```

Replace `sdX` or `diskX` with your USB device (check with `lsblk` or `diskutil list`)

## Customization

### Changing Desktop Environment

Edit `build/build-iso.sh` and replace XFCE with your choice:

```bash
# For GNOME
apt-get install -y ubuntu-desktop

# For KDE Plasma
apt-get install -y kubuntu-desktop

# For MATE
apt-get install -y mate-desktop-environment
```

### Adding Custom Packages

Edit the package installation section in `build/build-iso.sh`:

```bash
apt-get install -y \
    your-package-1 \
    your-package-2 \
    your-package-3
```

### Modifying Branding

- **Logos**: Place in `branding/logos/`
- **Wallpapers**: Place in `branding/wallpapers/`
- **Themes**: Place in `branding/themes/`

## Troubleshooting

### Build Fails: "E: Unable to locate package"

Check your internet connection and Ubuntu mirror availability.

### Not Enough Disk Space

The build process requires at least 50 GB. Use `df -h` to check available space.

### Permissions Error

Make sure to run the build script with `sudo`.

### Chroot Errors

If the build fails mid-process, unmount chroot filesystems:

```bash
sudo umount -l build/iso-build/chroot/dev/pts
sudo umount -l build/iso-build/chroot/sys
sudo umount -l build/iso-build/chroot/proc
sudo umount -l build/iso-build/chroot/run
sudo umount -l build/iso-build/chroot/dev
```

Then run the build again.

## Advanced Options

### Building for Different Architectures

Currently supports: amd64 (x86_64)

To add i386 or arm64 support, modify the `ARCH` variable in `build-iso.sh`.

### Custom Kernel

To use a custom kernel, modify the kernel installation in the chroot configuration.

## Next Steps

After building successfully:
1. Test the ISO thoroughly
2. Customize branding and themes
3. Add custom applications
4. Set up automatic builds with CI/CD
5. Create installation documentation

## Support

If you encounter issues:
1. Check the troubleshooting section
2. Review build logs in `build/iso-build/`
3. Open an issue on GitHub with logs attached
