#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#



# git clone  https://github.com/QiuSimons/openwrt-mos.git package/luci-app-mosdns

# sed -i "s/127.0.0.1/127.0.0.1:5335/g"   package/luci-app-mosdns/root/etc/mosdns/set.sh

# 添加SSR-Plus
git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus

# 添加PassWall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall

# 添加bypass
rm -rf  package/luci-app-bypass
git clone https://github.com/garypang13/luci-app-bypass.git package/luci-app-bypass

#adguardhome
git clone https://github.com/limi00/luci-app-adguardhome.git package/luci-app-adguardhome


git clone https://github.com/pymumu/openwrt-smartdns package/lean/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/lean/luci-app-smartdns



# Add luci-app-openclash
git clone -b master https://github.com/vernesong/OpenClash.git package-temp
rm -rf package/lean/luci-app-openclash
mv -f package-temp/luci-app-openclash package/lean/
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_LIBCURL_COOKIES=y
CONFIG_LIBCURL_FILE=y
CONFIG_LIBCURL_FTP=y
CONFIG_LIBCURL_HTTP=y
CONFIG_LIBCURL_NO_SMB="!"
CONFIG_LIBCURL_OPENSSL=y
CONFIG_LIBCURL_PROXY=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_coreutils-nohup=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_libcurl=y
CONFIG_PACKAGE_libncurses=y
CONFIG_PACKAGE_libreadline=y
CONFIG_PACKAGE_terminfo=y
EOF
rm -rf package-temp
