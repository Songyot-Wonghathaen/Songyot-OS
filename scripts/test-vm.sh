#!/bin/bash

# Songyot OS - Virtual Machine Test Script
# Automatically test ISO in QEMU

set -e

ISO_PATH="dist/songyot-os-1.0-amd64.iso"
VM_NAME="songyot-test"
RAM="4096"  # 4GB
DISK_SIZE="25G"
DISK_PATH="test-disk.qcow2"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Songyot OS - QEMU Test${NC}"
echo ""

# Check if QEMU is installed
if ! command -v qemu-system-x86_64 &> /dev/null; then
    echo -e "${RED}QEMU not found${NC}"
    echo "Install with: sudo apt install qemu-system-x86"
    exit 1
fi

# Check if ISO exists
if [ ! -f "$ISO_PATH" ]; then
    echo -e "${RED}ISO not found: $ISO_PATH${NC}"
    echo "Build ISO first: cd build && sudo ./build-iso.sh"
    exit 1
fi

echo -e "${GREEN}✓ Found ISO: $ISO_PATH${NC}"

# Create virtual disk if not exists
if [ ! -f "$DISK_PATH" ]; then
    echo "Creating virtual disk ($DISK_SIZE)..."
    qemu-img create -f qcow2 "$DISK_PATH" "$DISK_SIZE"
    echo -e "${GREEN}✓ Created $DISK_PATH${NC}"
fi

# Start VM
echo ""
echo "Starting QEMU..."
echo "RAM: $RAM MB"
echo "Disk: $DISK_PATH"
echo "ISO: $ISO_PATH"
echo ""
echo -e "${YELLOW}Press Ctrl+Alt+G to release mouse${NC}"
echo -e "${YELLOW}Press Ctrl+Alt+F to toggle fullscreen${NC}"
echo ""

qemu-system-x86_64 \
    -name "$VM_NAME" \
    -m "$RAM" \
    -cdrom "$ISO_PATH" \
    -hda "$DISK_PATH" \
    -boot d \
    -enable-kvm \
    -cpu host \
    -smp 2 \
    -vga virtio \
    -display sdl \
    -net nic \
    -net user

echo ""
echo -e "${GREEN}VM closed${NC}"
