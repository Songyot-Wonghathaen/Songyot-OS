#!/bin/bash

# Songyot OS Desktop Customization Script
# Run this script in the chroot environment to customize the desktop

set -e

echo "Customizing Songyot OS desktop environment..."

# Create default XFCE configuration directory
mkdir -p /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml

# Configure XFCE panel
cat > /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfce4-panel" version="1.0">
  <property name="panels" type="array">
    <value type="int" value="1"/>
    <property name="panel-1" type="empty">
      <property name="position" type="string" value="p=6;x=0;y=0"/>
      <property name="size" type="uint" value="38"/>
      <property name="background-style" type="uint" value="1"/>
      <property name="background-rgba" type="array">
        <value type="double" value="0.11"/>
        <value type="double" value="0.14"/>
        <value type="double" value="0.16"/>
        <value type="double" value="0.95"/>
      </property>
    </property>
  </property>
</channel>
EOF

# Configure XFCE desktop
cat > /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfce4-desktop" version="1.0">
  <property name="backdrop" type="empty">
    <property name="screen0" type="empty">
      <property name="monitor0" type="empty">
        <property name="workspace0" type="empty">
          <property name="color-style" type="int" value="0"/>
          <property name="image-style" type="int" value="5"/>
          <property name="last-image" type="string" value="/usr/share/backgrounds/songyot-default.jpg"/>
        </property>
      </property>
    </property>
  </property>
</channel>
EOF

# Configure LightDM greeter
cat > /etc/lightdm/lightdm-gtk-greeter.conf << 'EOF'
[greeter]
background=/usr/share/backgrounds/songyot-login.jpg
theme-name=Songyot-Dark
icon-theme-name=Papirus-Dark
font-name=Sarabun 11
xft-antialias=true
xft-hintstyle=hintfull
EOF

# Create default user profile
cat > /etc/skel/.profile << 'EOF'
# Songyot OS User Profile

# Set locale
export LANG=th_TH.UTF-8
export LC_ALL=th_TH.UTF-8

# Add user bin to PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Welcome message
if [ -f /etc/songyot/motd ]; then
    cat /etc/songyot/motd
fi
EOF

# Create welcome message
mkdir -p /etc/songyot
cat > /etc/songyot/motd << 'EOF'
สวัสดี! ยินดีต้อนรับสู่ Songyot OS
Welcome to Songyot OS - Built for Thai Users
EOF

echo "Desktop customization complete!"
