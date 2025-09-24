#!/bin/bash

# 删除路径列表
paths=(
    # system/app
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/app/Traceur/"

    # phh
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/phh/"
	"/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/ph/"

    # system/priv-app
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/MtkInCallService/"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/TrebleApp/"

    # 32bit files
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/lib/"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/framework/arm"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/framework/oat/arm"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/framework/oat/arm"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/system_ext/framework/oat/arm"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/app/PrintSpooler/lib"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/BuiltInPrintService/lib"

    # product/app
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/CalculatorGooglePrebuilt/"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/GoogleContacts/"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/talkback/"

    # product/priv-app
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/priv-app/GoogleDialer/"
	"/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/priv-app/PrebuiltBugle/"

    # product/media/audio
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/media/audio/alarms/"
    "/root/KLCOS/DNA/Errors_KLCOS/KLCOS-A15/system/product/media/audio/notifications/"
)

# 执行删除
for path in "${paths[@]}"; do
    if [ -e "$path" ]; then
        echo "删除: $path"
        rm -rf "$path"
    else
        echo "路径不存在: $path"
    fi
done

echo "所有指定路径处理完毕。"
