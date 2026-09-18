#!/bin/bash

# Songyot OS - Cleanup Script
# Clean up build artifacts and temporary files

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}Songyot OS - Cleanup Script${NC}"
echo ""

# Confirm cleanup
read -p "This will delete all build artifacts. Continue? [y/N]: " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "Cleanup cancelled"
    exit 0
fi

echo -e "${YELLOW}Cleaning up...${NC}"

# Remove build directory
if [ -d "build/iso-build" ]; then
    echo "Removing build/iso-build..."
    if [ "$EUID" -eq 0 ]; then
        # Unmount any remaining mounts
        umount -l build/iso-build/chroot/dev/pts 2>/dev/null || true
        umount -l build/iso-build/chroot/sys 2>/dev/null || true
        umount -l build/iso-build/chroot/proc 2>/dev/null || true
        umount -l build/iso-build/chroot/run 2>/dev/null || true
        umount -l build/iso-build/chroot/dev 2>/dev/null || true
        rm -rf build/iso-build
        echo -e "${GREEN}✓ Removed build/iso-build${NC}"
    else
        echo -e "${RED}✗ Need root to clean build directory${NC}"
        echo "Run: sudo ./scripts/cleanup.sh"
    fi
fi

# Remove dist directory ISO files
if [ -d "dist" ]; then
    echo "Removing ISO files in dist/..."
    rm -f dist/*.iso dist/*.iso.sha256 2>/dev/null || true
    echo -e "${GREEN}✓ Removed ISO files${NC}"
fi

# Remove log files
echo "Removing log files..."
find . -name "*.log" -type f -delete 2>/dev/null || true
echo -e "${GREEN}✓ Removed log files${NC}"

# Remove temporary files
echo "Removing temporary files..."
find . -name "*.tmp" -type f -delete 2>/dev/null || true
find . -name "*.temp" -type f -delete 2>/dev/null || true
find . -name "*~" -type f -delete 2>/dev/null || true
echo -e "${GREEN}✓ Removed temporary files${NC}"

# Remove cache files
echo "Removing cache files..."
find . -name "*.cache" -type f -delete 2>/dev/null || true
echo -e "${GREEN}✓ Removed cache files${NC}"

echo ""
echo -e "${GREEN}Cleanup complete!${NC}"
echo ""
echo "Disk space freed:"
du -sh . 2>/dev/null || true
