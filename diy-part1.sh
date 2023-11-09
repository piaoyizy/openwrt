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

 sudo apt-get install pigz

# git clone  https://github.com/QiuSimons/openwrt-mos.git package/luci-app-mosdns

# sed -i "s/127.0.0.1/127.0.0.1:5335/g"   package/luci-app-mosdns/root/etc/mosdns/set.sh

# 添加SSR-Plus
rm -rf package/luci-app-ssr-plus
# git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
git clone -b main https://github.com/fw876/helloworld.git package/luci-app-ssr-plus




# 添加PassWall
rm -rf package/passwall
rm -rf package/luci-app-passwall
git clone  https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
cd package/luci-app-passwall
mv luci-app-passwall/* .
cd ../..

 

# git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
git clone  https://github.com/xiaorouji/openwrt-passwall-packages.git  package/passwall
mv -f package/passwall package/luci-app-passwall



# git clone https://github.com/QiuSimons/openwrt-mos package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata



#adguardhome
# git clone https://github.com/limi00/luci-app-adguardhome.git package/luci-app-adguardhome


# git clone https://github.com/pymumu/openwrt-smartdns package/lean/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/lean/luci-app-smartdns


# git clone -b master https://github.com/vernesong/OpenClash.git package-temp
# rm -rf package/lean/luci-app-openclash
# mv -f package-temp/luci-app-openclash package/lean/
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash


cd ..
mv -f msd_lite/ openwrt/package/msd_lite
rm -rf package-temp
