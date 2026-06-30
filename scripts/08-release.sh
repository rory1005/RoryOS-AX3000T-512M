#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     08-release.sh
#
# 文件作用：
#     固件发布信息模块。
#
# 当前功能：
#     ① 检查 RoryOS Banner 是否存在
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

echo "【发布】开始检查发布信息..."

if [ -f "$OPENWRT_DIR/files/etc/banner" ]; then
  echo "【发布】RoryOS Banner 已找到：$OPENWRT_DIR/files/etc/banner"
else
  echo "错误：未找到 RoryOS Banner"
  exit 1
fi

echo "【发布】完成。"
