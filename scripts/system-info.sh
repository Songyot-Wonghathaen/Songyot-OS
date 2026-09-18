#!/bin/bash

# Songyot OS System Info Script
# Display system information in a beautiful format

set -e

# Colors
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

clear

# ASCII Art Logo
echo -e "${CYAN}"
cat << "EOF"
   _____ ____  _   ________  ______  ______   ____  _____
  / ___// __ \/ | / / ____/ \ \  / / __ \/_ __/  / __ \/ ___/
  \__ \/ / / /  |/ / / __    \ \/ / / / / / /    / / / /\__ \
 ___/ / /_/ / /|  / /_/ /     \  / /_/ / / /    / /_/ /___/ /
/____/\____/_/ |_/\____/       \/ \____/ /_/     \____//____/

EOF
echo -e "${NC}"

echo -e "${GREEN}════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}              Songyot OS - System Information           ${NC}"
echo -e "${GREEN}════════════════════════════════════════════════════════${NC}"
echo ""

# OS Information
if [ -f /etc/songyot/version ]; then
    VERSION=$(cat /etc/songyot/version)
else
    VERSION="Unknown"
fi

echo -e "${YELLOW}OS Information:${NC}"
echo -e "  ${CYAN}●${NC} OS Name: Songyot OS"
echo -e "  ${CYAN}●${NC} Version: $VERSION"
echo -e "  ${CYAN}●${NC} Kernel: $(uname -r)"
echo -e "  ${CYAN}●${NC} Architecture: $(uname -m)"
echo ""

# System Information
echo -e "${YELLOW}System:${NC}"
echo -e "  ${CYAN}●${NC} Hostname: $(hostname)"
echo -e "  ${CYAN}●${NC} Uptime: $(uptime -p)"
echo -e "  ${CYAN}●${NC} User: $(whoami)"
echo ""

# CPU Information
echo -e "${YELLOW}CPU:${NC}"
CPU_MODEL=$(lscpu | grep "Model name" | cut -d':' -f2 | xargs)
CPU_CORES=$(nproc)
echo -e "  ${CYAN}●${NC} Model: $CPU_MODEL"
echo -e "  ${CYAN}●${NC} Cores: $CPU_CORES"
echo ""

# Memory Information
echo -e "${YELLOW}Memory:${NC}"
MEM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
MEM_USED=$(free -h | awk '/^Mem:/ {print $3}')
MEM_AVAIL=$(free -h | awk '/^Mem:/ {print $7}')
echo -e "  ${CYAN}●${NC} Total: $MEM_TOTAL"
echo -e "  ${CYAN}●${NC} Used: $MEM_USED"
echo -e "  ${CYAN}●${NC} Available: $MEM_AVAIL"
echo ""

# Disk Information
echo -e "${YELLOW}Storage:${NC}"
df -h / | awk 'NR==2 {printf "  \033[0;36m●\033[0m Total: %s\n  \033[0;36m●\033[0m Used: %s (%s)\n  \033[0;36m●\033[0m Available: %s\n", $2, $3, $5, $4}'
echo ""

# Network Information
echo -e "${YELLOW}Network:${NC}"
IP_ADDR=$(hostname -I | awk '{print $1}')
echo -e "  ${CYAN}●${NC} IP Address: $IP_ADDR"
if command -v nmcli &> /dev/null; then
    WIFI_SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    if [ -n "$WIFI_SSID" ]; then
        echo -e "  ${CYAN}●${NC} WiFi: $WIFI_SSID"
    fi
fi
echo ""

# Desktop Environment
echo -e "${YELLOW}Desktop:${NC}"
if [ ! -z "$XDG_CURRENT_DESKTOP" ]; then
    echo -e "  ${CYAN}●${NC} Environment: $XDG_CURRENT_DESKTOP"
fi
if [ ! -z "$XDG_SESSION_TYPE" ]; then
    echo -e "  ${CYAN}●${NC} Session: $XDG_SESSION_TYPE"
fi
echo ""

echo -e "${GREEN}════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}     สร้างด้วยความรักสำหรับชุมชนคนไทย 🇹🇭${NC}"
echo -e "${GREEN}     Built with love for Thai community${NC}"
echo -e "${GREEN}════════════════════════════════════════════════════════${NC}"
