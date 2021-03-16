#!/bin/bash

cp -R ../default-settings package/default-settings

# git clone https://github.com/kuoruan/openwrt-upx.git package/openwrt-upx
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray

rm -rf package/openwrt-passwall/xray-core

mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true 
echo  " luci-app-openclash "  >> .git/info/sparse-checkout
git pull origin master
git branch --set-upstream-to=origin/master master

# Compiler po2lmo (if po2lmo skippable) 
the pushd luci-App-openclash /tools/po2lmo
make && sudo make install
popd

cd ../..
make package/luci-app-openclash/luci-app-openclash/compile V=99