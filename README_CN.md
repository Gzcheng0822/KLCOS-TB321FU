## TB321FU GSI 修改版特性说明

> ⚙️ *本项目基于 [KLC_OS](https://github.com/LoggingNewMemory/KLC_OS) 修改制作*

### 系统特性：

- 使用 **EROFS 文件系统** 打包，理论上系统运行更加流畅
- 删除 `ph` 和 `phh` 文件夹
- 删除所有 `arm/lib` 文件夹（因为骁龙 8 Gen 3 只支持 64 位）
- 替换 `build.prop` 为 TB321FU，移除版本号和调试/工程系统标志，关闭默认 ADB，避免被检测为工程系统
- 系统默认字体替换为 **锤子 T 黑体**，Emoji 替换为 **One UI 版本**，开机动画使用 **Pixel（Android 10–12）风格**
- 默认启用 **8GB ZRAM**，开机自动执行 **fstrim** 进行碎片整理
- 极致精简预装（包括输入法、主题、overlay 等），仅保留文件管理器、Play 商店和 Google 框架，最终系统大小约为 **1.66GB**
- 当 DPI ≤ 500 时自动隐藏导航栏
- 内置修改包名的 **[MiCTS](https://github.com/parallelcc/MiCTS)**（避免被检测），支持圈定即搜功能

### 可正常工作的硬件：

- **CPU / GPU**
- **蓝牙 / Wi-Fi**
- **高刷新率**（30–165Hz 自适应）
- **相机**（第二颗镜头需使用 Google Camera 才能调用）
- **自动旋转**
- **X 轴线性马达**
- **USB-C 接口**（两个接口均可正常以最高速率工作）

### 不可正常工作的功能：

- **自动亮度 / 双击亮屏**（需要原厂 overlay 修复，尚未处理）

### 已知 Bug / 限制（GSI 通病）：

- 修改 `plat_property_contexts` 尝试修复权限漏洞未成功，推测 GSI 需要读取其他分区 `build.prop` 来识别机型，目前无解
- 状态栏图标间距仍然过大
- 人脸识别弹出圆角提示无法去除（尝试用 overlay 修复失败）
- 自动亮度无效，已知大多数 GSI 有此问题，需提取原厂 overlay 修复，当前未完成