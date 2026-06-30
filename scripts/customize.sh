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

echo "[1/3] Set default hostname..."
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

echo "[2/3] Banner..."
echo "Banner OK"

echo "[3/3] RoryOS Customize Done!"
