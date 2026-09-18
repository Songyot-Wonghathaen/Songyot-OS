#!/bin/bash

# Songyot OS ISO Builder
# This script builds a custom Ubuntu-based ISO

set -e

# Configuration
OS_NAME="Songyot OS"
OS_VERSION="1.0"
OS_CODENAME="songyot"
BASE_DISTRO="ubuntu"
BASE_VERSION="22.04"  # Ubuntu 22.04 LTS
ARCH="amd64"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=====================================${NC}"
echo -e "${GREEN}  Songyot OS ISO Builder${NC}"
echo -e "${GREEN}=====================================${NC}"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run as root (use sudo)${NC}"
    exit 1
fi

# Check required tools
echo -e "${YELLOW}Checking dependencies...${NC}"
REQUIRED_TOOLS="debootstrap squashfs-tools xorriso isolinux syslinux-utils"

for tool in $REQUIRED_TOOLS; do
    if ! dpkg -l | grep -q "^ii  $tool"; then
        echo -e "${YELLOW}Installing $tool...${NC}"
        apt-get update
        apt-get install -y $tool
    fi
done

# Create build directories
BUILD_DIR="$(pwd)/iso-build"
CHROOT_DIR="$BUILD_DIR/chroot"
IMAGE_DIR="$BUILD_DIR/image"
ISO_DIR="$(pwd)/../dist"

echo -e "${YELLOW}Creating build directories...${NC}"
mkdir -p "$BUILD_DIR" "$CHROOT_DIR" "$IMAGE_DIR" "$ISO_DIR"

# Bootstrap base system
echo -e "${YELLOW}Bootstrapping base system (this may take a while)...${NC}"
debootstrap --arch=$ARCH $BASE_VERSION "$CHROOT_DIR" http://archive.ubuntu.com/ubuntu

# Mount necessary filesystems
echo -e "${YELLOW}Mounting filesystems...${NC}"
mount --bind /dev "$CHROOT_DIR/dev"
mount --bind /run "$CHROOT_DIR/run"
mount -t proc none "$CHROOT_DIR/proc"
mount -t sysfs none "$CHROOT_DIR/sys"
mount -t devpts none "$CHROOT_DIR/dev/pts"

# Copy DNS configuration
cp /etc/resolv.conf "$CHROOT_DIR/etc/resolv.conf"

# Create chroot configuration script
cat > "$CHROOT_DIR/tmp/configure-system.sh" << 'EOF'
#!/bin/bash
set -e

# Configure APT sources
cat > /etc/apt/sources.list << 'SOURCES'
deb http://archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
SOURCES

# Update package lists
apt-get update

# Install kernel and essential packages
apt-get install -y linux-generic casper lupin-casper

# Install desktop environment (XFCE - lightweight)
apt-get install -y xfce4 xfce4-goodies lightdm

# Install essential applications
apt-get install -y \
    firefox \
    libreoffice \
    gimp \
    vlc \
    git \
    vim \
    curl \
    wget \
    network-manager \
    network-manager-gnome

# Install Thai language support
apt-get install -y \
    language-pack-th \
    language-pack-th-base \
    fonts-thai-tlwg \
    ibus-libthai

# Set hostname
echo "songyot-os" > /etc/hostname

# Configure locale
locale-gen th_TH.UTF-8
update-locale LANG=th_TH.UTF-8

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*
rm -rf /var/tmp/*

echo "System configuration complete!"
EOF

chmod +x "$CHROOT_DIR/tmp/configure-system.sh"

# Execute configuration in chroot
echo -e "${YELLOW}Configuring system...${NC}"
chroot "$CHROOT_DIR" /tmp/configure-system.sh

# Copy branding files
echo -e "${YELLOW}Applying Songyot OS branding...${NC}"
mkdir -p "$CHROOT_DIR/etc/songyot"
echo "$OS_VERSION" > "$CHROOT_DIR/etc/songyot/version"

# Unmount filesystems
echo -e "${YELLOW}Cleaning up...${NC}"
umount "$CHROOT_DIR/dev/pts"
umount "$CHROOT_DIR/sys"
umount "$CHROOT_DIR/proc"
umount "$CHROOT_DIR/run"
umount "$CHROOT_DIR/dev"

# Create squashfs filesystem
echo -e "${YELLOW}Creating squashfs filesystem...${NC}"
mkdir -p "$IMAGE_DIR/casper"
mksquashfs "$CHROOT_DIR" "$IMAGE_DIR/casper/filesystem.squashfs" -e boot

# Copy kernel and initrd
echo -e "${YELLOW}Copying kernel files...${NC}"
cp "$CHROOT_DIR/boot/vmlinuz-"* "$IMAGE_DIR/casper/vmlinuz"
cp "$CHROOT_DIR/boot/initrd.img-"* "$IMAGE_DIR/casper/initrd"

# Create filesystem manifest
echo -e "${YELLOW}Creating filesystem manifest...${NC}"
chroot "$CHROOT_DIR" dpkg-query -W --showformat='${Package} ${Version}\n' > "$IMAGE_DIR/casper/filesystem.manifest"

# Create disk info
mkdir -p "$IMAGE_DIR/.disk"
echo "$OS_NAME $OS_VERSION" > "$IMAGE_DIR/.disk/info"
echo "full_cd/single" > "$IMAGE_DIR/.disk/cd_type"

# Create GRUB configuration
echo -e "${YELLOW}Creating bootloader configuration...${NC}"
mkdir -p "$IMAGE_DIR/boot/grub"
cat > "$IMAGE_DIR/boot/grub/grub.cfg" << 'GRUB_EOF'
set default="0"
set timeout=10

menuentry "Try Songyot OS without installing" {
    linux /casper/vmlinuz boot=casper quiet splash ---
    initrd /casper/initrd
}

menuentry "Install Songyot OS" {
    linux /casper/vmlinuz boot=casper only-ubiquity quiet splash ---
    initrd /casper/initrd
}

menuentry "Check disk for defects" {
    linux /casper/vmlinuz boot=casper integrity-check quiet splash ---
    initrd /casper/initrd
}
GRUB_EOF

# Create ISO
ISO_NAME="songyot-os-${OS_VERSION}-${ARCH}.iso"
echo -e "${YELLOW}Creating ISO image: $ISO_NAME${NC}"

grub-mkrescue -o "$ISO_DIR/$ISO_NAME" "$IMAGE_DIR" -- -volid "SONGYOT_OS"

# Calculate checksums
echo -e "${YELLOW}Generating checksums...${NC}"
cd "$ISO_DIR"
sha256sum "$ISO_NAME" > "$ISO_NAME.sha256"

# Cleanup build directory
echo -e "${YELLOW}Cleaning up build files...${NC}"
rm -rf "$BUILD_DIR"

echo -e "${GREEN}=====================================${NC}"
echo -e "${GREEN}Build complete!${NC}"
echo -e "${GREEN}ISO location: $ISO_DIR/$ISO_NAME${NC}"
echo -e "${GREEN}=====================================${NC}"
echo ""
echo "You can now:"
echo "1. Test the ISO in a virtual machine (VirtualBox, VMware)"
echo "2. Write it to a USB drive using:"
echo "   sudo dd if=$ISO_DIR/$ISO_NAME of=/dev/sdX bs=4M status=progress"
echo "   (Replace /dev/sdX with your USB drive)"
