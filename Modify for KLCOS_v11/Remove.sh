#!/bin/bash

# 删除路径列表
paths=(
    # system/app
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/app/SimAppDialog/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/app/Stk/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/app/Traceur/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/app/NoCutoutOverlay.apk"

    # phh
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/phh/"
	"/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/ph/"

    # system/priv-app
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/LiveWallpapersPicker/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/MtkInCallService/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/Tag/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/TrebleApp/"

    # 32bit files
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/lib/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/framework/arm"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/framework/oat/arm"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/framework/oat/arm"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/system_ext/framework/oat/arm"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/app/PrintSpooler/lib"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/priv-app/BuiltInPrintService/lib"

    # product/app
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/arcore/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/CalculatorGooglePrebuilt/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/CalendarGooglePrebuilt/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/Camera2/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/Chrome/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/Chrome-Stub/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/GoogleContacts/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/GoogleTTS/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/LatinIMEGooglePrebuilt/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/Maps/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/Music/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/Photos/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/PhotoTable/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/PrebuiltDeskClockGoogle/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/PrebuiltGmail/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/talkback/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/TrichromeLibrary/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/app/TrichromeLibrary-Stub/"

    # product/priv-app
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/priv-app/GoogleDialer/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/priv-app/PrebuiltBugle/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/priv-app/WellbeingPrebuilt/"
	"/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/priv-app/AndroidAutoStubPrebuilt/"

    # product/fonts
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/fonts/"

    # product/media/audio
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/media/audio/alarms/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/media/audio/notifications/"
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/product/media/audio/ringtones/"

    # overlay
    "/root/DNA/DNA/Errors_KLCOS/KLCOS-A15/system/system_ext/overlay/"
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
