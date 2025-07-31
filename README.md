## TB321FU GSI Custom Build Features

[中文](https://github.com/Zhicheng-Gao/KLCOS-TB321FU/blob/main/README_CN.md)
[English](https://github.com/Zhicheng-Gao/KLCOS-TB321FU/blob/main/README.md)

> ⚙️ *Based on [KLC\_OS](https://github.com/LoggingNewMemory/KLC_OS) with modifications*

### System Features:

* Packed using **EROFS** file system for potentially smoother performance
* Removed `ph` and `phh` folders
* Removed all `arm/lib` directories (Snapdragon 8 Gen 3 supports 64-bit only)
* Remove most GSI features; Replaced `build.prop` with TB321FU version, removed version tags and debug flags to avoid detection as a test build; **ADB disabled by default**
* Default font changed to **Smartisan T Hei**, Emoji replaced with **One UI** style, boot animation switched to **Pixel-style (Android 10–12)**
* Enabled **8GB ZRAM** by default; **fstrim** runs on boot for filesystem trimming
* Extremely debloated — most pre-installed apps, overlays, themes, even keyboard removed. Only File Manager, Play Store, and Google Core are kept. Final system size: **1.66GB**
* Hides navigation bar when DPI ≤ 500
* Includes renamed **[MiCTS](https://github.com/parallelcc/MiCTS)** (to avoid detection), supports “Tap to Search”

### Working Hardware:

* **CPU / GPU**
* **Bluetooth / Wi-Fi**
* **High refresh rate** (30–165Hz adaptive)
* **Camera** (Second lens requires Google Camera to function)
* **Auto-rotation**
* **X-axis linear vibration motor**
* **USB-C ports** (both work at full speed)

### Non-functional Features:

* **Auto-brightness / Double-tap to wake** (Require stock overlay to fix; currently not implemented)

### Known Bugs / Limitations (GSI-related):

* Tried modifying `plat_property_contexts` to fix permission vulnerabilities — failed; GSI may require reading `build.prop` from other partitions
* Status bar icons still too widely spaced
* Face unlock shows a rounded-corner prompt — overlay fix failed
* Auto-brightness not working — common GSI issue; fix requires extracting overlay from stock ROM, not yet done
