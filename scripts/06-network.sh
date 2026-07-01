#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     06-network.sh
#
# 文件作用：
#     网络配置模块。
#
# 当前功能：
#     ① 设置默认 LAN IP 为 192.168.10.1
#     ② 保留 OpenWrt 默认网络结构，使用 uci-defaults 首次开机自动修改
#
# 作者：
#     Rory
#
# 技术支持：
#     福贵（ChatGPT）
#
# 创建日期：
#     2026-07-01
#
# 最后修改：
#     2026-07-01
###############################################################################

set -e

OPENWRT_DIR="${1:-openwrt}"

echo "【网络】开始配置默认网络..."

mkdir -p "$OPENWRT_DIR/files/etc/uci-defaults"

cat > "$OPENWRT_DIR/files/etc/uci-defaults/98-roryos-network" <<'EOF'
#!/bin/sh

# RoryOS 默认网络配置
# 首次开机自动执行

uci set network.lan.ipaddr='192.168.10.1'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.ip6assign='60'

uci commit network

exit 0
EOF

chmod +x "$OPENWRT_DIR/files/etc/uci-defaults/98-roryos-network"

echo "【网络】默认网络配置完成。"
