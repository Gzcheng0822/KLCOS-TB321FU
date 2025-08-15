```
mount -o loop /root/DNA/DNA/Errors_KLCOS/002_DNA/KLCOS-A15.img klcos_system/
mount -t erofs -o loop
1767899136 3623878656 1872756736
```

```
umount klcos_system && \
rm -rf /root/DNA/DNA/Errors_KLCOS/KLCOS-A15/*
```

```
mount -o loop /root/DNA/DNA/Errors_KLCOS/002_DNA/KLCOS-A15.img klcos_system/ && \
sudo mkfs.erofs -zlz4 KLCOS_A15_erfos_raw_unsigned.img klcos_system/ && \
cp KLCOS_A15_erfos_raw_unsigned.img KLCOS_A15_erfos_raw_signed.img && \
python3 ~/avb/avbtool.py add_hashtree_footer \
  --image KLCOS_A15_erfos_raw_signed.img\
  --partition_name system \
  --partition_size 1872756736 \
  --key system_key.pem \
  --algorithm SHA256_RSA4096 \
  --hash_algorithm sha256 \
  --do_not_generate_fec && \
img2simg KLCOS_A15_erfos_raw_signed.img KLCOS_A15_erfos_sparse_signed.img
```

```
img2simg /root/new/system_v8_raw_erofs.img /root/new/system_v8_sparse_erofs.img
```

```
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -outform PEM -out system_key.pem
```

```
& fastboot flash system "C:\Users\Gzcheng\Desktop\fsdownload\KLCOS_v6_erfos_signed_sparse.img"; if ($?) { fastboot reboot }
sudo mkfs.erofs -zlz4 Pixel_9Pro_A16_erofs_unsigned_raw.img pixel/
cp KLCOS_v6_erfos_unsigned.img KLCOS_v6_erfos_signed_raw.img
python3 ~/avb/avbtool.py add_hashtree_footer \
  --image Pixelexperience-vayu-14-1704617545-AB-20240128-MysticGSI.img \
  --partition_name system \
  --partition_size 1925185536 \
  --key system_key.pem \
  --algorithm SHA256_RSA4096 \
  --hash_algorithm sha256 \
  --do_not_generate_fec
img2simg Pixel_9Pro_A16_signed_raw.img Pixel_9Pro_A16_signed_sparse.img
```

ADB默认关闭

语言默认简体中文

v5

尝试修改plat_property_contexts修复权限漏洞(没成功)

v6

尝试修改了状态栏间距(没啥用)

版本号添加v6

v7

删除无用的overlay,删除了build.pro的32位支持

删除了`/system/lib/` `/system/framework/arm` `/system/framework/oat/ram`  `/system/system_ext/framework/oat/arm` `/system/product/framework/oat/arm`

v7.1

删除了`/system/product/lib`

v7.2

删除了app 下 lib



Rom 特性
使用erofs打包, 理论上可以更加流畅

删除了ph和phh文件夹

删除了所有arm/lib文件夹(因为8Gen3只支持64bit)

build.prop 替换为TB321FU, 版本号等移除GSI/debug系统的特征,避免被检测为工程系统, 关闭默认打开ADB(调试系统特征)

系统默认字体替换为锤子T黑, Emoji替换为Oneui的版本, 开机动画改为Pixel(安卓10-12样式)

默认8GB Zram, 开机自动使用fstrim进行碎片整理

精简预装应用/主题/overlay, 甚至包括输入法, 请自备输入法安装包, 只保留文件, Play Store 和 Google, 系统最终大小为1.66GB

在DPI≤500时, 隐藏导航栏

内置MiCTS改包名版本(避免被检测), 可以触发圈定即搜

可以正常工作的硬件:

绝大部分硬件, 包括: CPU, GPU, 蓝牙, WIFI, 高刷(默认30-165HZ自适应), 相机(第二个摄像头需要谷歌相机才能调用), 自动旋转, X轴震动马达, USB-C接口(两个接口都可以正常的以最高速率工作)

不能工作的硬件:

自动亮度/双击亮屏, 需要通过原厂系统的overlay修复, 但是我不会

Bugs(GSI本身就存在的):

尝试修改plat_property_contexts修复权限漏洞(没成功), 大概是GSI需要调用其他分区的build.prop来识别机型, 不知道怎么修复

状态栏后方图标仍然间距太大, 人脸识别时会有一个小圆角, 尝试通过overlay修复, 失败

自动亮度不工作, 大多数GSI都存在的问题, 通过查询得知可以通过提取原厂overlay来修复, 不会, 所以没有修

v8

修改ZRAM为16GB,优化ZRAM逻辑和碎片整理逻辑

修改ADB为安全模式.
