#!/bin/bash

# cp -R ../default-settings package/default-settings

git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

rm -rf package/openwrt-passwall/xray-core

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash

# 编译 po2lmo (如果有po2lmo可跳过)
cd package/luci-app-openclash/tools/po2lmo
make && sudo make install