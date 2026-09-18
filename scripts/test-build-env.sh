#!/bin/bash

# Songyot OS - Test Script
# Run this to verify your build environment

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "======================================"
echo "  Songyot OS - Build Test"
echo "======================================"
echo ""

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo -e "${RED}✗ Not running on Linux${NC}"
    echo "This script must run on Ubuntu/Debian Linux"
    exit 1
fi
echo -e "${GREEN}✓ Running on Linux${NC}"

# Check Ubuntu version
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        echo -e "${GREEN}✓ Ubuntu detected: $VERSION${NC}"
    else
        echo -e "${YELLOW}⚠ Not Ubuntu, but may work: $NAME${NC}"
    fi
fi

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}⚠ Not running as root (some checks will be skipped)${NC}"
    SUDO="sudo"
else
    echo -e "${GREEN}✓ Running as root${NC}"
    SUDO=""
fi

# Check disk space
AVAILABLE=$(df -BG . | awk 'NR==2 {print $4}' | sed 's/G//')
if [ "$AVAILABLE" -lt 50 ]; then
    echo -e "${RED}✗ Insufficient disk space: ${AVAILABLE}GB (need 50GB+)${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Sufficient disk space: ${AVAILABLE}GB${NC}"

# Check RAM
TOTAL_RAM=$(free -g | awk '/^Mem:/ {print $2}')
if [ "$TOTAL_RAM" -lt 8 ]; then
    echo -e "${YELLOW}⚠ Low RAM: ${TOTAL_RAM}GB (recommend 8GB+)${NC}"
else
    echo -e "${GREEN}✓ Sufficient RAM: ${TOTAL_RAM}GB${NC}"
fi

# Check required packages
echo ""
echo "Checking required packages..."

PACKAGES=(
    "debootstrap:debootstrap"
    "mksquashfs:squashfs-tools"
    "xorriso:xorriso"
    "isolinux:isolinux"
    "grub-mkrescue:grub-common"
)

MISSING=0
for pkg_check in "${PACKAGES[@]}"; do
    IFS=: read -r cmd pkg <<< "$pkg_check"
    if command -v "$cmd" &> /dev/null; then
        echo -e "${GREEN}✓ $pkg${NC}"
    else
        echo -e "${RED}✗ $pkg (missing)${NC}"
        MISSING=1
    fi
done

if [ $MISSING -eq 1 ]; then
    echo ""
    echo -e "${YELLOW}Install missing packages with:${NC}"
    echo "sudo apt update"
    echo "sudo apt install -y debootstrap squashfs-tools xorriso isolinux syslinux-utils grub-pc-bin grub-efi-amd64-bin"
fi

# Check internet connection
echo ""
if ping -c 1 archive.ubuntu.com &> /dev/null; then
    echo -e "${GREEN}✓ Internet connection OK${NC}"
else
    echo -e "${RED}✗ No internet connection${NC}"
    echo "Internet required to download packages"
fi

# Summary
echo ""
echo "======================================"
if [ $MISSING -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo -e "${GREEN}Ready to build Songyot OS${NC}"
    echo ""
    echo "Run: cd build && sudo ./build-iso.sh"
else
    echo -e "${YELLOW}⚠ Some requirements missing${NC}"
    echo "Please install missing packages first"
fi
echo "======================================"
