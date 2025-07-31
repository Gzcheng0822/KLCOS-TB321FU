## TB321FU GSI 修改版特性说明

[中文](https://github.com/Zhicheng-Gao/KLCOS-TB321FU/blob/main/README_CN.md)
[English](https://github.com/Zhicheng-Gao/KLCOS-TB321FU/blob/main/README.md)

> ⚙️ *基于 [KLC\_OS](https://github.com/LoggingNewMemory/KLC_OS) 修改制作*

### 系统特性：

* 已签名；可直接启动，无需关闭 vbmeta 验证
* 使用 **EROFS 文件系统** 打包，理论上带来更流畅的性能
* 删除了 `ph` 和 `phh` 文件夹
* 删除所有 `arm/lib` 文件夹（因骁龙 8 Gen 3 仅支持 64 位）
* 移除了大多数 GSI 特性；将 `build.prop` 替换为 TB321FU 版本，移除版本号及调试标志，避免被识别为工程系统；**默认关闭 ADB**
* 默认字体替换为 **锤子 T 黑体**，Emoji 替换为 **One UI 风格**，开机动画采用 **Pixel 风格（Android 10–12）**
* 默认启用 **8GB ZRAM**；开机自动运行 **fstrim** 进行文件系统整理
* 极致精简系统 — 移除几乎所有预装应用、overlay、主题，甚至输入法。仅保留文件管理器、Play 商店和 Google 框架。系统最终大小约为 **1.66GB**
* 当 DPI ≤ 500 时自动隐藏导航栏
* 内置改包名的 **[MiCTS](https://github.com/parallelcc/MiCTS)**（避免被检测），支持圈定即搜功能

### 可正常工作的硬件：

* **CPU / GPU**
* **蓝牙 / Wi-Fi**
* **高刷新率**（30–165Hz 自适应）
* **相机**（第二颗摄像头需使用 Google Camera 才能调用）
* **自动旋转**
* **X 轴线性马达**
* **USB-C 接口**（两个接口均可全速正常工作）

### 不可正常工作的功能：

* **自动亮度 / 双击亮屏**（需要原厂 overlay 修复，目前未实现）

### 已知 Bug / 限制（GSI 通用问题）：

* 尝试修改 `plat_property_contexts` 来修复权限漏洞 —— 失败；GSI 可能需要从其他分区读取 `build.prop` 来识别机型
* 状态栏图标之间间距仍然过大
* 人脸识别时会显示一个小圆角提示 —— 尝试用 overlay 修复失败
* 自动亮度无法工作 —— 属于 GSI 常见问题；需提取原厂 overlay 修复，目前尚未完成
