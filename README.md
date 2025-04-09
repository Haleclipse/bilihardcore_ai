# BiliHardcore AI

BiliHardcore AI 是一个基于 Flutter 开发的~~移动~~应用，用于自动完成哔哩哔哩（B站）硬核会员的答题任务。
该项目是 [bili-hardcore](https://github.com/Karben233/bili-hardcore) 的 Flutter 复刻版本，保留了原项目的核心功能，并提供了更加美观和用户友好的界面。

## 功能特点

- **B站账号登录**：通过扫描二维码登录B站账号
- **自动答题**：使用人工智能模型辅助完成硬核会员答题
- **分类选择**：支持选择感兴趣的题目分类
- **验证码识别**：支持输入验证码进行人机验证
- **答题结果展示**：美观直观地展示答题结果和分数详情
- **配置管理**：支持配置不同的AI模型和参数

## 界面预览

应用包含以下主要界面：

- 主页：提供登录、配置和开始答题的入口
- 登录页：扫描二维码登录B站账号
- 分类选择页：选择感兴趣的题目分类
- 验证码页：输入验证码进行人机验证
- 答题页：显示题目和选项，并提供AI推荐答案
- 结果页：展示答题结果和分数详情

## 安装和使用

### 前提条件

- Flutter SDK 3.0.0 或更高版本
- Dart SDK 3.0.0 或更高版本
- Android Studio 或 VS Code

### 安装步骤

1. 克隆仓库
```bash
git clone https://github.com/yourusername/bilihardcore_ai.git
cd bilihardcore_ai
```

2. 安装依赖
```bash
flutter pub get
```

3. 运行应用
```bash
flutter run
```

## 使用说明

1. 启动应用后，点击"登录B站账号"按钮
2. 使用B站APP扫描显示的二维码进行登录
3. 登录成功后，点击"开始答题"按钮
4. 根据提示选择感兴趣的分类（如有）
5. 输入验证码（如需要）
6. 开始答题，系统会自动提供AI推荐答案
7. 答题完成后，查看结果和分数详情

## 致谢

本项目是 [bili-hardcore](https://github.com/Karben233/bili-hardcore) 的 Flutter 复刻版本。感谢原项目作者 [Karben233](https://github.com/Karben233) 提供的优秀代码和思路。

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 免责声明

本项目仅供学习和研究使用，请勿用于商业用途。使用本项目造成的任何问题，开发者不承担任何责任。
