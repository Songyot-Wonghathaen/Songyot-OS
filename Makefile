# Songyot OS Makefile
# Convenience commands for building and testing

.PHONY: help build test clean setup check

help:
	@echo "Songyot OS - Build Commands"
	@echo "============================"
	@echo ""
	@echo "Available commands:"
	@echo "  make setup    - Install build dependencies"
	@echo "  make check    - Check build environment"
	@echo "  make build    - Build ISO image"
	@echo "  make test     - Test ISO in QEMU"
	@echo "  make clean    - Clean build artifacts"
	@echo "  make help     - Show this help message"
	@echo ""

setup:
	@echo "Installing build dependencies..."
	sudo apt-get update
	sudo apt-get install -y \
		debootstrap \
		squashfs-tools \
		xorriso \
		isolinux \
		syslinux-utils \
		grub-pc-bin \
		grub-efi-amd64-bin \
		qemu-system-x86
	@echo "✓ Dependencies installed!"

check:
	@echo "Checking build environment..."
	sudo bash scripts/test-build-env.sh

build:
	@echo "Building Songyot OS ISO..."
	cd build && sudo ./build-iso.sh
	@echo "✓ Build complete! ISO at: dist/songyot-os-1.0-amd64.iso"

test:
	@echo "Testing ISO in QEMU..."
	bash scripts/test-vm.sh

clean:
	@echo "Cleaning build artifacts..."
	sudo bash scripts/cleanup.sh
	@echo "✓ Cleanup complete!"

all: setup check build
