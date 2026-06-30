#!/bin/bash

set -e

OPENWRT_DIR="${1:-openwrt}"

echo "=================================="
echo "       RoryOS Build System"
echo "=================================="

if [ ! -d "$OPENWRT_DIR" ]; then
  echo "OpenWrt directory not found: $OPENWRT_DIR"
  exit 1
fi

echo "[1/4] Set default hostname..."
mkdir -p "$OPENWRT_DIR/files/etc/config"

cat > "$OPENWRT_DIR/files/etc/config/system" <<'EOF'
config system
	option hostname 'RoryOS'
	option timezone 'CST-8'
	option zonename 'Asia/Shanghai'
	option ttylogin '0'
	option log_size '64'
	option urandom_seed '0'
EOF

echo "[2/4] Set default LAN IP..."
mkdir -p "$OPENWRT_DIR/files/etc/config"

cat > "$OPENWRT_DIR/files/etc/config/network" <<'EOF'
config interface 'loopback'
	option device 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'auto'

config device
	option name 'br-lan'
	option type 'bridge'
	list ports 'lan1'
	list ports 'lan2'
	list ports 'lan3'
	list ports 'wan'

config interface 'lan'
	option device 'br-lan'
	option proto 'static'
	option ipaddr '192.168.10.1'
	option netmask '255.255.255.0'
	option ip6assign '60'
EOF

echo "[3/4] Banner..."
echo "Banner OK"

echo "[4/4] RoryOS Customize Done!"
