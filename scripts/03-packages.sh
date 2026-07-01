#!/bin/bash

###############################################################################
# 项目名称：RoryOS
#
# 文件名称：
#     03-packages.sh
#
# 文件作用：
#     软件包管理模块。
#
# 当前功能：
#     ① 生成 RoryOS 基础软件包配置
#     ② 加入 LuCI 管理界面
#     ③ 加入 Argon 主题
#     ④ 加入常用基础工具
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

echo "【软件包】开始生成 RoryOS 软件包配置..."

cat >> "$OPENWRT_DIR/.config" <<'EOF'

# RoryOS 基础软件包
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-ssl=y
ONFIG_PACKAGE_luci-base=y
CONFIG_PACKAGE_luci-mod-admin-full=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_rpcd-mod-luci=y
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y
CONFIG_PACKAGE_luci-i18n-ttyd-zh-cn=y
CONFIG_PACKAGE_luci-i18n-sqm-zh-cn=y
CONFIG_PACKAGE_luci-i18n-upnp-zh-cn=y
CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-ddns=y

# RoryOS 常用工具

# RoryOS AX3000T Wi-Fi 支持
CONFIG_PACKAGE_kmod-mt7915e=y
CONFIG_PACKAGE_kmod-mt7981-firmware=y
CONFIG_PACKAGE_mt7981-wo-firmware=y
CONFIG_PACKAGE_wireless-tools=y
CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_hostapd-common=y
CONFIG_PACKAGE_wpad-basic-mbedtls=y
CONFIG_PACKAGE_luci-app-wifi-schedule=y
CONFIG_PACKAGE_luci-i18n-wifi-schedule-zh-cn=y

CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_wget-ssl=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_ca-certificates=y

EOF

echo "【软件包】软件包配置完成。"
