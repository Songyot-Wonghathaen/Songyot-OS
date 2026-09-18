#!/bin/bash

# Songyot OS Package Installer
# Install additional software after OS installation

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Songyot OS Package Installer${NC}"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)"
    exit 1
fi

# Update package lists
echo -e "${YELLOW}Updating package lists...${NC}"
apt-get update

# Development Tools
read -p "Install Development Tools? (gcc, make, python, etc.) [y/N]: " dev
if [[ $dev =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installing development tools...${NC}"
    apt-get install -y build-essential python3 python3-pip nodejs npm
fi

# Graphics and Design
read -p "Install Graphics Tools? (Inkscape, Blender, etc.) [y/N]: " graphics
if [[ $graphics =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installing graphics tools...${NC}"
    apt-get install -y inkscape blender krita
fi

# Multimedia
read -p "Install Multimedia Tools? (Audacity, OBS Studio, etc.) [y/N]: " multimedia
if [[ $multimedia =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installing multimedia tools...${NC}"
    apt-get install -y audacity obs-studio kdenlive
fi

# Office and Productivity
read -p "Install Productivity Tools? (Thunderbird, FreeCAD, etc.) [y/N]: " productivity
if [[ $productivity =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installing productivity tools...${NC}"
    apt-get install -y thunderbird freecad pdfarranger
fi

# Gaming
read -p "Install Gaming Platform? (Steam, Wine, etc.) [y/N]: " gaming
if [[ $gaming =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installing gaming tools...${NC}"
    dpkg --add-architecture i386
    apt-get update
    apt-get install -y steam-installer wine64 wine32
fi

# System Utilities
read -p "Install System Utilities? (GParted, Synaptic, etc.) [y/N]: " utils
if [[ $utils =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installing system utilities...${NC}"
    apt-get install -y gparted synaptic htop neofetch
fi

# Thai-specific applications
read -p "Install Thai Applications? (Thai fonts, keyboard layouts) [y/N]: " thai
if [[ $thai =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installing Thai applications...${NC}"
    apt-get install -y \
        fonts-thaifonts-scalable \
        xfonts-thai \
        fonts-tlwg-sawasdee \
        fonts-tlwg-loma
fi

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo "You may need to restart for some changes to take effect."
