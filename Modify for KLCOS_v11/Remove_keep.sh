#!/bin/bash

set -e

BASE="/root/DNA/DNA/Errors_KLCOS/KLCOS-A15"

# 1. 删除 overlay 目录下除了白名单和含 telephony 的文件以外的文件
overlay_dir="$BASE/system/product/overlay"
keep_list=(
  "CompanionDeviceManager__device__auto_generated_characteristics_rro.apk"
  "framework-res__device__auto_generated_characteristics_rro.apk"
  "framework-res__treble_arm64_bgN__auto_generated_rro_product.apk"
  "GmsConfigOverlay"
  "GmsSettingsOverlay"
  "GmsSettingsProviderOverlay"
  "GmsSetupWizardOverlay"
  "GsiDocumentsUIOverlay.apk"
  "GsiFrameworksOverlay.apk"
  "GsiLauncher3Overlay.apk"
  "GsiSettingsProviderOverlay"
  "GsiSystemUIOverlay.apk"
  "GsiWifiOverlay"
  "NavigationBarMode2Button"
  "NavigationBarMode3Button"
  "NavigationBarModeGestural"
  "ParanoidSenseOverlay.apk"
  "SystemUI__treble_arm64_bgN__auto_generated_rro_product.apk"
  "treble-overlay-misc-minimal-brightness.apk"
  "treble-overlay-NavBar.apk"
  "treble-overlay-NightMode.apk"
  "treble-overlay-tethering.apk"
  "treble-overlay-tethering-nobpf.apk"
  "treble-overlay-wifi5g.apk"
  "treble-overlay-wifi.apk"
)

echo "Cleaning $overlay_dir..."
for file in "$overlay_dir"/*; do
  filename=$(basename "$file")
  
  if [[ ! " ${keep_list[*]} " =~ " $filename " && "$filename" != *telephony* ]]; then
    echo "Deleting $file"
    rm -rf "$file"
  fi
done


# 2. 删除 audio/ui 除了指定文件
ui_dir="$BASE/system/product/media/audio/ui"
ui_keep_files=(
  "ChargingStarted.ogg"
  "Dock.ogg"
  "Lock.ogg"
  "LowBattery.ogg"
  "Trusted.ogg"
  "Undock.ogg"
  "Unlock.ogg"
)

echo "Cleaning $ui_dir..."
for file in "$ui_dir"/*; do
  filename=$(basename "$file")
  if [[ ! " ${ui_keep_files[*]} " =~ " $filename " ]]; then
    echo "Deleting $file"
    rm -f "$file"
  fi
done

# 3. 删除 system_ext/app 中除 AccessibilityMenu 和 WAPPushManager 外的目录
app_dir="$BASE/system/system_ext/app"

echo "Cleaning $app_dir..."
for dir in "$app_dir"/*; do
  dirname=$(basename "$dir")
  if [[ "$dirname" != "AccessibilityMenu" && "$dirname" != "WAPPushManager" ]]; then
    echo "Deleting $dir"
    rm -rf "$dir"
  fi
done

echo "Cleanup completed."

