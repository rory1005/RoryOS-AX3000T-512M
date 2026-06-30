#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     scripts/devices/ax3000t.sh
#
# 文件作用：
#     Xiaomi AX3000T 专属配置。
#
# 当前功能：
#     ① 自动查找 AX3000T DTS
#     ② 修改 512MB NAND UBI 分区
###############################################################################

set -e

OPENWRT_DIR="${1:-openwrt}"

echo "【设备：AX3000T】开始..."

DTS_FILE="$(find "$OPENWRT_DIR/target/linux/mediatek/dts" -type f -name '*ax3000t*.dts' | head -n 1)"

if [ -z "$DTS_FILE" ]; then
  echo "错误：未找到 AX3000T DTS 文件"
  exit 1
fi

echo "【设备：AX3000T】DTS 文件：$DTS_FILE"

cp "$DTS_FILE" "$DTS_FILE.bak"

echo "【设备：AX3000T】修改 UBI 分区为 512MB NAND 布局..."

sed -i "s/reg = <0x600000 0x7000000>;/reg = <0x600000 0x1f9c0000>;/g" "$DTS_FILE"

echo "【设备：AX3000T】检查修改结果："
grep -n "ubi\|0x1f9c0000\|0x7000000" "$DTS_FILE" || true

echo "【设备：AX3000T】完成。"
