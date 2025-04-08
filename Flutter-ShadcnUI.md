# Flutter ShadcnUI 新手指南

![ShadcnUI Banner](https://flutter-shadcn-ui.mariuti.com/shadcn-banner.png)

## 目录

- [Flutter ShadcnUI 新手指南](#flutter-shadcnui-新手指南)
  - [目录](#目录)
  - [简介](#简介)
  - [安装](#安装)
    - [添加依赖](#添加依赖)
    - [导入包](#导入包)
  - [基础配置](#基础配置)
    - [纯 ShadcnUI 应用](#纯-shadcnui-应用)
    - [ShadcnUI + Material](#shadcnui--material)
    - [ShadcnUI + Cupertino](#shadcnui--cupertino)
    - [自定义应用集成](#自定义应用集成)
  - [主题配置](#主题配置)
    - [亮色/暗色主题](#亮色暗色主题)
    - [颜色方案](#颜色方案)
    - [自定义主题](#自定义主题)
    - [字体设置](#字体设置)
      - [使用 Google Fonts](#使用-google-fonts)
      - [使用自定义字体](#使用自定义字体)
  - [组件列表](#组件列表)
    - [Accordion 手风琴](#accordion-手风琴)
      - [基本用法](#基本用法)
      - [ShadAccordion 属性](#shadaccordion-属性)
      - [ShadAccordionItem 属性](#shadaccordionitem-属性)
    - [Alert 警告提示](#alert-警告提示)
      - [基本用法](#基本用法-1)
      - [ShadAlert 属性](#shadalert-属性)
    - [Avatar 头像](#avatar-头像)
      - [基本用法](#基本用法-2)
      - [ShadAvatar 属性](#shadavatar-属性)
    - [Badge 徽章](#badge-徽章)
      - [基本用法](#基本用法-3)
      - [ShadBadge 属性](#shadbadge-属性)
    - [Button 按钮](#button-按钮)
      - [基本用法](#基本用法-4)
      - [ShadButton 属性](#shadbutton-属性)
    - [Calendar 日历](#calendar-日历)
      - [基本用法](#基本用法-5)
      - [自定义选项](#自定义选项)
      - [ShadCalendar 属性](#shadcalendar-属性)
    - [Card 卡片](#card-卡片)
      - [基本用法](#基本用法-6)
      - [ShadCard 属性](#shadcard-属性)
      - [ShadCheckboxFormField 属性](#shadcheckboxformfield-属性)
    - [Checkbox 复选框](#checkbox-复选框)
      - [基本用法](#基本用法-7)
      - [ShadCheckbox 属性](#shadcheckbox-属性)
    - [ContextMenu 上下文菜单](#contextmenu-上下文菜单)
      - [基本用法](#基本用法-8)
      - [ShadContextMenuRegion 属性](#shadcontextmenuregion-属性)
      - [ShadContextMenuItem 属性](#shadcontextmenuitem-属性)
      - [ShadContextMenuController 方法](#shadcontextmenucontroller-方法)
      - [ShadDatePickerFormField 属性](#shaddatepickerformfield-属性)
    - [DatePicker 日期选择器](#datepicker-日期选择器)
      - [基本用法](#基本用法-9)
      - [在表单中使用日期选择器](#在表单中使用日期选择器)
      - [ShadDatePicker 属性](#shaddatepicker-属性)
    - [Dialog 对话框](#dialog-对话框)
      - [基本用法](#基本用法-10)
      - [showShadDialog 函数参数](#showshaddialog-函数参数)
      - [ShadDialog 属性](#shaddialog-属性)
    - [IconButton 图标按钮](#iconbutton-图标按钮)
      - [基本用法](#基本用法-11)
      - [加载状态和渐变效果](#加载状态和渐变效果)
      - [ShadIconButton 属性](#shadiconbutton-属性)
      - [ShadInputFormField 属性](#shadinputformfield-属性)
      - [ShadInputOTPFormField 属性](#shadinputotpformfield-属性)
    - [InputOTP 一次性密码输入框](#inputotp-一次性密码输入框)
      - [基本用法](#基本用法-12)
      - [ShadInputOTP 属性](#shadinputotp-属性)
      - [ShadInputOTPGroup 属性](#shadinputotpgroup-属性)
      - [ShadInputOTPSlot 属性](#shadinputotpslot-属性)
    - [Input 输入框](#input-输入框)
      - [基本用法](#基本用法-13)
      - [ShadInput 属性](#shadinput-属性)
    - [Menubar 菜单栏](#menubar-菜单栏)
      - [基本用法](#基本用法-14)
      - [ShadMenubar 属性](#shadmenubar-属性)
      - [ShadMenubarItem 属性](#shadmenubaritem-属性)
      - [ShadContextMenuItem 属性](#shadcontextmenuitem-属性-1)
    - [Popover 弹出框](#popover-弹出框)
      - [基本用法](#基本用法-15)
      - [ShadPopoverController 方法](#shadpopovercontroller-方法)
      - [ShadPopover 属性](#shadpopover-属性)
    - [Portal 门户](#portal-门户)
      - [基本用法](#基本用法-16)
      - [使用不同的锚点](#使用不同的锚点)
      - [ShadPortal 属性](#shadportal-属性)
      - [ShadAnchorBase 类型](#shadanchorbase-类型)
    - [Progress 进度条](#progress-进度条)
      - [基本用法](#基本用法-17)
      - [可调节的进度条](#可调节的进度条)
      - [ShadProgress 属性](#shadprogress-属性)
      - [ShadRadioGroupFormField 属性](#shadradiogroupformfield-属性)
    - [RadioGroup 单选按钮组](#radiogroup-单选按钮组)
      - [基本用法](#基本用法-18)
      - [使用枚举的单选按钮组](#使用枚举的单选按钮组)
      - [在表单中使用单选按钮组](#在表单中使用单选按钮组)
      - [ShadRadioGroup 属性](#shadradiogroup-属性)
      - [ShadRadio 属性](#shadradio-属性)
    - [Resizable 可调整面板](#resizable-可调整面板)
      - [基本用法](#基本用法-19)
      - [垂直布局](#垂直布局)
      - [嵌套布局](#嵌套布局)
      - [ShadResizablePanelGroup 属性](#shadresizablepanelgroup-属性)
      - [ShadResizablePanel 属性](#shadresizablepanel-属性)
      - [ShadResizableController 方法](#shadresizablecontroller-方法)
    - [Select 选择器](#select-选择器)
      - [基本用法](#基本用法-20)
      - [多选选择器](#多选选择器)
      - [在表单中使用选择器](#在表单中使用选择器)
      - [ShadSelect 属性](#shadselect-属性)
      - [ShadOption 属性](#shadoption-属性)
      - [ShadSelectFormField 属性](#shadselectformfield-属性)
      - [ShadSelectMultipleFormField 属性](#shadselectmultipleformfield-属性)
    - [Sheet 底部弹出层](#sheet-底部弹出层)
      - [基本用法](#基本用法-21)
      - [不同方向的弹出层](#不同方向的弹出层)
      - [showShadSheet 函数参数](#showshadsheet-函数参数)
      - [ShadSheet 属性](#shadsheet-属性)
    - [Separator 分隔线](#separator-分隔线)
      - [基本用法](#基本用法-22)
      - [应用示例](#应用示例)
      - [ShadSeparator 属性](#shadseparator-属性)
    - [Slider 滑块](#slider-滑块)
      - [基本用法](#基本用法-23)
      - [可控制的滑块](#可控制的滑块)
      - [使用控制器](#使用控制器)
      - [ShadSlider 属性](#shadslider-属性)
    - [Table 表格](#table-表格)
      - [基本用法](#基本用法-24)
      - [使用构建器创建表格（适用于大型表格）](#使用构建器创建表格适用于大型表格)
      - [ShadTable 属性](#shadtable-属性)
      - [ShadTableCell 属性](#shadtablecell-属性)
    - [Switch 开关](#switch-开关)
      - [基本用法](#基本用法-25)
      - [带副标签的开关](#带副标签的开关)
      - [在表单中使用开关](#在表单中使用开关)
      - [ShadSwitch 属性](#shadswitch-属性)
      - [ShadSwitchFormField 属性](#shadswitchformfield-属性)
    - [Tabs 选项卡](#tabs-选项卡)
      - [基本用法](#基本用法-26)
      - [使用控制器](#使用控制器-1)
      - [ShadTabs 属性](#shadtabs-属性)
      - [ShadTab 属性](#shadtab-属性)
    - [TimePicker 时间选择器](#timepicker-时间选择器)
      - [基本用法](#基本用法-27)
      - [在表单中使用时间选择器](#在表单中使用时间选择器)
      - [ShadTimePicker 属性](#shadtimepicker-属性)
      - [ShadTimePickerFormField 属性](#shadtimepickerformfield-属性)
    - [Tooltip 提示框](#tooltip-提示框)
      - [基本用法](#基本用法-28)
      - [自定义提示框](#自定义提示框)
      - [ShadTooltip 属性](#shadtooltip-属性)
      - [ShadTooltipController 方法](#shadtooltipcontroller-方法)
    - [Toast 提示框](#toast-提示框)
      - [基本用法](#基本用法-29)
      - [使用 ShadToaster](#使用-shadtoaster)
      - [ShadToaster 方法](#shadtoaster-方法)
      - [ShadToast 属性](#shadtoast-属性)
    - [Typography 排版](#typography-排版)
      - [基本用法](#基本用法-30)
      - [ShadTextTheme 属性](#shadtexttheme-属性)
  - [总结](#总结)

## 简介

Flutter ShadcnUI 是一个将流行的 [shadcn/ui](https://ui.shadcn.com/) 组件库移植到 Flutter 的项目。它提供了一套完整的、可定制的 UI 组件，支持亮色和暗色主题，并且可以与 Flutter 的 Material 和 Cupertino 组件无缝集成。

ShadcnUI 的主要特点：

- 美观现代的设计风格
- 高度可定制的组件
- 支持多种主题和颜色方案
- 丰富的组件库，包括按钮、表单、对话框等
- 与 Flutter 原生组件的良好兼容性

## 安装

### 添加依赖

在项目的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  shadcn_ui: ^0.23.4  # 替换为最新版本
```

或者使用命令行：

```bash
flutter pub add shadcn_ui
```

### 导入包

在需要使用 ShadcnUI 的文件中导入：

```dart
import 'package:shadcn_ui/shadcn_ui.dart';
```

## 基础配置

ShadcnUI 提供了多种应用配置方式，可以根据你的需求选择合适的方式。

### 纯 ShadcnUI 应用

如果你只想使用 ShadcnUI 组件，不需要 Material 或 Cupertino 组件：

```dart
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      home: MyHomePage(),
    );
  }
}
```

如果需要使用路由器而不是导航器，可以使用 `ShadApp.router`：

```dart
return ShadApp.router(
  routerConfig: router,
  // 其他配置...
);
```

### ShadcnUI + Material

如果你需要同时使用 ShadcnUI 和 Material 组件：

```dart
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      home: MyHomePage(),
    );
  }
}
```

如果需要自定义 Material 主题：

```dart
return ShadApp.material(
  materialThemeBuilder: (context, theme) {
    return theme.copyWith(
      appBarTheme: const AppBarTheme(toolbarHeight: 52),
    );
  },
  home: MyHomePage(),
);
```

### ShadcnUI + Cupertino

如果你需要同时使用 ShadcnUI 和 Cupertino 组件：

```dart
import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.cupertino(
      home: MyHomePage(),
    );
  }
}
```

如果需要自定义 Cupertino 主题：

```dart
return ShadApp.cupertino(
  cupertinoThemeBuilder: (context, theme) {
    return theme.copyWith(applyThemeToAll: true);
  },
  home: MyHomePage(),
);
```

### 自定义应用集成

如果你需要与其他框架集成，例如 GetX：

```dart
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      appBuilder: (context, theme) => GetMaterialApp(
        theme: theme,
        home: MyHomePage(),
        builder: (context, child) {
          return ShadToaster(child: child!);
        },
      ),
    );
  }
}
```

## 主题配置

### 亮色/暗色主题

ShadcnUI 支持亮色和暗色主题，可以通过 `theme` 和 `darkTheme` 属性设置：

```dart
return ShadApp(
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(),
  ),
  darkTheme: ShadThemeData(
    brightness: Brightness.dark,
    colorScheme: const ShadZincColorScheme.dark(),
  ),
  themeMode: ThemeMode.system,  // 可选值：system, light, dark
  home: MyHomePage(),
);
```

### 颜色方案

ShadcnUI 提供了多种预定义的颜色方案：

- blue
- gray
- green
- neutral
- orange
- red
- rose
- slate
- stone
- violet
- yellow
- zinc

使用示例：

```dart
return ShadApp(
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadBlueColorScheme.light(),
  ),
  darkTheme: ShadThemeData(
    brightness: Brightness.dark,
    colorScheme: const ShadBlueColorScheme.dark(),
  ),
  home: MyHomePage(),
);
```

也可以使用 `ShadColorScheme.fromName` 方法动态选择颜色方案：

```dart
// 可用的颜色方案名称
final shadThemeColors = [
  'blue', 'gray', 'green', 'neutral', 'orange', 'red',
  'rose', 'slate', 'stone', 'violet', 'yellow', 'zinc',
];

final lightColorScheme = ShadColorScheme.fromName('blue');
final darkColorScheme = ShadColorScheme.fromName('slate', brightness: Brightness.dark);
```

### 自定义主题

你可以通过覆盖特定属性来自定义主题：

```dart
return ShadApp(
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(
      // 自定义背景色
      background: Colors.white,
      // 自定义主色调
      primary: Colors.blue,
    ),
    // 自定义主按钮主题
    primaryButtonTheme: const ShadButtonTheme(
      backgroundColor: Colors.cyan,
    ),
    // 禁用次要边框
    disableSecondaryBorder: true,
  ),
  home: MyHomePage(),
);
```

### 字体设置

#### 使用 Google Fonts

首先安装 [google_fonts](https://pub.dev/packages/google_fonts) 包，然后：

```dart
import 'package:google_fonts/google_fonts.dart';

return ShadApp(
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(),
    textTheme: ShadTextTheme.fromGoogleFont(
      GoogleFonts.poppins,
      colorScheme: const ShadZincColorScheme.light(),
    ),
  ),
  home: MyHomePage(),
);
```

#### 使用自定义字体

在 `pubspec.yaml` 中添加字体：

```yaml
flutter:
  fonts:
    - family: MyCustomFont
      fonts:
        - asset: fonts/MyCustomFont-Regular.ttf
        - asset: fonts/MyCustomFont-Bold.ttf
          weight: 700
```

然后在应用中使用：

```dart
return ShadApp(
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(),
    textTheme: ShadTextTheme(family: 'MyCustomFont'),
  ),
  home: MyHomePage(),
);
```

## 组件列表

ShadcnUI 提供了以下组件：

### Accordion 手风琴

Accordion（手风琴）组件是一个可折叠的内容面板，用于在有限的空间内组织和显示大量内容。

#### 基本用法

```dart
final details = [
  (
    title: '这是可接受的吗？',
    content: '是的。它符合 WAI-ARIA 设计模式。',
  ),
  (
    title: '它有样式吗？',
    content: '是的。它带有默认样式，与其他组件的美学相匹配。',
  ),
  (
    title: '它有动画效果吗？',
    content: '是的。它默认带有动画效果，但如果您愿意，可以禁用它。',
  ),
];

// 单选模式（一次只能展开一个项目）
ShadAccordion<({String content, String title})>(
  children: details.map(
    (detail) => ShadAccordionItem(
      value: detail,
      title: Text(detail.title),
      child: Text(detail.content),
    ),
  ),
)

// 多选模式（可同时展开多个项目）
ShadAccordion<({String content, String title})>.multiple(
  children: details.map(
    (detail) => ShadAccordionItem(
      value: detail,
      title: Text(detail.title),
      child: Text(detail.content),
    ),
  ),
)
```

#### ShadAccordion 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadAccordionVariant` | 手风琴的变体，可以是 `single`（单选）或 `multiple`（多选）。决定是否只能展开一个或多个项目。 |
| `children` | `Iterable<Widget>` | 手风琴的子项目列表，通常是 `ShadAccordionItem` 小部件。 |
| `initialValue` | `List<T>?` | 初始展开的项目值列表。对于单选类型，只使用第一个值；对于多选，使用所有值。 |
| `maintainState` | `bool?` | 是否在小部件树中维护关闭项目的状态。如果为 true，关闭项目保持构建但隐藏；如果为 false，则删除它们。 |

#### ShadAccordionItem 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `T` | 项目的唯一值，用于识别和管理展开状态。 |
| `title` | `Widget` | 项目的标题小部件，始终可见。通常是 `Text` 小部件。 |
| `child` | `Widget` | 项目的内容小部件，在展开时显示。 |
| `separator` | `Widget?` | 项目底部的分隔线。默认为水平分隔线。 |
| `icon` | `Widget?` | 自定义的展开/折叠图标。如果提供，则覆盖 `iconData`。 |
| `iconData` | `IconData?` | 展开/折叠图标的图标数据。默认为向下箭头。 |
| `iconEffects` | `List<Effect<dynamic>>?` | 应用于图标的动画效果列表。默认为旋转效果。 |
| `padding` | `EdgeInsets?` | 项目标题的内边距。默认为 `EdgeInsets.symmetric(vertical: 16)`。 |
| `underlineTitleOnHover` | `bool?` | 悬停时是否在标题下添加下划线。默认为 `true`。 |
| `titleStyle` | `TextStyle?` | 标题的文本样式。默认为主题的列表文本样式带中等字重。 |
| `curve` | `Curve?` | 展开/折叠动画的曲线。默认为特定的立方贝塞尔曲线。 |
| `duration` | `Duration?` | 展开/折叠动画的持续时间。默认为 300 毫秒。 |
| `focusNode` | `FocusNode?` | 用于键盘导航的焦点节点。如果为 null，则在内部创建。 |
| `effects` | `List<Effect<dynamic>>?` | 展开/折叠时应用于内容的动画效果列表。默认为内边距、滑动和大小效果。 |

### Alert 警告提示

Alert（警告提示）组件用于向用户显示重要信息，如提示、警告或错误消息。

#### 基本用法

```dart
// 基本提示
ShadAlert(
  iconData: LucideIcons.terminal,
  title: Text('提示！'),
  description: Text('您可以使用 CLI 向应用程序添加组件。'),
)

// 错误/警告提示
ShadAlert.destructive(
  iconData: LucideIcons.circleAlert,
  title: Text('错误'),
  description: Text('您的会话已过期。请重新登录。'),
)
```

#### ShadAlert 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadAlertVariant` | 警告提示的变体，可以是 `primary`（主要）或 `destructive`（破坏性）。决定通过 `ShadTheme` 应用的视觉样式。 |
| `icon` | `Widget?` | 用作警告提示图标的自定义小部件，优先于 `iconData`。如果提供，将显示此小部件而不是从 `iconData` 生成的图标。 |
| `iconData` | `IconData?` | 如果未提供 `icon`，则显示的图标数据。用于创建具有指定 `iconColor` 的默认 `Icon` 小部件。 |
| `title` | `Widget?` | 警告提示的标题小部件，通常是 `Text` 小部件。使用 `titleStyle` 或主题默认值定义的样式显示。 |
| `description` | `Widget?` | 警告提示的描述小部件，通常是提供额外详细信息的 `Text` 小部件。使用 `descriptionStyle` 或主题默认值定义的样式显示。 |
| `textDirection` | `TextDirection?` | 警告提示内容的文本方向，如果指定，则覆盖默认方向。可以设置为 `TextDirection.ltr` 或 `TextDirection.rtl`。 |
| `decoration` | `ShadDecoration?` | 警告提示的自定义装饰，如果提供，则与主题默认值合并。允许自定义边框、内边距和其他视觉属性。 |
| `iconPadding` | `EdgeInsets?` | 图标周围的内边距，如果未指定，默认为右内边距 12。控制图标与相邻内容之间的间距。 |
| `iconColor` | `Color?` | 图标的颜色，如果提供，则覆盖主题默认值。如果 `icon` 为空，则应用于从 `iconData` 创建的 `Icon`。 |
| `titleStyle` | `TextStyle?` | 标题文本的样式，如果提供，则覆盖主题默认值。控制 `title` 的字体大小、粗细、颜色和其他文本属性。 |
| `descriptionStyle` | `TextStyle?` | 描述文本的样式，如果提供，则覆盖主题默认值。控制 `description` 的字体大小、粗细、颜色和其他文本属性。 |
| `mainAxisAlignment` | `MainAxisAlignment?` | 警告提示内容的主轴对齐方式，默认为 `MainAxisAlignment.start`。 |
| `crossAxisAlignment` | `CrossAxisAlignment?` | 警告提示内容的交叉轴对齐方式，默认为 `CrossAxisAlignment.start`。 |

### Avatar 头像

Avatar（头像）组件用于显示用户头像图像，并在图像加载失败时提供占位符。

#### 基本用法

```dart
// 基本头像，带有文本占位符
ShadAvatar(
  'https://avatars.githubusercontent.com/u/124599?v=4',
  placeholder: Text('CN'),
)

// 自定义大小和形状
ShadAvatar(
  'https://avatars.githubusercontent.com/u/124599?v=4',
  size: const Size(60, 60),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  backgroundColor: Colors.blue.shade100,
)
```

#### ShadAvatar 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `src` | `dynamic` | 要显示的图像源，可以是网络 URL、资产路径或其他支持的类型。由 `UniversalImage` 处理渲染。 |
| `placeholder` | `Widget?` | 图像加载时或加载失败时显示的小部件。如果未提供，默认为空的 `SizedBox`。 |
| `size` | `Size?` | 头像的大小，如果指定，则覆盖主题默认值。定义宽度和高度；如果未设置，默认为 40x40。 |
| `shape` | `ShapeBorder?` | 头像边框的形状，如果指定，则覆盖主题默认值。通常是 `CircleBorder`，但可以自定义（例如，`RoundedRectangleBorder`）。 |
| `backgroundColor` | `Color?` | 头像的背景颜色，显示在图像后面。如果提供，则覆盖主题的柔和色。 |
| `package` | `String?` | 资产图像的包名，当 `src` 是资产路径时使用。可选，仅与基于资产的图像相关。 |
| `fit` | `BoxFit?` | 图像应如何适应头像的边界。如果指定，则覆盖主题默认值；影响图像缩放和裁剪。 |

### Badge 徽章

Badge（徽章）组件用于显示简短的信息，如标签或状态指示器。

#### 基本用法

```dart
// 主要徽章
ShadBadge(child: Text('主要'))

// 次要徽章
ShadBadge.secondary(child: Text('次要'))

// 破坏性徽章（用于错误或警告状态）
ShadBadge.destructive(child: Text('破坏性'))

// 轮廓徽章（带边框外观）
ShadBadge.outline(child: Text('轮廓'))

// 可点击的徽章
ShadBadge(
  child: Text('可点击'),
  onPressed: () {
    print('徽章被点击了');
  },
)
```

#### ShadBadge 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadBadgeVariant` | 徽章的变体，可以是 `primary`（主要）、`secondary`（次要）、`outline`（轮廓）或 `destructive`（破坏性）。决定通过 `ShadTheme` 应用的视觉样式。 |
| `child` | `Widget` | 徽章内显示的内容小部件，通常是 `Text` 小部件。使用前景色和主题文本样式进行样式设置。 |
| `shape` | `ShapeBorder?` | 徽章边框的形状，如果指定，则覆盖主题默认值。通常是 `StadiumBorder`（体育场形状），但可以自定义（例如，`RoundedRectangleBorder`）。 |
| `backgroundColor` | `Color?` | 未悬停时徽章的背景颜色，如果提供，则覆盖主题默认值。如果未显式设置，则根据 `variant` 变化。 |
| `hoverBackgroundColor` | `Color?` | 悬停时徽章的背景颜色，如果提供，则覆盖主题默认值。在鼠标悬停时应用，提供视觉反馈。 |
| `foregroundColor` | `Color?` | 徽章内容（例如文本）的颜色，如果提供，则覆盖主题默认值。确保内容在背景上的可读性。 |
| `padding` | `EdgeInsets?` | 徽章内容周围的内边距，如果指定，则覆盖主题默认值。控制徽章的内部间距。 |
| `onPressed` | `VoidCallback?` | 点击徽章时调用的回调函数，如果提供，则使徽章可交互。如果为空，徽章保持非交互状态。 |
| `cursor` | `MouseCursor?` | 悬停在徽章上时显示的光标，当徽章可交互时提供反馈。如果提供了 `onPressed`，默认为 `SystemMouseCursors.click`，否则为 `MouseCursor.defer`。 |

### Button 按钮

Button（按钮）组件是一个高度可定制的按钮，支持多种变体和大小选项。

#### 基本用法

```dart
// 主要按钮
ShadButton(
  child: const Text('主要'),
  onPressed: () {},
)

// 次要按钮
ShadButton.secondary(
  child: const Text('次要'),
  onPressed: () {},
)

// 破坏性按钮（用于警告或错误操作）
ShadButton.destructive(
  child: const Text('破坏性'),
  onPressed: () {},
)

// 轮廓按钮（带边框外观）
ShadButton.outline(
  child: const Text('轮廓'),
  onPressed: () {},
)

// 幽灵按钮（最小化的样式）
ShadButton.ghost(
  child: const Text('幽灵'),
  onPressed: () {},
)

// 链接按钮（样式化为超链接）
ShadButton.link(
  child: const Text('链接'),
  onPressed: () {},
)

// 带图标的按钮
ShadButton(
  onPressed: () {},
  leading: const Icon(LucideIcons.mail),
  child: const Text('使用邮箱登录'),
)

// 加载中的按钮
ShadButton(
  onPressed: () {},
  leading: SizedBox.square(
    dimension: 16,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: ShadTheme.of(context).colorScheme.primaryForeground,
    ),
  ),
  child: const Text('请稍候'),
)

// 渐变和阴影按钮
ShadButton(
  onPressed: () {},
  gradient: const LinearGradient(colors: [
    Colors.cyan,
    Colors.indigo,
  ]),
  shadows: [
    BoxShadow(
      color: Colors.blue.withOpacity(0.4),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ],
  child: const Text('渐变带阴影'),
)
```

#### ShadButton 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadButtonVariant` | 按钮的变体，可以是 `primary`（主要）、`secondary`（次要）、`destructive`（破坏性）、`outline`（轮廓）、`ghost`（幽灵）或 `link`（链接）。决定通过 `ShadTheme` 应用的视觉样式。 |
| `size` | `ShadButtonSize?` | 按钮的大小，可以是 `regular`（常规）、`sm`（小）或 `lg`（大）。影响尺寸和内边距，除非被 `width`、`height` 或 `padding` 覆盖。 |
| `child` | `Widget?` | 按钮内显示的内容小部件，通常是 `Text` 小部件。使用前景色和主题文本样式进行样式设置。 |
| `leading` | `Widget?` | 显示在按钮内容前面的小部件，通常是图标。如果提供，将在文本前显示。 |
| `trailing` | `Widget?` | 显示在按钮内容后面的小部件，通常是图标。如果提供，将在文本后显示。 |
| `onPressed` | `VoidCallback?` | 点击按钮时调用的回调函数。如果为空，按钮将显示为禁用状态。 |
| `enabled` | `bool` | 按钮是否启用。如果为 `false`，按钮将显示为禁用状态且不响应点击。默认为 `true`。 |
| `backgroundColor` | `Color?` | 未悬停时按钮的背景颜色，如果提供，则覆盖主题默认值。 |
| `hoverBackgroundColor` | `Color?` | 悬停时按钮的背景颜色，如果提供，则覆盖主题默认值。 |
| `pressedBackgroundColor` | `Color?` | 按下时按钮的背景颜色，如果提供，则覆盖主题默认值。 |
| `foregroundColor` | `Color?` | 按钮内容的颜色，如果提供，则覆盖主题默认值。 |
| `hoverForegroundColor` | `Color?` | 悬停时按钮内容的颜色，如果提供，则覆盖主题默认值。 |
| `pressedForegroundColor` | `Color?` | 按下时按钮内容的颜色，如果提供，则覆盖主题默认值。 |
| `width` | `double?` | 按钮的宽度，如果指定，则覆盖基于 `size` 的默认宽度。 |
| `height` | `double?` | 按钮的高度，如果指定，则覆盖基于 `size` 的默认高度。 |
| `padding` | `EdgeInsets?` | 按钮内容周围的内边距，如果指定，则覆盖基于 `size` 的默认内边距。 |
| `shadows` | `List<BoxShadow>?` | 按钮的阴影列表，如果提供，则覆盖主题默认值。 |
| `gradient` | `Gradient?` | 按钮的背景渐变，如果提供，则覆盖背景颜色。 |
| `decoration` | `ShadDecoration?` | 按钮的自定义装饰，如果提供，则与主题默认值合并。 |
| `gap` | `double?` | 按钮内容之间的间距，如果指定，则覆盖主题默认值。 |
| `cursor` | `MouseCursor?` | 悬停在按钮上时显示的光标，如果指定，则覆盖主题默认值。 |
| `autofocus` | `bool` | 按钮是否在创建时自动获得焦点。默认为 `false`。 |
| `focusNode` | `FocusNode?` | 用于控制按钮焦点的焦点节点。如果为空，则在内部创建。 |
| `mainAxisAlignment` | `MainAxisAlignment?` | 按钮内容的主轴对齐方式，默认为 `MainAxisAlignment.center`。 |
| `crossAxisAlignment` | `CrossAxisAlignment?` | 按钮内容的交叉轴对齐方式，默认为 `CrossAxisAlignment.center`。 |
| `textDirection` | `TextDirection?` | 按钮内容的文本方向，如果指定，则覆盖默认方向。 |
| `expands` | `bool?` | 按钮是否应该尽可能地占据可用空间。如果为 `true`，按钮将尽可能地宽。 |

### Calendar 日历

Calendar（日历）组件用于选择日期或日期范围，支持单日期选择、多日期选择或日期范围选择。

#### 基本用法

```dart
// 单日期选择日历
class SingleCalendar extends StatefulWidget {
  const SingleCalendar({super.key});

  @override
  State<SingleCalendar> createState() => _SingleCalendarState();
}

class _SingleCalendarState extends State<SingleCalendar> {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ShadCalendar(
      selected: today,
      fromMonth: DateTime(today.year - 1),
      toMonth: DateTime(today.year, 12),
      onChanged: (date) {
        print('选择的日期: $date');
      },
    );
  }
}

// 多日期选择日历
ShadCalendar.multiple(
  numberOfMonths: 2,
  fromMonth: DateTime(DateTime.now().year),
  toMonth: DateTime(DateTime.now().year + 1, 12),
  min: 5, // 最少选择 5 天
  max: 10, // 最多选择 10 天
  onChanged: (dates) {
    print('选择的日期数量: ${dates.length}');
  },
)

// 日期范围选择日历
ShadCalendar.range(
  min: 2, // 最少选择 2 天
  max: 5, // 最多选择 5 天
  onChanged: (range) {
    if (range != null) {
      print('开始日期: ${range.start}, 结束日期: ${range.end}');
    }
  },
)
```

#### 自定义选项

```dart
ShadCalendar(
  // 使用下拉菜单显示月份
  captionLayout: ShadCalendarCaptionLayout.dropdownMonths,

  // 隐藏导航按钮
  hideNavigation: true,

  // 显示周数
  showWeekNumbers: true,

  // 不显示当前月份之外的日期
  showOutsideDays: false,

  // 固定每月显示 6 周（需要 showOutsideDays 为 true）
  fixedWeeks: true,

  // 隐藏工作日名称
  hideWeekdayNames: true,

  // 允许取消选择
  allowDeselection: true,
)
```

#### ShadCalendar 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadCalendarVariant` | 日历的变体，可以是 `single`（单日期）、`multiple`（多日期）或 `range`（日期范围）。 |
| `selected` | `DateTime?` | 当前选择的日期，用于单日期选择模式。 |
| `multipleSelected` | `List<DateTime>?` | 当前选择的多个日期，用于多日期选择模式。 |
| `selectedRange` | `ShadDateTimeRange?` | 当前选择的日期范围，用于日期范围选择模式。 |
| `onChanged` | `ValueChanged<DateTime?>?` | 单日期选择模式下，当选择日期变化时调用的回调函数。 |
| `onMultipleChanged` | `ValueChanged<List<DateTime>>?` | 多日期选择模式下，当选择日期变化时调用的回调函数。 |
| `onRangeChanged` | `ValueChanged<ShadDateTimeRange?>?` | 日期范围选择模式下，当选择范围变化时调用的回调函数。 |
| `showOutsideDays` | `bool?` | 是否显示当前月份之外的日期，默认为 `true`。 |
| `initialMonth` | `DateTime?` | 默认显示的月份，默认为当前月份。 |
| `formatMonthYear` | `String Function(DateTime date)?` | 月份和年份的格式化函数，默认为 'LLLL y'。 |
| `formatMonth` | `String Function(DateTime date)?` | 月份的格式化函数，默认为 'LLLL'。 |
| `formatYear` | `String Function(DateTime date)?` | 年份的格式化函数，默认为 'y'。 |
| `formatWeekday` | `String Function(DateTime date)?` | 工作日的格式化函数，默认为缩写形式。 |
| `showWeekNumbers` | `bool?` | 是否显示周数，默认为 `false`。 |
| `weekStartsOn` | `int?` | 一周的第一天，默认为 1（周一）。 |
| `fixedWeeks` | `bool?` | 是否固定每月显示 6 周，不考虑实际周数。需要 `showOutsideDays` 为 `true`。默认为 `false`。 |
| `hideWeekdayNames` | `bool?` | 是否隐藏工作日名称，默认为 `false`。 |
| `numberOfMonths` | `int` | 要显示的月份数量，默认为 1。 |
| `fromMonth` | `DateTime?` | 可选择的最早月份。 |
| `toMonth` | `DateTime?` | 可选择的最晚月份。 |
| `onMonthChanged` | `ValueChanged<DateTime>?` | 当显示的月份变化时调用的回调函数。 |
| `reverseMonths` | `bool` | 是否反转月份显示顺序，默认为 `false`。 |
| `min` | `int?` | 多日期或范围选择模式下，最少选择的天数。 |
| `max` | `int?` | 多日期或范围选择模式下，最多选择的天数。 |
| `selectableDayPredicate` | `bool Function(DateTime day)?` | 用于确定日期是否可选的函数。 |
| `captionLayout` | `ShadCalendarCaptionLayout?` | 标题布局，可以是 `label`（标签）、`dropdownMonths`（月份下拉菜单）或 `dropdownYears`（年份下拉菜单）。 |
| `hideNavigation` | `bool?` | 是否隐藏导航按钮，默认为 `false`。 |
| `allowDeselection` | `bool?` | 是否允许取消选择，默认为 `true`。 |

### Card 卡片

Card（卡片）组件用于显示结构化内容，包括标题、描述、主要内容和可选的底部。

#### 基本用法

```dart
// 基本卡片
ShadCard(
  title: const Text('卡片标题'),
  description: const Text('这是卡片的描述文本。'),
  child: const Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Text('这是卡片的主要内容区域。'),
  ),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      ShadButton.outline(
        child: const Text('取消'),
        onPressed: () {},
      ),
      const SizedBox(width: 8),
      ShadButton(
        child: const Text('确认'),
        onPressed: () {},
      ),
    ],
  ),
)

// 项目创建卡片示例
const frameworks = {
  'next': 'Next.js',
  'react': 'React',
  'astro': 'Astro',
  'nuxt': 'Nuxt.js',
};

ShadCard(
  width: 350,
  title: const Text('创建项目'),
  description: const Text('一键部署您的新项目。'),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ShadButton.outline(
        child: const Text('取消'),
        onPressed: () {},
      ),
      ShadButton(
        child: const Text('部署'),
        onPressed: () {},
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('名称'),
        const ShadInput(placeholder: Text('项目名称')),
        const SizedBox(height: 6),
        const Text('框架'),
        ShadSelect<String>(
          placeholder: const Text('选择'),
          options: frameworks.entries
              .map((e) => ShadOption(value: e.key, child: Text(e.value)))
              .toList(),
          selectedOptionBuilder: (context, value) {
            return Text(frameworks[value]!);
          },
          onChanged: (value) {},
        ),
      ],
    ),
  ),
)
```

#### ShadCard 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `title` | `Widget?` | 显示在卡片顶部的标题小部件。通常是 `Text` 小部件，使用主题的 h3 样式。 |
| `description` | `Widget?` | 显示在标题下方的描述小部件。通常是 `Text` 小部件，使用主题的柔和样式。 |
| `child` | `Widget?` | 卡片的主要内容小部件，显示在描述下方。在卡片的列布局中灵活展开。 |
| `footer` | `Widget?` | 显示在卡片底部的小部件。对于操作按钮或额外信息非常有用。 |
| `padding` | `EdgeInsets?` | 卡片内部的内边距，环绕所有内容。如果未指定，默认为 `EdgeInsets.all(24)`。 |
| `backgroundColor` | `Color?` | 卡片的背景颜色。如果未指定，默认为主题的卡片颜色。 |
| `radius` | `BorderRadius?` | 卡片角落的边框半径。如果未指定，默认为主题的半径。 |
| `border` | `Border?` | 卡片周围的边框。如果未指定，默认为使用主题的边框颜色的边框。 |
| `shadows` | `List<BoxShadow>?` | 应用于卡片的阴影列表，用于提升。如果未指定，默认为主题的卡片阴影。 |
| `width` | `double?` | 卡片的显式宽度。如果为空，卡片会根据其内容或约束调整大小。 |
| `height` | `double?` | 卡片的显式高度。如果为空，卡片会根据其内容或约束调整大小。 |
| `leading` | `Widget?` | 显示在卡片行开头的小部件。通常是图标或小图形，位于主要内容之前。 |
| `trailing` | `Widget?` | 显示在卡片行结尾的小部件。通常是图标或小图形，位于主要内容之后。 |
| `rowMainAxisAlignment` | `MainAxisAlignment?` | 卡片行（水平）的主轴对齐方式。如果未指定，默认为 `MainAxisAlignment.spaceBetween`。 |
| `rowCrossAxisAlignment` | `CrossAxisAlignment?` | 卡片行（垂直）的交叉轴对齐方式。如果未指定，默认为 `CrossAxisAlignment.start`。 |
| `columnMainAxisAlignment` | `MainAxisAlignment?` | 卡片列（垂直）的主轴对齐方式。如果未指定，默认为 `MainAxisAlignment.start`。 |
| `columnCrossAxisAlignment` | `CrossAxisAlignment?` | 卡片列（水平）的交叉轴对齐方式。如果未指定，默认为 `CrossAxisAlignment.start`。 |
| `rowMainAxisSize` | `MainAxisSize?` | 卡片行的主轴大小。如果未指定，默认为 `MainAxisSize.min`。 |
| `columnMainAxisSize` | `MainAxisSize?` | 卡片列的主轴大小。如果未指定，默认为 `MainAxisSize.min`。 |
| `clipBehavior` | `Clip?` | 卡片的剪裁行为，控制内容如何裁剪。如果未指定，默认为 `Clip.antiAlias`。 |

#### ShadCheckboxFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `String` | 表单字段的唯一标识符，用于在表单中识别该字段。 |
| `initialValue` | `bool` | 复选框的初始值，默认为 `false`。 |
| `inputLabel` | `Widget?` | 复选框的标签，通常是 `Text` 小部件。 |
| `inputSublabel` | `Widget?` | 复选框的副标签，通常是 `Text` 小部件。 |
| `onChanged` | `ValueChanged<bool>?` | 当复选框值变化时调用的回调函数。 |
| `validator` | `FormFieldValidator<bool>?` | 用于验证复选框值的函数。返回错误消息字符串或在有效时返回 null。 |
| `enabled` | `bool` | 复选框是否可交互，默认为 `true`。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |

### Checkbox 复选框

Checkbox（复选框）组件是一个可定制的复选框，允许用户切换布尔值，可选配标签和副标签。

#### 基本用法

```dart
// 基本复选框
class CheckboxSample extends StatefulWidget {
  const CheckboxSample({super.key});

  @override
  State<CheckboxSample> createState() => _CheckboxSampleState();
}

class _CheckboxSampleState extends State<CheckboxSample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return ShadCheckbox(
      value: value,
      onChanged: (v) => setState(() => value = v),
      label: const Text('接受条款和条件'),
      sublabel: const Text(
        '您同意我们的服务条款和隐私政策。',
      ),
    );
  }
}

// 在表单中使用复选框
ShadCheckboxFormField(
  id: 'terms',
  initialValue: false,
  inputLabel: const Text('我接受条款和条件'),
  onChanged: (v) {},
  inputSublabel: const Text('您同意我们的条款和条件'),
  validator: (v) {
    if (!v) {
      return '您必须接受条款和条件';
    }
    return null;
  },
)
```

#### ShadCheckbox 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `bool` | 复选框是否被选中（true）或未选中（false）。必需设置复选框的初始状态。 |
| `enabled` | `bool` | 复选框是否可交互。默认为 true；如果为 false，复选框将被禁用并在视觉上变暗。 |
| `onChanged` | `ValueChanged<bool>?` | 当复选框被切换时调用的回调函数。如果为 null，复选框将不可交互但仍然可见。 |
| `focusNode` | `FocusNode?` | 用于键盘导航和焦点处理的焦点节点。如果为 null，则创建内部焦点节点。 |
| `decoration` | `ShadDecoration?` | 应用于复选框的装饰。如果提供，则与主题的默认装饰合并。 |
| `size` | `double?` | 复选框的大小（宽度和高度）。如果未指定，默认为 16。 |
| `duration` | `Duration?` | 切换时复选框动画的持续时间。如果未指定，默认为 100 毫秒。 |
| `icon` | `Widget?` | 复选框选中时显示的图标。如果未指定，默认为勾选图标。 |
| `color` | `Color?` | 复选框选中时的颜色。如果未指定，默认为主题的主要颜色。 |
| `label` | `Widget?` | 显示在复选框旁边的可选标签。通常是 `Text` 小部件，根据 `direction` 定位。 |
| `sublabel` | `Widget?` | 显示在标签下方的可选副标签。通常是 `Text` 小部件，增强复选框描述。 |
| `padding` | `EdgeInsets?` | 复选框与其标签/副标签之间的内边距。如果未指定，默认为 `EdgeInsets.only(left: 8)`。 |
| `direction` | `TextDirection?` | 复选框和标签/副标签的文本方向。如果未指定，默认为 null（从上下文继承）。 |
| `crossAxisAlignment` | `CrossAxisAlignment?` | 复选框和标签/副标签的交叉轴对齐方式。如果标签和副标签都存在，默认为 `CrossAxisAlignment.start`，否则为 `CrossAxisAlignment.center`。 |

### ContextMenu 上下文菜单

ContextMenu（上下文菜单）组件用于显示一组操作或功能，通过鼠标右键点击或长按触发。

#### 基本用法

```dart
ShadContextMenuRegion(
  constraints: const BoxConstraints(minWidth: 300),
  items: [
    const ShadContextMenuItem.inset(
      child: Text('返回'),
    ),
    const ShadContextMenuItem.inset(
      enabled: false,
      child: Text('前进'),
    ),
    const ShadContextMenuItem.inset(
      child: Text('重新加载'),
    ),
    const ShadContextMenuItem.inset(
      trailing: Icon(LucideIcons.chevronRight),
      items: [
        ShadContextMenuItem(
          child: Text('将页面另存为...'),
        ),
        ShadContextMenuItem(
          child: Text('创建快捷方式...'),
        ),
        ShadContextMenuItem(
          child: Text('命名窗口...'),
        ),
        ShadSeparator.horizontal(
          margin: EdgeInsets.symmetric(vertical: 4),
        ),
        ShadContextMenuItem(
          child: Text('开发者工具'),
        ),
      ],
      child: Text('更多工具'),
    ),
  ],
  child: Container(
    width: 300,
    height: 200,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: theme.colorScheme.border),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text('右键点击此处'),
  ),
)
```

#### ShadContextMenuRegion 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 触发上下文菜单的子小部件。当用户右键点击或长按时，将显示上下文菜单。 |
| `items` | `Iterable<Widget>` | 上下文菜单的项目列表，通常是 `ShadContextMenuItem` 小部件。 |
| `visible` | `bool?` | 上下文菜单是否可见。如果提供，则覆盖控制器的状态。 |
| `constraints` | `BoxConstraints?` | 上下文菜单的大小约束。 |
| `onHoverArea` | `ValueChanged<bool>?` | 当鼠标悬停在上下文菜单区域上时调用的回调函数。 |
| `padding` | `EdgeInsets?` | 上下文菜单的内边距。 |
| `groupId` | `Object?` | 上下文菜单的组标识符，用于确定点击是否在菜单内。 |
| `effects` | `List<Effect<dynamic>>?` | 应用于上下文菜单的动画效果列表。 |
| `shadows` | `List<BoxShadow>?` | 上下文菜单的阴影列表。 |
| `decoration` | `ShadDecoration?` | 上下文菜单的装饰。 |
| `filter` | `ImageFilter?` | 上下文菜单的图像滤镜。 |
| `controller` | `ShadContextMenuController?` | 用于控制上下文菜单可见性的控制器。 |
| `longPressEnabled` | `bool?` | 是否在用户长按子小部件时显示上下文菜单。默认仅在 Android 和 iOS 上为 true。 |

#### ShadContextMenuItem 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 菜单项的内容小部件。通常是 `Text` 小部件。 |
| `items` | `Iterable<Widget>` | 子菜单的项目列表，用于创建嵌套菜单。 |
| `enabled` | `bool` | 菜单项是否启用。默认为 `true`。 |
| `leading` | `Widget?` | 显示在菜单项内容前面的小部件。 |
| `trailing` | `Widget?` | 显示在菜单项内容后面的小部件。 |
| `leadingPadding` | `EdgeInsets?` | 前置小部件的内边距。 |
| `trailingPadding` | `EdgeInsets?` | 后置小部件的内边距。 |
| `padding` | `EdgeInsets?` | 菜单项的内边距。 |
| `onPressed` | `VoidCallback?` | 点击菜单项时调用的回调函数。 |
| `anchor` | `ShadAnchorBase?` | 子菜单的锚点位置。 |
| `showDelay` | `Duration?` | 显示子菜单前的延迟时间。 |
| `height` | `double?` | 菜单项的高度。 |
| `buttonVariant` | `ShadButtonVariant?` | 菜单项的按钮变体。 |
| `decoration` | `ShadDecoration?` | 菜单项的装饰。 |
| `textStyle` | `TextStyle?` | 菜单项文本的样式。 |
| `trailingTextStyle` | `TextStyle?` | 后置文本的样式。 |
| `constraints` | `BoxConstraints?` | 子菜单的大小约束。 |
| `subMenuPadding` | `EdgeInsets?` | 子菜单的内边距。 |
| `backgroundColor` | `Color?` | 菜单项的背景颜色。 |
| `selectedBackgroundColor` | `Color?` | 菜单项选中时的背景颜色。 |
| `closeOnTap` | `bool?` | 点击菜单项后是否关闭上下文菜单。 |

#### ShadContextMenuController 方法

| 方法 | 描述 |
|------|------|
| `show()` | 显示上下文菜单。 |
| `hide()` | 隐藏上下文菜单。 |
| `toggle()` | 切换上下文菜单的可见性。 |
| `setOpen(bool open)` | 设置上下文菜单的可见性。 |

#### ShadDatePickerFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符。 |
| `label` | `Widget?` | 日期选择器的标签。 |
| `error` | `Widget?` | 日期选择器的错误消息。 |
| `description` | `Widget?` | 日期选择器的描述。 |
| `onChanged` | `ValueChanged<DateTime?>?` | 日期变化时调用的回调函数。 |
| `validator` | `String? Function(DateTime?)?` | 用于验证日期的函数。 |
| `enabled` | `bool?` | 日期选择器是否启用。 |
| `initialValue` | `DateTime?` | 日期选择器的初始值。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |

### DatePicker 日期选择器

DatePicker（日期选择器）组件是一个带有按钮和弹出日历的日期选择器，允许用户选择单个日期或日期范围。

#### 基本用法

```dart
// 单日期选择器
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 600),
  child: const ShadDatePicker(),
)

// 日期范围选择器
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 600),
  child: const ShadDatePicker.range(),
)

// 带预设选项的日期选择器
const presets = {
  0: '今天',
  1: '明天',
  3: '3天后',
  7: '一周后',
};

ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 600),
  child: ShadDatePicker(
    // 使用相同的 groupId 以保持日期选择器弹出框在选择器弹出框关闭时保持打开状态
    groupId: groupId,
    header: ShadSelect<int>(
      groupId: groupId,
      minWidth: 284,
      placeholder: const Text('选择'),
      options: presets.entries
          .map((e) => ShadOption(value: e.key, child: Text(e.value)))
          .toList(),
      selectedOptionBuilder: (context, value) {
        return Text(presets[value]!);
      },
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          selected = today.add(Duration(days: value));
        });
      },
    ),
    selected: selected,
    calendarDecoration: theme.calendarTheme.decoration,
    popoverPadding: const EdgeInsets.all(4),
  ),
)
```

#### 在表单中使用日期选择器

```dart
ShadDatePickerFormField(
  label: const Text('出生日期'),
  onChanged: print,
  description: const Text('您的出生日期用于计算您的年龄。'),
  validator: (v) {
    if (v == null) {
      return '需要提供出生日期。';
    }
    return null;
  },
)
```

#### ShadDatePicker 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadDatePickerVariant` | 日期选择器的变体，可以是 `single`（单选）或 `range`（范围）。 |
| `placeholder` | `Widget?` | 未选择日期时显示的占位符。 |
| `popoverController` | `ShadPopoverController?` | 用于控制弹出日历的控制器。 |
| `selected` | `DateTime?` | 当前选中的日期（单选模式）。 |
| `selectedRange` | `ShadDateTimeRange?` | 当前选中的日期范围（范围模式）。 |
| `closeOnSelection` | `bool?` | 选择日期后是否关闭弹出日历。 |
| `formatDate` | `String Function(DateTime)?` | 用于格式化日期显示的函数（单选模式）。 |
| `formatDateRange` | `String Function(ShadDateTimeRange)?` | 用于格式化日期范围显示的函数（范围模式）。 |
| `allowDeselection` | `bool?` | 是否允许取消选择日期。 |
| `header` | `Widget?` | 显示在日历顶部的小部件，如预设选项。 |
| `footer` | `Widget?` | 显示在日历底部的小部件。 |
| `groupId` | `Object?` | 用于分组交互的标识符，如与预设选项选择器共享。 |
| `calendarDecoration` | `ShadDecoration?` | 日历的装饰。 |
| `popoverPadding` | `EdgeInsets?` | 弹出日历的内边距。 |
| `multipleSelected` | `List<DateTime>?` | 当前选中的多个日期（多选模式）。 |
| `onChanged` | `ValueChanged<DateTime?>?` | 单选日期变化时调用的回调函数。 |
| `onMultipleChanged` | `ValueChanged<List<DateTime>>?` | 多选日期变化时调用的回调函数。 |
| `onRangeChanged` | `ValueChanged<ShadDateTimeRange?>?` | 日期范围变化时调用的回调函数。 |
| `showOutsideDays` | `bool?` | 是否显示当前月份之外的日期。 |
| `initialMonth` | `DateTime?` | 初始显示的月份。 |
| `numberOfMonths` | `int` | 同时显示的月份数量。默认为 1。 |
| `fromMonth` | `DateTime?` | 可选月份的起始日期。 |
| `toMonth` | `DateTime?` | 可选月份的结束日期。 |
| `min` | `DateTime?` | 可选日期的最小值。 |
| `max` | `DateTime?` | 可选日期的最大值。 |
| `selectableDayPredicate` | `bool Function(DateTime)?` | 用于确定日期是否可选的函数。 |
| `enabled` | `bool` | 日期选择器是否启用。默认为 `true`。 |

### Dialog 对话框

Dialog（对话框）组件是一个模态对话框，用于显示需要用户注意的内容和操作。

#### 基本用法

```dart
// 显示对话框
ShadButton.outline(
  child: const Text('显示对话框'),
  onPressed: () {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('编辑个人资料'),
        description: const Text('在此处对您的个人资料进行更改。完成后点击保存。'),
        actions: [
          ShadButton(
            child: const Text('保存更改'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        child: Container(
          width: 375,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('名称', textAlign: TextAlign.end),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: ShadInput(initialValue: 'Alexandru'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text('用户名', textAlign: TextAlign.end),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: ShadInput(initialValue: 'nank1ro'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
)

// 警告对话框
ShadButton.outline(
  child: const Text('显示警告对话框'),
  onPressed: () {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: const Text('您确定要删除吗？'),
        description: const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            '此操作无法撤销。这将永久删除您的账户并从我们的服务器中删除您的数据。',
          ),
        ),
        actions: [
          ShadButton.outline(
            child: const Text('取消'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ShadButton(
            child: const Text('继续'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  },
)
```

#### showShadDialog 函数参数

| 参数 | 类型 | 描述 |
|------|------|------|
| `context` | `BuildContext` | 显示对话框的构建上下文。 |
| `builder` | `WidgetBuilder` | 创建对话框内容的构建函数。 |
| `barrierDismissible` | `bool` | 是否可以通过点击外部屏障来关闭对话框。默认为 `true`。 |
| `barrierColor` | `Color` | 对话框后面屏障的颜色。默认为半透明黑色。 |
| `barrierLabel` | `String?` | 屏障的语义标签，用于辅助功能。 |
| `useRootNavigator` | `bool` | 是否使用根导航器显示对话框。默认为 `true`。 |
| `routeSettings` | `RouteSettings?` | 对话框路由的设置。 |
| `anchorPoint` | `Offset?` | 对话框的锚点位置。 |
| `animateIn` | `List<Effect<dynamic>>?` | 对话框显示时的动画效果列表。 |
| `animateOut` | `List<Effect<dynamic>>?` | 对话框关闭时的动画效果列表。 |
| `variant` | `ShadDialogVariant` | 对话框的变体，可以是 `primary`（主要）或 `alert`（警告）。默认为 `ShadDialogVariant.primary`。 |

#### ShadDialog 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadDialogVariant` | 对话框的变体，可以是 `primary`（主要）或 `alert`（警告）。决定通过 `ShadTheme` 应用的视觉样式。 |
| `title` | `Widget?` | 对话框的标题小部件，显示在顶部。通常是 `Text` 小部件。 |
| `description` | `Widget?` | 对话框的描述小部件，显示在标题下方。通常是 `Text` 小部件。 |
| `child` | `Widget?` | 对话框的主要内容小部件，显示在描述下方。 |
| `actions` | `List<Widget>` | 显示在对话框底部的操作小部件列表。通常是按钮，根据 `actionsAxis` 排列。默认为空列表。 |
| `closeIcon` | `Widget?` | 关闭按钮的自定义小部件。如果提供，则覆盖 `closeIconData`；默认为带有 'X' 图标的幽灵按钮。 |
| `closeIconData` | `IconData?` | 关闭按钮的图标数据。如果未提供 `closeIcon`，则使用此图标数据创建关闭按钮。 |
| `closeIconPosition` | `Alignment?` | 关闭按钮的位置。默认为 `Alignment.topRight`。 |
| `radius` | `BorderRadius?` | 对话框的边框半径。如果未指定，默认为主题的半径。 |
| `backgroundColor` | `Color?` | 对话框的背景颜色。如果未指定，默认为主题的背景颜色。 |
| `padding` | `EdgeInsets?` | 对话框内容的内边距。如果未指定，默认为 `EdgeInsets.all(24)`。 |
| `gap` | `double?` | 对话框内容元素之间的间距。如果未指定，默认为 16。 |
| `constraints` | `BoxConstraints?` | 对话框的大小约束。如果未指定，默认为最大宽度 500，最小宽度 280。 |
| `border` | `Border?` | 对话框的边框。如果未指定，默认为主题的边框。 |
| `shadows` | `List<BoxShadow>?` | 对话框的阴影列表。如果未指定，默认为主题的阴影。 |
| `actionsAxis` | `Axis?` | 操作按钮的排列方向。在小屏幕上默认为 `Axis.vertical`，在大屏幕上默认为 `Axis.horizontal`。 |
| `actionsMainAxisSize` | `MainAxisSize?` | 操作按钮的主轴大小。默认为 `MainAxisSize.max`。 |
| `actionsMainAxisAlignment` | `MainAxisAlignment?` | 操作按钮的主轴对齐方式。默认为 `MainAxisAlignment.end`。 |
| `actionsVerticalDirection` | `VerticalDirection?` | 操作按钮的垂直方向。在小屏幕上默认为 `VerticalDirection.up`，在大屏幕上默认为 `VerticalDirection.down`。 |
| `titleStyle` | `TextStyle?` | 标题的文本样式。如果未指定，默认为主题的 h3 样式。 |
| `descriptionStyle` | `TextStyle?` | 描述的文本样式。如果未指定，默认为主题的柔和样式。 |
| `titleTextAlign` | `TextAlign?` | 标题的文本对齐方式。默认为 `TextAlign.center`。 |
| `descriptionTextAlign` | `TextAlign?` | 描述的文本对齐方式。默认为 `TextAlign.center`。 |
| `alignment` | `Alignment?` | 对话框在屏幕上的对齐方式。默认为 `Alignment.center`。 |
| `mainAxisAlignment` | `MainAxisAlignment?` | 对话框内容的主轴对齐方式。默认为 `MainAxisAlignment.start`。 |
| `crossAxisAlignment` | `CrossAxisAlignment?` | 对话框内容的交叉轴对齐方式。默认为 `CrossAxisAlignment.center`。 |
| `scrollable` | `bool?` | 对话框内容是否可滚动。默认为 `true`。 |
| `scrollPadding` | `EdgeInsets?` | 对话框内容可滚动时应用的内边距。默认为键盘的视图插入。 |

### IconButton 图标按钮

IconButton（图标按钮）组件是一个专为图标设计的按钮，支持多种变体和交互状态。

#### 基本用法

```dart
// 主要图标按钮
ShadIconButton(
  onPressed: () => print('Primary'),
  icon: const Icon(LucideIcons.rocket),
)

// 次要图标按钮
ShadIconButton.secondary(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Secondary'),
)

// 破坏性图标按钮
ShadIconButton.destructive(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Destructive'),
)

// 轮廓图标按钮
ShadIconButton.outline(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Outline'),
)

// 幽灵图标按钮
ShadIconButton.ghost(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Ghost'),
)
```

#### 加载状态和渐变效果

```dart
// 加载状态图标按钮
ShadIconButton(
  icon: SizedBox.square(
    dimension: 16,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: ShadTheme.of(context).colorScheme.primaryForeground,
    ),
  ),
)

// 带渐变和阴影的图标按钮
ShadIconButton(
  gradient: const LinearGradient(colors: [
    Colors.cyan,
    Colors.indigo,
  ]),
  shadows: [
    BoxShadow(
      color: Colors.blue.withValues(alpha: .4),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ],
  icon: const Icon(LucideIcons.rocket),
)
```

#### ShadIconButton 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadButtonVariant` | 图标按钮的变体，可以是 `primary`（主要）、`destructive`（破坏性）、`outline`（轮廓）、`secondary`（次要）或 `ghost`（幽灵）。 |
| `icon` | `Widget` | 图标按钮的图标小部件，通常是 `Icon` 小部件。 |
| `iconSize` | `double?` | 图标的大小。如果未指定，则使用主题的默认图标大小。 |
| `onPressed` | `VoidCallback?` | 点击图标按钮时调用的回调函数。如果为 null，则按钮将被禁用。 |
| `cursor` | `MouseCursor?` | 悬停在图标按钮上时显示的光标。 |
| `width` | `double?` | 图标按钮的宽度。如果未指定，则使用主题的默认宽度。 |
| `height` | `double?` | 图标按钮的高度。如果未指定，则使用主题的默认高度。 |
| `padding` | `EdgeInsets?` | 图标按钮的内边距。如果未指定，则使用主题的默认内边距。 |
| `backgroundColor` | `Color?` | 图标按钮的背景颜色。如果未指定，则使用主题的默认背景颜色。 |
| `hoverBackgroundColor` | `Color?` | 悬停时图标按钮的背景颜色。 |
| `foregroundColor` | `Color?` | 图标按钮的前景颜色（图标颜色）。 |
| `hoverForegroundColor` | `Color?` | 悬停时图标按钮的前景颜色。 |
| `autofocus` | `bool` | 图标按钮是否在构建时自动获得焦点。默认为 `false`。 |
| `focusNode` | `FocusNode?` | 用于控制图标按钮焦点的焦点节点。 |
| `pressedBackgroundColor` | `Color?` | 按下时图标按钮的背景颜色。 |
| `pressedForegroundColor` | `Color?` | 按下时图标按钮的前景颜色。 |
| `shadows` | `List<BoxShadow>?` | 图标按钮的阴影列表。 |
| `gradient` | `Gradient?` | 图标按钮的渐变效果。如果提供，则覆盖 `backgroundColor`。 |
| `decoration` | `ShadDecoration?` | 图标按钮的装饰。 |
| `enabled` | `bool` | 图标按钮是否启用。默认为 `true`。 |
| `onLongPress` | `VoidCallback?` | 长按图标按钮时调用的回调函数。 |
| `statesController` | `MaterialStatesController?` | 用于控制图标按钮状态的控制器。 |
| `onFocusChange` | `ValueChanged<bool>?` | 图标按钮焦点状态变化时调用的回调函数。 |

#### ShadInputFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符，用于在表单中识别该字段。 |
| `initialValue` | `String?` | 输入框的初始值。 |
| `controller` | `TextEditingController?` | 用于控制输入框文本的控制器。如果为 null，则在内部创建。 |
| `label` | `Widget?` | 输入框的标签，显示在输入框上方。通常是 `Text` 小部件。 |
| `error` | `Widget?` | 输入框的错误消息，显示在输入框下方。通常是 `Text` 小部件。 |
| `description` | `Widget?` | 输入框的描述，显示在输入框下方。通常是 `Text` 小部件。 |
| `onChanged` | `ValueChanged<String>?` | 输入文本变化时调用的回调函数。 |
| `validator` | `String? Function(String)?` | 用于验证输入值的函数。返回错误消息字符串或在有效时返回 null。 |
| `enabled` | `bool` | 输入框是否启用。默认为 true。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |
| `groupId` | `Object?` | 输入框的组标识符，用于确定点击是否在输入框内。默认为 `UniqueKey()`。 |

#### ShadInputOTPFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符，用于在表单中识别该字段。 |
| `maxLength` | `int` | 输入框的最大长度，即验证码的总位数。 |
| `children` | `List<Widget>` | 输入框的子小部件列表，通常是 `ShadInputOTPGroup` 和分隔符。 |
| `initialValue` | `String?` | 输入框的初始值。 |
| `enabled` | `bool` | 输入框是否启用。默认为 `true`。 |
| `label` | `Widget?` | 输入框的标签，显示在输入框上方。通常是 `Text` 小部件。 |
| `error` | `Widget?` | 输入框的错误消息，显示在输入框下方。通常是 `Text` 小部件。 |
| `description` | `Widget?` | 输入框的描述，显示在输入框下方。通常是 `Text` 小部件。 |
| `onChanged` | `ValueChanged<String>?` | 输入值变化时调用的回调函数。 |
| `validator` | `String? Function(String)?` | 用于验证输入值的函数。返回错误消息字符串或在有效时返回 null。 |
| `gap` | `double?` | 各个子小部件之间的间距。默认为 8。 |
| `jumpToNextWhenFilled` | `bool` | 当一个输入框填充后是否自动跳到下一个输入框。默认为 `true`。 |
| `inputFormatters` | `List<TextInputFormatter>?` | 应用于输入文本的格式化器列表。 |
| `keyboardType` | `TextInputType?` | 输入框的键盘类型。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |

### InputOTP 一次性密码输入框

InputOTP（一次性密码输入框）组件用于输入验证码或一次性密码，支持复制粘贴功能。

#### 基本用法

```dart
// 基本一次性密码输入框
ShadInputOTP(
  onChanged: (v) => print('OTP: $v'),
  maxLength: 6,
  children: const [
    ShadInputOTPGroup(
      children: [
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
      ],
    ),
    Icon(size: 24, LucideIcons.dot),
    ShadInputOTPGroup(
      children: [
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
      ],
    ),
  ],
)

// 仅允许输入数字的一次性密码输入框
ShadInputOTP(
  onChanged: (v) => print('OTP: $v'),
  maxLength: 4,
  keyboardType: TextInputType.number,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
  ],
  children: const [
    ShadInputOTPGroup(
      children: [
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
      ],
    ),
  ],
)

// 在表单中使用一次性密码输入框
ShadInputOTPFormField(
  id: 'otp',
  maxLength: 6,
  label: const Text('OTP'),
  description: const Text('请输入您的验证码。'),
  validator: (v) {
    if (v.contains(' ')) {
      return '请填写完整的验证码';
    }
    return null;
  },
  children: const [
    ShadInputOTPGroup(
      children: [
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
      ],
    ),
    Icon(size: 24, LucideIcons.dot),
    ShadInputOTPGroup(
      children: [
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
        ShadInputOTPSlot(),
      ],
    ),
  ],
)
```

#### ShadInputOTP 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `maxLength` | `int` | 输入框的最大长度，即验证码的总位数。 |
| `children` | `List<Widget>` | 输入框的子小部件列表，通常是 `ShadInputOTPGroup` 和分隔符。 |
| `enabled` | `bool` | 输入框是否启用。默认为 `true`。 |
| `gap` | `double?` | 各个子小部件之间的间距。默认为 8。 |
| `jumpToNextWhenFilled` | `bool` | 当一个输入框填充后是否自动跳到下一个输入框。默认为 `true`。 |
| `onChanged` | `ValueChanged<String>?` | 输入值变化时调用的回调函数。 |
| `inputFormatters` | `List<TextInputFormatter>?` | 应用于输入文本的格式化器列表。可以用于限制输入字符类型。 |
| `keyboardType` | `TextInputType?` | 输入框的键盘类型。影响移动设备上显示的键盘类型。 |
| `initialValue` | `String?` | 输入框的初始值。 |

#### ShadInputOTPGroup 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `children` | `List<Widget>` | 组内的子小部件列表，通常是多个 `ShadInputOTPSlot`。 |

#### ShadInputOTPSlot 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `focusNode` | `FocusNode?` | 用于控制焦点行为的焦点节点。如果为 null，则在内部创建。 |
| `controller` | `TextEditingController?` | 用于控制输入框文本的控制器。如果为 null，则在内部创建。 |
| `inputFormatters` | `List<TextInputFormatter>?` | 应用于输入文本的格式化器列表。 |
| `keyboardType` | `TextInputType?` | 输入框的键盘类型。 |
| `style` | `TextStyle?` | 输入文本的样式。 |
| `width` | `double?` | 输入框的宽度。 |
| `height` | `double?` | 输入框的高度。 |
| `padding` | `EdgeInsets?` | 输入框的内边距。 |
| `decoration` | `ShadDecoration?` | 应用于输入框的装饰。 |
| `firstRadius` | `BorderRadius?` | 组中第一个输入框的边框半径。 |
| `lastRadius` | `BorderRadius?` | 组中最后一个输入框的边框半径。 |
| `singleRadius` | `BorderRadius?` | 单个输入框的边框半径。 |
| `middleRadius` | `BorderRadius?` | 组中中间输入框的边框半径。 |
| `initialValue` | `String?` | 输入框的初始值。 |
| `textInputAction` | `TextInputAction?` | 键盘上显示的操作按钮类型。 |

### Input 输入框

Input（输入框）组件是一个可定制的文本输入字段，支持可选的前置和后置小部件。

#### 基本用法

```dart
// 基本输入框
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 320),
  child: const ShadInput(
    placeholder: Text('电子邮箱'),
    keyboardType: TextInputType.emailAddress,
  ),
)

// 带前置和后置图标的密码输入框
class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadInput(
      placeholder: const Text('密码'),
      obscureText: obscure,
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(LucideIcons.lock),
      ),
      trailing: ShadButton(
        width: 24,
        height: 24,
        padding: EdgeInsets.zero,
        decoration: const ShadDecoration(
          secondaryBorder: ShadBorder.none,
          secondaryFocusedBorder: ShadBorder.none,
        ),
        icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye),
        onPressed: () {
          setState(() => obscure = !obscure);
        },
      ),
    );
  }
}

// 在表单中使用输入框
ShadInputFormField(
  id: 'username',
  label: const Text('用户名'),
  placeholder: const Text('输入您的用户名'),
  description: const Text('这是您的公开显示名称。'),
  validator: (v) {
    if (v.length < 2) {
      return '用户名必须至少有2个字符。';
    }
    return null;
  },
)
```

#### ShadInput 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `initialValue` | `String?` | 输入框的初始值。 |
| `placeholder` | `Widget?` | 输入框为空时显示的占位符。通常是 `Text` 小部件。 |
| `controller` | `TextEditingController?` | 用于控制输入框文本的控制器。如果为 null，则在内部创建。 |
| `focusNode` | `FocusNode?` | 用于控制焦点行为的焦点节点。如果为 null，则在内部创建。 |
| `decoration` | `ShadDecoration?` | 应用于输入框的装饰。如果提供，则与主题的默认装饰合并。 |
| `keyboardType` | `TextInputType?` | 输入框的键盘类型。影响移动设备上显示的键盘类型。 |
| `textInputAction` | `TextInputAction?` | 键盘上显示的操作按钮类型。如果为 null，则自动选择适当的操作。 |
| `textCapitalization` | `TextCapitalization` | 文本的大写方式。默认为 `TextCapitalization.none`。 |
| `style` | `TextStyle?` | 输入文本的样式。如果为 null，则使用主题的默认文本样式。 |
| `groupId` | `Object?` | 输入框的组标识符，用于确定点击是否在输入框内。默认为 `UniqueKey()`。 |
| `onPressedOutside` | `VoidCallback?` | 当点击输入框外部时调用的回调函数。 |
| `textAlign` | `TextAlign` | 文本的对齐方式。默认为 `TextAlign.start`。 |
| `textDirection` | `TextDirection?` | 文本的方向。如果为 null，则从上下文中推断。 |
| `readOnly` | `bool` | 输入框是否为只读。默认为 false；如果为 true，则禁用编辑但仍可能启用选择。 |
| `showCursor` | `bool?` | 是否在输入框中显示光标。默认为 null，依赖于 Flutter 的默认行为。 |
| `autofocus` | `bool` | 输入框是否在构建时自动获得焦点。默认为 false。 |
| `obscuringCharacter` | `String` | 当 `obscureText` 为 true 时用于遮蔽文本的字符。默认为 '•'。 |
| `obscureText` | `bool` | 是否遮蔽输入的文本（用于密码字段）。默认为 false。 |
| `autocorrect` | `bool` | 是否启用自动更正。默认为 true。 |
| `enableSuggestions` | `bool` | 是否启用文本建议。默认为 true。 |
| `maxLines` | `int?` | 输入框可以跨越的最大行数。默认为 1；影响 `keyboardType`。 |
| `minLines` | `int?` | 输入框应显示的最小行数。默认为 null；必须小于或等于 `maxLines`。 |
| `expands` | `bool` | 输入框是否扩展以填充可用的垂直空间。默认为 false；要求 `maxLines` 和 `minLines` 为 null。 |
| `maxLength` | `int?` | 输入文本的最大长度。默认为 null（无限制）；由 `maxLengthEnforcement` 强制执行。 |
| `maxLengthEnforcement` | `MaxLengthEnforcement?` | 如何强制执行 `maxLength`。如果未指定，默认为平台特定行为。 |
| `onChanged` | `ValueChanged<String>?` | 输入文本变化时调用的回调函数。 |
| `onEditingComplete` | `VoidCallback?` | 用户提交编辑时调用的回调函数。 |
| `onSubmitted` | `ValueChanged<String>?` | 用户提交输入时调用的回调函数。 |
| `inputFormatters` | `List<TextInputFormatter>?` | 应用于输入文本的格式化器列表。 |
| `enabled` | `bool` | 输入框是否启用。默认为 true。 |
| `cursorWidth` | `double` | 光标的宽度。默认为 2.0。 |
| `cursorHeight` | `double?` | 光标的高度。如果为 null，则使用文本的高度。 |
| `cursorRadius` | `Radius?` | 光标的圆角半径。 |
| `cursorColor` | `Color?` | 光标的颜色。如果为 null，则使用主题的光标颜色。 |
| `selectionColor` | `Color?` | 文本选择的颜色。如果为 null，则使用主题的选择颜色。 |
| `padding` | `EdgeInsets?` | 输入框的内边距。默认为 `EdgeInsets.symmetric(horizontal: 12, vertical: 8)`。 |
| `prefix` | `Widget?` | 显示在输入文本前面的小部件。 |
| `suffix` | `Widget?` | 显示在输入文本后面的小部件。 |
| `leading` | `Widget?` | 显示在输入框左侧的小部件。 |
| `trailing` | `Widget?` | 显示在输入框右侧的小部件。 |
| `gap` | `double?` | 输入框与其前置/后置小部件之间的间距。默认为 8。 |
| `constraints` | `BoxConstraints?` | 输入框的约束。默认仅设置最小高度，基于 `style` 和 `placeholderStyle`。 |

### Menubar 菜单栏

Menubar（菜单栏）组件是一个常见于桌面应用程序的菜单栏，提供快速访问一组命令的方式。

#### 基本用法

```dart
ShadMenubar(
  items: [
    ShadMenubarItem(
      items: [
        const ShadContextMenuItem(child: Text('新建标签页')),
        const ShadContextMenuItem(child: Text('新建窗口')),
        const ShadContextMenuItem(
          enabled: false,
          child: Text('新建无痕浏览窗口'),
        ),
        ShadSeparator.horizontal(
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: theme.colorScheme.muted,
        ),
        const ShadContextMenuItem(
          trailing: Icon(LucideIcons.chevronRight),
          items: [
            ShadContextMenuItem(child: Text('通过邮件分享')),
            ShadContextMenuItem(child: Text('消息')),
            ShadContextMenuItem(child: Text('备忘录')),
          ],
          child: Text('分享'),
        ),
        ShadSeparator.horizontal(
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: theme.colorScheme.muted,
        ),
        const ShadContextMenuItem(child: Text('打印...')),
      ],
      child: const Text('文件'),
    ),
    ShadMenubarItem(
      items: [
        const ShadContextMenuItem(child: Text('撤销')),
        const ShadContextMenuItem(child: Text('重做')),
        ShadSeparator.horizontal(
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: theme.colorScheme.muted,
        ),
        ShadContextMenuItem(
          trailing: const Icon(LucideIcons.chevronRight),
          items: [
            const ShadContextMenuItem(child: Text('搜索网页')),
            ShadSeparator.horizontal(
              margin: const EdgeInsets.symmetric(vertical: 4),
              color: theme.colorScheme.muted,
            ),
            const ShadContextMenuItem(child: Text('查找...')),
            const ShadContextMenuItem(child: Text('查找下一个')),
            const ShadContextMenuItem(child: Text('查找上一个')),
          ],
          child: const Text('查找'),
        ),
      ],
      child: const Text('编辑'),
    ),
  ],
)
```

#### ShadMenubar 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `items` | `Iterable<Widget>` | 菜单栏的项目列表，通常是 `ShadMenubarItem` 小部件。 |
| `radius` | `BorderRadiusGeometry?` | 菜单栏的边框半径。默认为主题的半径。 |
| `controller` | `ShadMenubarController?` | 用于控制菜单栏选中项目的控制器。 |
| `padding` | `EdgeInsetsGeometry?` | 菜单栏的内边距。默认为 `EdgeInsets.all(4)`。 |
| `backgroundColor` | `Color?` | 菜单栏的背景颜色。 |
| `border` | `ShadBorder?` | 菜单栏的边框。默认为 `ShadBorder.all(color: theme.colorScheme.border, width: 1)`。 |
| `selectOnHover` | `bool?` | 是否在悬停时选中项目。默认为 `true`。 |

#### ShadMenubarItem 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 菜单项的内容小部件，通常是 `Text` 小部件。 |
| `items` | `Iterable<Widget>` | 菜单项的子项目列表，通常是 `ShadContextMenuItem` 小部件。 |
| `constraints` | `BoxConstraints?` | 子菜单的大小约束。 |
| `onHoverArea` | `double?` | 悬停区域的大小。 |
| `padding` | `EdgeInsetsGeometry?` | 子菜单的内边距。 |
| `groupId` | `Object?` | 用于分组菜单项的标识符。 |
| `effects` | `List<Effect<dynamic>>?` | 子菜单的动画效果列表。 |
| `shadows` | `List<BoxShadow>?` | 子菜单的阴影列表。 |
| `decoration` | `ShadDecoration?` | 子菜单的装饰。 |
| `filter` | `ImageFilter?` | 子菜单的图像滤镜。 |
| `controller` | `ShadPopoverController?` | 用于控制子菜单显示的控制器。 |
| `anchor` | `ShadAnchorBase?` | 子菜单的锚点。 |
| `onLongPress` | `VoidCallback?` | 长按菜单项时调用的回调函数。 |
| `leading` | `Widget?` | 显示在菜单项内容前面的小部件。 |
| `trailing` | `Widget?` | 显示在菜单项内容后面的小部件。 |
| `variant` | `ShadButtonVariant?` | 菜单项的变体。默认为 `ShadButtonVariant.ghost`。 |
| `size` | `ShadButtonSize?` | 菜单项的大小。 |
| `cursor` | `MouseCursor?` | 悬停在菜单项上时显示的光标。 |
| `width` | `double?` | 菜单项的宽度。 |
| `height` | `double?` | 菜单项的高度。 |
| `buttonPadding` | `EdgeInsetsGeometry?` | 菜单项按钮的内边距。 |
| `backgroundColor` | `Color?` | 菜单项的背景颜色。 |
| `selectedBackgroundColor` | `Color?` | 菜单项选中时的背景颜色。 |
| `hoverBackgroundColor` | `Color?` | 悬停时菜单项的背景颜色。 |
| `foregroundColor` | `Color?` | 菜单项的前景颜色。 |
| `hoverForegroundColor` | `Color?` | 悬停时菜单项的前景颜色。 |
| `enabled` | `bool` | 菜单项是否启用。默认为 `true`。 |

#### ShadContextMenuItem 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 上下文菜单项的内容小部件，通常是 `Text` 小部件。 |
| `items` | `Iterable<Widget>?` | 上下文菜单项的子项目列表，用于创建嵌套菜单。 |
| `leading` | `Widget?` | 显示在上下文菜单项内容前面的小部件。 |
| `trailing` | `Widget?` | 显示在上下文菜单项内容后面的小部件。 |
| `onPressed` | `VoidCallback?` | 点击上下文菜单项时调用的回调函数。 |
| `enabled` | `bool` | 上下文菜单项是否启用。默认为 `true`。 |
| `inset` | `bool` | 是否对上下文菜单项应用缩进。默认为 `false`。 |

### Popover 弹出框

Popover（弹出框）组件用于在门户中显示丰富的内容，由按钮触发。

#### 基本用法

```dart
class PopoverExample extends StatefulWidget {
  const PopoverExample({super.key});

  @override
  State<PopoverExample> createState() => _PopoverExampleState();
}

class _PopoverExampleState extends State<PopoverExample> {
  final popoverController = ShadPopoverController();

  final List<({String name, String initialValue})> layer = [
    (name: '宽度', initialValue: '100%'),
    (name: '最大宽度', initialValue: '300px'),
    (name: '高度', initialValue: '25px'),
    (name: '最大高度', initialValue: 'none'),
  ];

  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: ShadPopover(
          controller: popoverController,
          popover: (context) => SizedBox(
            width: 288,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '尺寸',
                  style: textTheme.h4,
                ),
                Text(
                  '设置图层的尺寸。',
                  style: textTheme.p,
                ),
                const SizedBox(height: 4),
                ...layer
                    .map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              e.name,
                              textAlign: TextAlign.start,
                            )),
                            Expanded(
                              flex: 2,
                              child: ShadInput(
                                initialValue: e.initialValue,
                              ),
                            )
                          ],
                        ))
                    .toList(),
              ],
            ),
          ),
          child: ShadButton.outline(
            onPressed: popoverController.toggle,
            child: const Text('打开弹出框'),
          ),
        ),
      ),
    );
  }
}
```

#### ShadPopoverController 方法

| 方法 | 描述 |
|------|------|
| `show()` | 显示弹出框。 |
| `hide()` | 隐藏弹出框。 |
| `toggle()` | 切换弹出框的可见性。 |
| `setOpen(bool open)` | 设置弹出框的可见性。 |

#### ShadPopover 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 触发弹出框的子小部件。 |
| `popover` | `WidgetBuilder` | 用于构建弹出框内容的函数。 |
| `controller` | `ShadPopoverController?` | 用于控制弹出框可见性的控制器。必须提供 `controller` 或 `visible`。 |
| `visible` | `bool?` | 弹出框是否可见。必须提供 `controller` 或 `visible`。 |
| `closeOnTapOutside` | `bool` | 当用户点击外部时是否关闭弹出框。默认为 `true`。 |
| `focusNode` | `FocusNode?` | 子小部件的焦点节点，当聚焦时显示弹出框。 |
| `anchor` | `ShadAnchorBase?` | 弹出框的锚点位置。默认为 `ShadAnchorAuto()`。 |
| `effects` | `List<Effect<dynamic>>?` | 应用于弹出框的动画效果列表。默认为淡入、缩放和移动效果。 |
| `shadows` | `List<BoxShadow>?` | 弹出框的阴影列表。 |
| `padding` | `EdgeInsetsGeometry?` | 弹出框的内边距。默认为 `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`。 |
| `decoration` | `ShadDecoration?` | 弹出框的装饰。 |
| `filter` | `ImageFilter?` | 弹出框的图像滤镜。 |
| `groupId` | `Object?` | 弹出框的组标识符，默认为 `UniqueKey()`。用于确定点击是否在弹出框内。 |
| `areaGroupId` | `Object?` | 鼠标区域的组标识符。 |
| `useSameGroupIdForChild` | `bool` | 是否应将 `groupId` 用于子小部件。默认为 `true`。这意味着对子小部件的点击将被处理为在弹出框内。 |

### Portal 门户

Portal（门户）组件是一个底层组件，用于将内容渲染到小部件树中的不同位置，通常用于实现弹出式组件。

#### 基本用法

```dart
class PortalExample extends StatefulWidget {
  const PortalExample({super.key});

  @override
  State<PortalExample> createState() => _PortalExampleState();
}

class _PortalExampleState extends State<PortalExample> {
  var visible = false;

  @override
  Widget build(BuildContext context) {
    return ShadPortal(
      anchor: ShadAnchorAuto(),
      visible: visible,
      portalBuilder: (context) {
        return Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: const Text('门户内容'),
        );
      },
      child: ShadButton(
        onPressed: () {
          setState(() {
            visible = !visible;
          });
        },
        child: const Text('切换门户可见性'),
      ),
    );
  }
}
```

#### 使用不同的锚点

```dart
// 自动锚点（根据内容自动调整位置）
ShadAnchorAuto(
  followerAnchor: Alignment.topCenter,  // 门户内容的锚点
  targetAnchor: Alignment.bottomCenter, // 目标元素的锚点
  offset: const Offset(0, 8),          // 偏移量
)

// 手动锚点（手动指定位置）
ShadAnchor(
  childAlignment: Alignment.topLeft,    // 门户内容的锚点
  overlayAlignment: Alignment.bottomLeft, // 目标元素的锚点
  offset: const Offset(0, 8),          // 偏移量
)

// 全局锚点（使用全局坐标）
ShadGlobalAnchor(
  Offset(100, 100),                    // 全局坐标位置
)
```

#### ShadPortal 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 触发门户的子小部件。 |
| `portalBuilder` | `WidgetBuilder` | 用于构建门户内容的函数。 |
| `visible` | `bool` | 门户是否可见。 |
| `anchor` | `ShadAnchorBase` | 门户内容的锚点位置。 |

#### ShadAnchorBase 类型

| 类型 | 描述 |
|------|------|
| `ShadAnchorAuto` | 自动调整门户内容的位置，根据目标元素的位置和指定的锚点。 |
| `ShadAnchor` | 手动指定门户内容的位置，使用对齐方式和偏移量。 |
| `ShadGlobalAnchor` | 使用全局坐标指定门户内容的位置。 |

### Progress 进度条

Progress（进度条）组件用于显示任务完成进度的指示器，通常显示为进度条。

#### 基本用法

```dart
// 确定性进度条（显示具体进度）
ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: MediaQuery.sizeOf(context).width * 0.6,
  ),
  child: const ShadProgress(value: 0.5),
)

// 不确定性进度条（显示动画）
ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: MediaQuery.sizeOf(context).width * 0.6,
  ),
  child: const ShadProgress(),
)
```

#### 可调节的进度条

```dart
class ProgressExample extends StatefulWidget {
  const ProgressExample({super.key});

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  var value = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadProgress(
          value: value / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadIconButton.ghost(
              enabled: value != 0,
              onPressed: () => setState(() => value -= 10),
              icon: const Icon(Icons.remove),
            ),
            ShadIconButton.ghost(
              enabled: value != 100,
              onPressed: () => setState(() => value += 10),
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
```

#### ShadProgress 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `double?` | 进度值，范围从 0.0 到 1.0。如果为 null，则显示不确定的进度动画。 |
| `backgroundColor` | `Color?` | 进度条的背景颜色。如果未指定，默认为主题的次要颜色。 |
| `color` | `Color?` | 进度指示器本身的颜色。如果未指定，默认为主题的主要颜色。如果设置了 `valueColor`，则会被覆盖。 |
| `valueColor` | `Animation<Color?>?` | 进度指示器的动画颜色值。如果提供，则覆盖 `color`。 |
| `minHeight` | `double?` | 进度条的最小高度。如果未指定，默认为 16。 |
| `semanticsLabel` | `String?` | 进度条的无障碍标签，为屏幕阅读器提供上下文。 |
| `semanticsValue` | `String?` | 进度条的无障碍值（例如百分比），为屏幕阅读器提供当前进度。 |
| `borderRadius` | `BorderRadius?` | 进度条外部容器的边框半径。如果未指定，默认为圆形半径 16。 |
| `innerBorderRadius` | `BorderRadius?` | 进度指示器本身的边框半径。如果未指定，默认为零（尖边）。 |

#### ShadRadioGroupFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符。 |
| `items` | `Iterable<Widget>` | 单选按钮组的项目，通常是 `ShadRadio` 小部件列表。 |
| `initialValue` | `T?` | 单选按钮组的初始值。 |
| `label` | `Widget?` | 单选按钮组的标签。 |
| `error` | `Widget?` | 单选按钮组的错误消息。 |
| `description` | `Widget?` | 单选按钮组的描述。 |
| `onChanged` | `ValueChanged<T?>?` | 当选择变化时调用的回调函数。 |
| `validator` | `String? Function(T?)?` | 用于验证选择值的函数。 |
| `enabled` | `bool` | 单选按钮组是否启用。默认为 `true`。 |
| `valueTransformer` | `dynamic Function(T?)?` | 在保存表单前转换值的函数。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |

### RadioGroup 单选按钮组

RadioGroup（单选按钮组）组件是一组可选择的按钮，其中同一时间只能选中一个按钮。

#### 基本用法

```dart
ShadRadioGroup<String>(
  items: [
    ShadRadio(
      label: Text('默认'),
      value: 'default',
    ),
    ShadRadio(
      label: Text('舒适'),
      value: 'comfortable',
    ),
    ShadRadio(
      label: Text('无'),
      value: 'nothing',
    ),
  ],
),
```

#### 使用枚举的单选按钮组

```dart
enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => '所有新消息',
      mentions => '直接消息和提及',
      nothing => '无',
    };
  }
}

ShadRadioGroup<NotifyAbout>(
  enabled: enabled,
  initialValue: value,
  onChanged: (v) {
    print('onChange $v');
  },
  axis: Axis.vertical,
  items: NotifyAbout.values.map(
    (e) => ShadRadio(
      value: e,
      label: Text(e.message),
    ),
  ),
),
```

#### 在表单中使用单选按钮组

```dart
ShadRadioGroupFormField(
  id: 'notify',
  enabled: enabled,
  initialValue: initialValue,
  valueTransformer: (value) => value?.name,
  items: NotifyAbout.values.map(
    (e) => ShadRadio(
      value: e,
      label: Text(e.message),
    ),
  ),
  label: const Text('通知我关于'),
  validator: (v) {
    if (v == null) {
      return '您需要选择一种通知类型。';
    }
    return null;
  },
),
```

#### ShadRadioGroup 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `items` | `Iterable<Widget>` | 单选按钮组的项目，通常是 `ShadRadio` 小部件列表。 |
| `initialValue` | `T?` | 单选按钮组的初始值。 |
| `onChanged` | `ValueChanged<T?>?` | 用户切换单选按钮时调用的回调函数。 |
| `enabled` | `bool` | 单选按钮组是否启用。默认为 `true`。 |
| `axis` | `Axis?` | 单选按钮组的轴向。默认为 `Axis.vertical`。 |
| `spacing` | `double?` | 单选按钮之间的间距。 |
| `runSpacing` | `double?` | 当单选按钮组换行时，行与行之间的间距。 |
| `alignment` | `WrapAlignment?` | 单选按钮组的对齐方式。 |
| `runAlignment` | `WrapAlignment?` | 单选按钮组的行对齐方式。 |
| `crossAxisAlignment` | `WrapCrossAlignment?` | 单选按钮组的交叉轴对齐方式。 |

#### ShadRadio 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `T` | 单选按钮的值。 |
| `enabled` | `bool` | 单选按钮是否启用。默认为 `true`。 |
| `focusNode` | `FocusNode?` | 用于控制单选按钮焦点的焦点节点。 |
| `decoration` | `ShadDecoration?` | 单选按钮的装饰。 |
| `size` | `double?` | 单选按钮的大小。 |
| `circleSize` | `double?` | 单选按钮内部圆圈的大小。 |
| `duration` | `Duration?` | 单选按钮动画的持续时间。 |
| `color` | `Color?` | 单选按钮选中时的颜色。 |
| `label` | `Widget?` | 单选按钮的标签。 |
| `padding` | `EdgeInsets?` | 单选按钮与标签之间的内边距。 |
| `direction` | `TextDirection?` | 单选按钮和标签的文本方向。 |

### Resizable 可调整面板

Resizable（可调整面板）组件用于创建可调整大小的面板组和布局，允许用户通过拖动分隔线来调整面板大小。

#### 基本用法

```dart
ConstrainedBox(
  constraints: const BoxConstraints(maxHeight: 200),
  child: DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: theme.radius,
      border: Border.all(
        color: theme.colorScheme.border,
      ),
    ),
    child: ClipRRect(
      borderRadius: theme.radius,
      child: ShadResizablePanelGroup(
        showHandle: true,
        children: [
          ShadResizablePanel(
            id: 0,
            defaultSize: .5,
            minSize: .2,
            child: Center(
              child: Text('侧边栏', style: theme.textTheme.large),
            ),
          ),
          ShadResizablePanel(
            id: 1,
            defaultSize: .5,
            minSize: .2,
            child: Center(
              child: Text('内容区', style: theme.textTheme.large),
            ),
          ),
        ],
      ),
    ),
  ),
)
```

#### 垂直布局

```dart
ConstrainedBox(
  constraints: const BoxConstraints(maxHeight: 200),
  child: DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: theme.radius,
      border: Border.all(
        color: theme.colorScheme.border,
      ),
    ),
    child: ClipRRect(
      borderRadius: theme.radius,
      child: ShadResizablePanelGroup(
        axis: Axis.vertical,
        children: [
          ShadResizablePanel(
            id: 0,
            defaultSize: 0.3,
            minSize: 0.1,
            child: Center(
              child: Text('顶部', style: theme.textTheme.large),
            ),
          ),
          ShadResizablePanel(
            id: 1,
            defaultSize: 0.7,
            minSize: 0.1,
            child: Center(
              child: Text('底部', style: theme.textTheme.large),
            ),
          ),
        ],
      ),
    ),
  ),
)
```

#### 嵌套布局

```dart
ShadResizablePanelGroup(
  mainAxisSize: MainAxisSize.min,
  showHandle: true,
  children: [
    ShadResizablePanel(
      id: 0,
      defaultSize: .5,
      minSize: 0.1,
      maxSize: 0.8,
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Text('一', style: theme.textTheme.large),
      ),
    ),
    ShadResizablePanel(
      defaultSize: 0.5,
      id: 1,
      child: ShadResizablePanelGroup(
        axis: Axis.vertical,
        showHandle: true,
        children: [
          ShadResizablePanel(
            id: 0,
            defaultSize: 0.4,
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('二', style: theme.textTheme.large),
            ),
          ),
          ShadResizablePanel(
            id: 1,
            defaultSize: 0.6,
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: Text('三', style: theme.textTheme.large),
            ),
          ),
        ],
      ),
    ),
  ],
)
```

#### ShadResizablePanelGroup 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `children` | `List<ShadResizablePanel>` | 可调整面板组的子面板列表。 |
| `axis` | `Axis` | 面板组的排列方向。默认为 `Axis.horizontal`。 |
| `mainAxisAlignment` | `MainAxisAlignment?` | 面板组在主轴上的对齐方式。 |
| `crossAxisAlignment` | `CrossAxisAlignment?` | 面板组在交叉轴上的对齐方式。 |
| `mainAxisSize` | `MainAxisSize?` | 面板组在主轴上的大小。 |
| `controller` | `ShadResizableController?` | 用于控制面板组大小的控制器。 |
| `showHandle` | `bool?` | 是否显示分隔线上的拖动手柄。默认为 `false`。 |
| `handleIconData` | `IconData?` | 手柄的图标数据。 |
| `handleIcon` | `Widget?` | 手柄的自定义图标小部件。 |
| `dividerSize` | `double?` | 分隔线的大小。默认为 8.0。 |
| `dividerThickness` | `double?` | 分隔线的粗细。默认为 1.0。 |
| `onDividerDoubleTap` | `void Function(int)?` | 双击分隔线时调用的回调函数。 |
| `resetOnDoubleTap` | `bool?` | 是否在双击分隔线时重置面板大小。默认为 `true`。 |
| `dividerColor` | `Color?` | 分隔线的颜色。默认为主题的边框颜色。 |
| `handleDecoration` | `ShadDecoration?` | 手柄的装饰。 |
| `handlePadding` | `EdgeInsets?` | 手柄的内边距。 |
| `handleSize` | `double?` | 手柄的大小。 |

#### ShadResizablePanel 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 面板的唯一标识符。 |
| `child` | `Widget` | 面板的内容小部件。 |
| `defaultSize` | `double` | 面板的默认大小，表示为可用空间的比例（0.0 到 1.0）。 |
| `minSize` | `double` | 面板的最小大小，表示为可用空间的比例。默认为 0.0。 |
| `maxSize` | `double` | 面板的最大大小，表示为可用空间的比例。默认为 1.0。 |

#### ShadResizableController 方法

| 方法 | 描述 |
|------|------|
| `registerPanel(ShadPanelInfo info)` | 注册一个新面板并返回其索引。 |
| `insertPanel(int index, ShadPanelInfo info)` | 在指定索引处插入一个新面板。 |
| `getPanelInfo(int index)` | 获取指定索引处的面板信息。 |
| `resize({required int index, required double size})` | 调整指定索引处面板的大小。 |
| `reset()` | 将所有面板重置为默认大小。 |

### Select 选择器

Select（选择器）组件用于显示一个选项列表，供用户选择，由按钮触发。

#### 基本用法

```dart
final fruits = {
  'apple': '苹果',
  'banana': '香蕉',
  'blueberry': '蓝莓',
  'grapes': '葡萄',
  'pineapple': '菠萝',
};

ShadSelect<String>(
  placeholder: const Text('选择水果'),
  options: [
    Padding(
      padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
      child: Text(
        '水果',
        style: theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.popoverForeground,
        ),
        textAlign: TextAlign.start,
      ),
    ),
    ...fruits.entries
        .map((e) => ShadOption(value: e.key, child: Text(e.value))),
  ],
  selectedOptionBuilder: (context, value) => Text(fruits[value]!),
  onChanged: print,
)
```

#### 多选选择器

```dart
ShadSelect<String>.multiple(
  minWidth: 340,
  onChanged: print,
  enabled: enabled,
  allowDeselection: true,
  placeholder: const Text('选择多个水果'),
  closeOnSelect: false,
  options: [
    Padding(
      padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
      child: Text(
        '水果',
        style: theme.textTheme.large,
        textAlign: TextAlign.start,
      ),
    ),
    ...fruits.entries.map(
      (e) => ShadOption(
        value: e.key,
        child: Text(e.value),
      ),
    ),
  ],
  selectedOptionsBuilder: (context, values) =>
      Text(values.map((v) => fruits[v]!).join(', ')),
)
```

#### 在表单中使用选择器

```dart
// 单选表单字段
ShadSelectFormField(
  id: 'framework',
  label: const Text('框架'),
  placeholder: const Text('选择您喜欢的框架'),
  options: frameworks.entries
      .map((e) => ShadOption(value: e.key, child: Text(e.value)))
      .toList(),
  selectedOptionBuilder: (context, value) => Text(frameworks[value]!),
  validator: (v) {
    if (v == null) {
      return '请选择一个框架';
    }
    return null;
  },
)

// 多选表单字段
ShadSelectMultipleFormField(
  id: 'languages',
  label: const Text('编程语言'),
  placeholder: const Text('选择您熟悉的编程语言'),
  options: languages.entries
      .map((e) => ShadOption(value: e.key, child: Text(e.value)))
      .toList(),
  selectedOptionsBuilder: (context, values) =>
      Text(values.map((v) => languages[v]!).join(', ')),
  validator: (v) {
    if (v == null || v.isEmpty) {
      return '请至少选择一种编程语言';
    }
    return null;
  },
)
```

#### ShadSelect 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadSelectVariant` | 选择器的变体，可以是 `primary`（主要）、`search`（搜索）、`multiple`（多选）或 `multipleWithSearch`（带搜索的多选）。 |
| `options` | `Iterable<Widget>?` | 选择器的选项列表。必须提供 `options` 或 `optionsBuilder`。 |
| `optionsBuilder` | `Widget? Function(BuildContext, int)?` | 用于构建选项的函数。必须提供 `options` 或 `optionsBuilder`。 |
| `selectedOptionBuilder` | `ShadSelectedOptionBuilder<T>` | 用于构建选中选项显示的函数。在单选模式下使用。 |
| `selectedOptionsBuilder` | `ShadSelectedOptionsBuilder<T>` | 用于构建多个选中选项显示的函数。在多选模式下使用。 |
| `popoverController` | `ShadPopoverController?` | 用于控制选项弹出框的控制器。 |
| `enabled` | `bool` | 选择器是否启用。默认为 `true`。 |
| `placeholder` | `Widget?` | 未选择选项时显示的占位符。 |
| `initialValue` | `T?` | 选择器的初始值（单选模式）。 |
| `initialValues` | `List<T>` | 选择器的初始值列表（多选模式）。默认为空列表。 |
| `onChanged` | `ValueChanged<T?>?` | 单选模式下，选择变化时调用的回调函数。 |
| `onMultipleChanged` | `ValueChanged<List<T>>?` | 多选模式下，选择变化时调用的回调函数。 |
| `focusNode` | `FocusNode?` | 用于控制选择器焦点的焦点节点。 |
| `closeOnTapOutside` | `bool` | 点击外部时是否关闭选项弹出框。默认为 `true`。 |
| `minWidth` | `double?` | 选择器的最小宽度。 |
| `maxWidth` | `double?` | 选择器的最大宽度。 |
| `maxHeight` | `double?` | 选项弹出框的最大高度。 |
| `decoration` | `ShadDecoration?` | 选择器的装饰。 |
| `trailing` | `Widget?` | 显示在选择器右侧的小部件。 |
| `padding` | `EdgeInsets?` | 选择器的内边距。 |
| `optionsPadding` | `EdgeInsets?` | 选项列表的内边距。 |
| `closeOnSelect` | `bool` | 选择选项后是否关闭选项弹出框。默认为 `true`。 |
| `allowDeselection` | `bool` | 是否允许取消选择选项。默认为 `false`（单选模式）或 `true`（多选模式）。 |
| `search` | `String?` | 搜索模式下的搜索文本。 |
| `onSearchChanged` | `ValueChanged<String>?` | 搜索文本变化时调用的回调函数。 |
| `searchPlaceholder` | `Widget?` | 搜索输入框的占位符。 |
| `searchInputPrefix` | `Widget?` | 搜索输入框的前缀小部件。 |
| `searchInputLeading` | `Widget?` | 搜索输入框的前置小部件。 |
| `searchDivider` | `Widget?` | 搜索输入框和选项列表之间的分隔线。 |
| `searchPadding` | `EdgeInsets?` | 搜索输入框的内边距。 |
| `clearSearchOnClose` | `bool` | 关闭选项弹出框时是否清除搜索文本。默认为 `false`。 |
| `header` | `Widget?` | 显示在选项列表顶部的小部件。 |
| `footer` | `Widget?` | 显示在选项列表底部的小部件。 |

#### ShadOption 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `T` | 选项的值。 |
| `child` | `Widget` | 选项的内容小部件。 |
| `selectedIcon` | `Widget?` | 选项选中时显示的图标。 |
| `padding` | `EdgeInsets?` | 选项的内边距。 |
| `radius` | `BorderRadius?` | 选项的边框半径。 |
| `hoveredBackgroundColor` | `Color?` | 悬停时选项的背景颜色。 |
| `direction` | `TextDirection?` | 选项内容的文本方向。 |
| `orderPolicy` | `OrderPolicy?` | 选项内容的排序策略。 |

#### ShadSelectFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符。 |
| `selectedOptionBuilder` | `ShadSelectedOptionBuilder<T>` | 用于构建选中选项显示的函数。 |
| `options` | `Iterable<Widget>?` | 选择器的选项列表。 |
| `optionsBuilder` | `Widget? Function(BuildContext, int)?` | 用于构建选项的函数。 |
| `placeholder` | `Widget?` | 未选择选项时显示的占位符。 |
| `initialValue` | `T?` | 选择器的初始值。 |
| `label` | `Widget?` | 选择器的标签。 |
| `error` | `Widget?` | 选择器的错误消息。 |
| `description` | `Widget?` | 选择器的描述。 |
| `onChanged` | `ValueChanged<T?>?` | 选择变化时调用的回调函数。 |
| `validator` | `String? Function(T?)?` | 用于验证选择值的函数。 |
| `enabled` | `bool` | 选择器是否启用。默认为 `true`。 |
| `allowDeselection` | `bool` | 是否允许取消选择选项。默认为 `false`。 |
| `closeOnSelect` | `bool` | 选择选项后是否关闭选项弹出框。默认为 `true`。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |
| `controller` | `ShadSelectController<T>?` | 用于控制选择器的控制器。现在可以正确地更新父 `ShadForm`。 |

#### ShadSelectMultipleFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符。 |
| `selectedOptionsBuilder` | `ShadSelectedOptionsBuilder<T>` | 用于构建多个选中选项显示的函数。 |
| `options` | `Iterable<Widget>?` | 选择器的选项列表。 |
| `optionsBuilder` | `Widget? Function(BuildContext, int)?` | 用于构建选项的函数。 |
| `placeholder` | `Widget?` | 未选择选项时显示的占位符。 |
| `initialValues` | `List<T>` | 选择器的初始值列表。默认为空列表。 |
| `label` | `Widget?` | 选择器的标签。 |
| `error` | `Widget?` | 选择器的错误消息。 |
| `description` | `Widget?` | 选择器的描述。 |
| `onChanged` | `ValueChanged<List<T>>?` | 选择变化时调用的回调函数。 |
| `validator` | `String? Function(List<T>?)?` | 用于验证选择值列表的函数。 |
| `enabled` | `bool` | 选择器是否启用。默认为 `true`。 |
| `closeOnSelect` | `bool` | 选择选项后是否关闭选项弹出框。默认为 `false`。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |
| `controller` | `ShadSelectMultipleController<T>?` | 用于控制多选选择器的控制器。现在可以正确地更新父 `ShadForm`。 |

### Sheet 底部弹出层

Sheet（底部弹出层）组件是一个可从屏幕边缘滑入的内容面板，用于补充屏幕主要内容。

#### 基本用法

```dart
ShadButton.outline(
  child: const Text('打开'),
  onPressed: () {
    showShadSheet(
      context: context,
      side: ShadSheetSide.bottom,
      builder: (context) {
        return ShadSheet(
          title: const Text('编辑个人资料'),
          description: const Text('在此处更改您的个人资料。完成后点击保存'),
          actions: const [ShadButton(child: Text('保存更改'))],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '用户名',
                        textAlign: TextAlign.end,
                        style: theme.textTheme.small,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 5,
                      child: ShadInput(initialValue: 'zhangsan'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  },
)
```

#### 不同方向的弹出层

```dart
// 从顶部滑入
showShadSheet(
  side: ShadSheetSide.top,
  context: context,
  builder: (context) => ShadSheet(
    title: const Text('从顶部滑入'),
    // ...其他属性
  ),
)

// 从底部滑入
showShadSheet(
  side: ShadSheetSide.bottom,
  context: context,
  builder: (context) => ShadSheet(
    title: const Text('从底部滑入'),
    // ...其他属性
  ),
)

// 从左侧滑入
showShadSheet(
  side: ShadSheetSide.left,
  context: context,
  builder: (context) => ShadSheet(
    constraints: const BoxConstraints(maxWidth: 512),
    title: const Text('从左侧滑入'),
    // ...其他属性
  ),
)

// 从右侧滑入
showShadSheet(
  side: ShadSheetSide.right,
  context: context,
  builder: (context) => ShadSheet(
    constraints: const BoxConstraints(maxWidth: 512),
    title: const Text('从右侧滑入'),
    // ...其他属性
  ),
)
```

#### showShadSheet 函数参数

| 参数 | 类型 | 描述 |
|------|------|------|
| `context` | `BuildContext` | 构建弹出层的上下文。 |
| `builder` | `WidgetBuilder` | 用于构建弹出层内容的函数。 |
| `side` | `ShadSheetSide?` | 弹出层滑入的方向，可以是 `top`（顶部）、`bottom`（底部）、`left`（左侧）或 `right`（右侧）。默认为 `bottom`。 |
| `backgroundColor` | `Color?` | 弹出层的背景颜色。 |
| `barrierLabel` | `String` | 屏障的语义标签，用于无障碍访问。默认为空字符串。 |
| `shape` | `ShapeBorder?` | 弹出层的形状。 |
| `barrierColor` | `Color` | 屏障的颜色。默认为半透明黑色。 |
| `useRootNavigator` | `bool` | 是否使用根导航器。默认为 `false`。 |
| `isDismissible` | `bool` | 是否可以通过点击屏障来关闭弹出层。默认为 `true`。 |
| `routeSettings` | `RouteSettings?` | 路由设置。 |
| `anchorPoint` | `Offset?` | 弹出层的锚点位置。 |
| `animateIn` | `List<Effect<dynamic>>?` | 弹出层显示时的动画效果列表。 |
| `animateOut` | `List<Effect<dynamic>>?` | 弹出层关闭时的动画效果列表。 |

#### ShadSheet 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `title` | `Widget?` | 弹出层的标题小部件，通常显示在顶部。 |
| `description` | `Widget?` | 弹出层的描述小部件，提供标题下方的更多上下文。 |
| `child` | `Widget?` | 弹出层的主要内容。 |
| `actions` | `List<Widget>` | 操作小部件列表，通常是按钮，显示在弹出层的底部或侧面。默认为空列表。 |
| `constraints` | `BoxConstraints?` | 弹出层的大小约束。 |
| `expandCrossSide` | `bool?` | 是否在交叉轴方向上扩展弹出层。默认为 `true`。 |
| `closeIcon` | `Widget?` | 关闭图标的自定义小部件。 |
| `closeIconData` | `IconData?` | 关闭图标的图标数据。 |
| `closeIconPosition` | `ShadPosition?` | 关闭图标的位置。 |
| `radius` | `BorderRadius?` | 弹出层的边框半径。 |
| `backgroundColor` | `Color?` | 弹出层的背景颜色。 |
| `expandActionsWhenTiny` | `bool?` | 当弹出层很小时是否扩展操作按钮。默认为 `true`。 |
| `padding` | `EdgeInsets?` | 弹出层的内边距。 |
| `gap` | `double?` | 弹出层内容元素之间的间距。 |
| `actionsAxis` | `Axis?` | 操作按钮的排列方向。 |
| `border` | `BoxBorder?` | 弹出层的边框。 |
| `shadows` | `List<BoxShadow>?` | 弹出层的阴影列表。 |
| `draggable` | `bool?` | 弹出层是否可拖动关闭。默认为 `false`。 |
| `isScrollControlled` | `bool?` | 弹出层是否由滚动控制。默认为 `false`。 |
| `scrollable` | `bool?` | 弹出层内容是否可滚动。默认为 `false`。 |
| `scrollPadding` | `EdgeInsets?` | 当内容可滚动时的内边距。 |

### Separator 分隔线

Separator（分隔线）组件用于在视觉上或语义上分隔内容。

#### 基本用法

```dart
// 水平分隔线
const ShadSeparator.horizontal(
  thickness: 4,
  margin: EdgeInsets.symmetric(horizontal: 20),
  radius: BorderRadius.all(Radius.circular(4)),
)

// 垂直分隔线
const ShadSeparator.vertical(
  thickness: 4,
  margin: EdgeInsets.symmetric(vertical: 20),
  radius: BorderRadius.all(Radius.circular(4)),
)
```

#### 应用示例

```dart
IntrinsicHeight(
  child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('左侧内容', style: theme.textTheme.h4),
      ShadSeparator.vertical(
        thickness: 1,
        margin: EdgeInsets.all(8),
        radius: BorderRadius.all(Radius.circular(2)),
      ),
      Text('右侧内容', style: theme.textTheme.h4),
    ],
  ),
)
```

#### ShadSeparator 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadSeparatorVariant` | 分隔线的变体，可以是 `vertical`（垂直）或 `horizontal`（水平）。 |
| `margin` | `EdgeInsets?` | 分隔线周围的边距（或空间）。如果未指定，则使用主题的 `verticalMargin` 或 `horizontalMargin`。 |
| `thickness` | `double?` | 分隔线的粗细。控制水平分隔线的高度和垂直分隔线的宽度。如果未指定，默认为 1。 |
| `color` | `Color?` | 分隔线的颜色。如果未指定，默认为主题的边框颜色。 |
| `radius` | `BorderRadiusGeometry?` | 分隔线边框的半径。如果未指定，则使用 `BoxDecoration` 的默认半径。 |

### Slider 滑块

Slider（滑块）组件是一个输入控件，允许用户从给定范围内选择一个值。

#### 基本用法

```dart
ShadSlider(
  initialValue: 33,
  max: 100,
  onChanged: (value) => print('Selected value: $value'),
)
```

#### 可控制的滑块

```dart
class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  var enabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadSlider(
          initialValue: 33,
          max: 100,
          enabled: enabled,
          onChanged: print,
        ),
        ShadCheckbox(
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
          label: const Text('启用滑块'),
        ),
      ],
    );
  }
}
```

#### 使用控制器

```dart
class SliderWithController extends StatefulWidget {
  const SliderWithController({super.key});

  @override
  State<SliderWithController> createState() => _SliderWithControllerState();
}

class _SliderWithControllerState extends State<SliderWithController> {
  late final controller = ShadSliderController(initialValue: 50);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadSlider(
          controller: controller,
          max: 100,
          onChanged: (value) => print('Value: $value'),
        ),
        ShadButton(
          onPressed: () => controller.value = 75,
          child: const Text('设置为 75'),
        ),
      ],
    );
  }
}
```

#### ShadSlider 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `initialValue` | `double?` | 滑块的初始值。当 `controller` 为 null 时使用。 |
| `controller` | `ShadSliderController?` | 用于控制滑块值的控制器。如果提供，则忽略 `initialValue`。 |
| `onChanged` | `ValueChanged<double>?` | 滑块值变化时调用的回调函数。 |
| `enabled` | `bool` | 滑块是否启用。默认为 `true`。 |
| `min` | `double?` | 滑块的最小值。默认为 0.0。 |
| `max` | `double?` | 滑块的最大值。默认为 1.0。 |
| `focusNode` | `FocusNode?` | 用于控制滑块焦点的焦点节点。 |
| `autofocus` | `bool` | 滑块是否在构建时自动获得焦点。默认为 `false`。 |
| `mouseCursor` | `MouseCursor?` | 悬停在滑块上时显示的光标。默认为 `SystemMouseCursors.click`。 |
| `disabledMouseCursor` | `MouseCursor?` | 滑块禁用时显示的光标。默认为 `SystemMouseCursors.forbidden`。 |
| `thumbColor` | `Color?` | 滑块滑块的颜色。默认为主题的背景颜色。 |
| `disabledThumbColor` | `Color?` | 滑块禁用时滑块的颜色。 |
| `thumbBorderColor` | `Color?` | 滑块滑块边框的颜色。默认为主题的主要颜色。 |
| `disabledThumbBorderColor` | `Color?` | 滑块禁用时滑块边框的颜色。 |
| `activeTrackColor` | `Color?` | 滑块活动部分轨道的颜色。默认为主题的主要颜色。 |
| `inactiveTrackColor` | `Color?` | 滑块非活动部分轨道的颜色。默认为主题的次要颜色。 |
| `disabledActiveTrackColor` | `Color?` | 滑块禁用时活动部分轨道的颜色。 |
| `disabledInactiveTrackColor` | `Color?` | 滑块禁用时非活动部分轨道的颜色。 |
| `trackHeight` | `double?` | 滑块轨道的高度。默认为 8.0。 |
| `thumbRadius` | `double?` | 滑块滑块的半径。默认为 10.0。 |
| `onChangeStart` | `ValueChanged<double>?` | 用户开始改变滑块值时调用的回调函数。 |
| `onChangeEnd` | `ValueChanged<double>?` | 用户完成改变滑块值时调用的回调函数。 |
| `divisions` | `int?` | 滑块的离散分割数。当提供时，滑块将贴合到这些分割。 |
| `label` | `String?` | 当滑块滑块被按下时在滑块上方显示的标签。 |
| `semanticFormatterCallback` | `SemanticFormatterCallback?` | 由辅助技术调用的语义格式化器。 |
| `allowedInteraction` | `SliderInteraction?` | 配置用户如何与滑块交互。默认为 `SliderInteraction.continuous`。 |

### Table 表格

Table（表格）组件是一个响应式表格，用于显示结构化的表格数据。

#### 基本用法

```dart
// 使用列表创建表格（适用于小型表格）
const invoices = [
  [
    "INV001",
    "Paid",
    "Credit Card",
    r"$250.00",
  ],
  [
    "INV002",
    "Pending",
    "PayPal",
    r"$150.00",
  ],
  // 更多数据...
];

ShadTable.list(
  header: const [
    ShadTableCell.header(child: Text('发票')),
    ShadTableCell.header(child: Text('状态')),
    ShadTableCell.header(child: Text('方式')),
    ShadTableCell.header(
      alignment: Alignment.centerRight,
      child: Text('金额'),
    ),
  ],
  footer: const [
    ShadTableCell.footer(child: Text('总计')),
    ShadTableCell.footer(child: Text('')),
    ShadTableCell.footer(child: Text('')),
    ShadTableCell.footer(
      alignment: Alignment.centerRight,
      child: Text(r'$2500.00'),
    ),
  ],
  columnSpanExtent: (index) {
    if (index == 2) return const FixedTableSpanExtent(130);
    if (index == 3) {
      return const MaxTableSpanExtent(
        FixedTableSpanExtent(120),
        RemainingTableSpanExtent(),
      );
    }
    return null;
  },
  children: invoices.map(
    (invoice) => [
      ShadTableCell(
        child: Text(
          invoice[0],
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      ShadTableCell(child: Text(invoice[1])),
      ShadTableCell(child: Text(invoice[2])),
      ShadTableCell(
        alignment: Alignment.centerRight,
        child: Text(invoice[3]),
      ),
    ],
  ),
)
```

#### 使用构建器创建表格（适用于大型表格）

```dart
const invoices = [
  [
    "INV001",
    "Paid",
    "Credit Card",
    r"$250.00",
  ],
  // 更多数据...
];

final headings = [
  '发票',
  '状态',
  '方式',
  '金额',
];

ShadTable(
  columnCount: invoices[0].length,
  rowCount: invoices.length,
  header: (context, column) {
    final isLast = column == headings.length - 1;
    return ShadTableCell.header(
      alignment: isLast ? Alignment.centerRight : null,
      child: Text(headings[column]),
    );
  },
  columnSpanExtent: (index) {
    if (index == 2) return const FixedTableSpanExtent(150);
    if (index == 3) {
      return const MaxTableSpanExtent(
        FixedTableSpanExtent(120),
        RemainingTableSpanExtent(),
      );
    }
    return null;
  },
  builder: (context, index) {
    final invoice = invoices[index.row];
    return ShadTableCell(
      alignment: index.column == invoice.length - 1
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        invoice[index.column],
        style: index.column == 0
            ? const TextStyle(fontWeight: FontWeight.w500)
            : null,
      ),
    );
  },
  footer: (context, column) {
    if (column == 0) {
      return const ShadTableCell.footer(
        child: Text(
          '总计',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      );
    }
    if (column == 3) {
      return const ShadTableCell.footer(
        alignment: Alignment.centerRight,
        child: Text(
          r'$2500.00',
        ),
      );
    }
    return const ShadTableCell(child: SizedBox());
  },
)
```

#### ShadTable 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `builder` | `ShadTableCellBuilder?` | 用于按需构建表格单元格的函数。在使用构建器方式时必需。 |
| `columnCount` | `int` | 表格的列数。在使用构建器方式时必需。 |
| `rowCount` | `int` | 表格的行数（不包括表头和表尾）。在使用构建器方式时必需。 |
| `children` | `Iterable<Iterable<ShadTableCell>>?` | 显式指定的二维 `ShadTableCell` 小部件数组。在使用列表方式时必需。 |
| `header` | `Iterable<ShadTableCell>?` | 表格的表头行。在使用列表方式时使用。 |
| `headerBuilder` | `ShadTableCell Function(BuildContext, int)?` | 用于构建表头单元格的函数。在使用构建器方式时使用。 |
| `footer` | `Iterable<ShadTableCell>?` | 表格的表尾行。在使用列表方式时使用。 |
| `footerBuilder` | `ShadTableCell Function(BuildContext, int)?` | 用于构建表尾单元格的函数。在使用构建器方式时使用。 |
| `columnBuilder` | `TableSpanBuilder?` | 用于定义列属性的构建器。 |
| `rowBuilder` | `TableSpanBuilder?` | 用于定义行属性的构建器。 |
| `columnSpanExtent` | `TableSpanExtentBuilder?` | 用于定义列宽度的函数。 |
| `rowSpanExtent` | `TableSpanExtentBuilder?` | 用于定义行高度的函数。 |
| `pinnedRowCount` | `int?` | 固定在顶部的行数。 |
| `pinnedColumnCount` | `int?` | 固定在左侧的列数。 |
| `horizontalScrollController` | `ScrollController?` | 水平滚动的控制器。 |
| `verticalScrollController` | `ScrollController?` | 垂直滚动的控制器。 |
| `onRowTap` | `ValueChanged<int>?` | 点击行时调用的回调函数。 |
| `onColumnTap` | `ValueChanged<int>?` | 点击列时调用的回调函数。 |
| `onHoveredRowIndex` | `ValueChanged<int?>?` | 鼠标悬停在行上时调用的回调函数。 |

#### ShadTableCell 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 单元格的内容小部件。 |
| `alignment` | `Alignment?` | 单元格内容的对齐方式。默认为 `Alignment.centerLeft`。 |
| `height` | `double?` | 单元格的高度。默认为 48。 |
| `padding` | `EdgeInsets?` | 单元格的内边距。默认为 `EdgeInsets.symmetric(horizontal: 16)`。 |
| `style` | `TextStyle?` | 单元格文本的样式。 |

### Switch 开关

Switch（开关）组件是一个控件，允许用户在开启和关闭两种状态之间切换。

#### 基本用法

```dart
class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return ShadSwitch(
      value: value,
      onChanged: (v) => setState(() => value = v),
      label: const Text('飞行模式'),
    );
  }
}
```

#### 带副标签的开关

```dart
ShadSwitch(
  value: value,
  onChanged: (v) => setState(() => value = v),
  label: const Text('自动更新'),
  sublabel: const Text('当有新版本可用时自动更新应用程序。'),
)
```

#### 在表单中使用开关

```dart
ShadSwitchFormField(
  id: 'terms',
  initialValue: false,
  inputLabel: const Text('我接受条款和条件'),
  onChanged: (v) {},
  inputSublabel: const Text('您同意我们的服务条款和隐私政策'),
  validator: (v) {
    if (!v) {
      return '您必须接受条款和条件';
    }
    return null;
  },
)
```

#### ShadSwitch 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `bool` | 开关当前是否开启。表示开关的当前状态。 |
| `enabled` | `bool` | 开关是否启用并可交互。默认为 `true`。当禁用时，它会视觉上指示其处于非活动状态并忽略用户交互。 |
| `onChanged` | `ValueChanged<bool>?` | 当开关被切换时调用的回调函数。提供一个布尔值，表示开关的新状态（true 表示开启，true 表示关闭）。 |
| `focusNode` | `FocusNode?` | 用于控制开关焦点的焦点节点。 |
| `thumbColor` | `Color?` | 开关滑块的颜色。默认为主题的背景颜色。 |
| `uncheckedTrackColor` | `Color?` | 开关未选中时轨道的颜色。默认为主题的输入颜色。 |
| `checkedTrackColor` | `Color?` | 开关选中时轨道的颜色。默认为主题的主要颜色。 |
| `width` | `double?` | 开关的宽度。默认为 44。 |
| `height` | `double?` | 开关的高度。默认为 24。 |
| `margin` | `double?` | 开关滑块周围的边距。默认为 2。 |
| `duration` | `Duration?` | 开关动画的持续时间。默认为 100 毫秒。 |
| `decoration` | `ShadDecoration?` | 开关的装饰。 |
| `direction` | `TextDirection?` | 开关和标签的文本方向。 |
| `label` | `Widget?` | 显示在开关旁边的标签。 |
| `sublabel` | `Widget?` | 显示在标签下方的副标签。 |
| `padding` | `EdgeInsets?` | 开关和标签之间的内边距。默认为 `EdgeInsets.only(left: 8)`。 |

#### ShadSwitchFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符。 |
| `initialValue` | `bool` | 开关的初始值。 |
| `inputLabel` | `Widget?` | 开关的标签。 |
| `inputSublabel` | `Widget?` | 开关的副标签。 |
| `onChanged` | `ValueChanged<bool>?` | 当开关被切换时调用的回调函数。 |
| `validator` | `String? Function(bool)?` | 用于验证开关值的函数。 |
| `enabled` | `bool` | 开关是否启用。默认为 `true`。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |

### Tabs 选项卡

Tabs（选项卡）组件是一组分层的内容部分，也称为选项卡面板，一次只显示一个。

#### 基本用法

```dart
class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadTabs<String>(
      value: 'account',
      tabBarConstraints: const BoxConstraints(maxWidth: 400),
      contentConstraints: const BoxConstraints(maxWidth: 400),
      tabs: [
        ShadTab(
          value: 'account',
          content: ShadCard(
            title: const Text('账户'),
            description: const Text('在此处更改您的账户。完成后点击保存。'),
            footer: const ShadButton(child: Text('保存更改')),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text('名称'),
                  initialValue: 'Ale',
                ),
                const SizedBox(height: 8),
                ShadInputFormField(
                  label: const Text('用户名'),
                  initialValue: 'nank1ro',
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          child: const Text('账户'),
        ),
        ShadTab(
          value: 'password',
          content: ShadCard(
            title: const Text('密码'),
            description: const Text('在此处更改您的密码。保存后，您将被注销。'),
            footer: const ShadButton(child: Text('保存密码')),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text('当前密码'),
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                ShadInputFormField(
                  label: const Text('新密码'),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
              ],
)
```

#### 使用控制器

```dart
class TabsWithController extends StatefulWidget {
  const TabsWithController({super.key});

  @override
  State<TabsWithController> createState() => _TabsWithControllerState();
}

class _TabsWithControllerState extends State<TabsWithController> {
  late final controller = ShadTabsController<String>(initialValue: 'account');

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadTabs<String>(
          controller: controller,
          tabs: [
            ShadTab(
              value: 'account',
              content: const Text('账户内容'),
              child: const Text('账户'),
            ),
            ShadTab(
              value: 'password',
              content: const Text('密码内容'),
              child: const Text('密码'),
            ),
          ],
        ),
        ShadButton(
          onPressed: () => controller.select('password'),
          child: const Text('切换到密码选项卡'),
        ),
      ],
    );
  }
}
```

#### ShadTabs 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `T?` | 当前选中的选项卡。必须提供 `value` 或 `controller`。 |
| `tabs` | `List<ShadTab<T>>` | 要显示的选项卡列表。 |
| `controller` | `ShadTabsController<T>?` | 选项卡的控制器。必须提供 `value` 或 `controller`。 |
| `gap` | `double?` | 选项卡栏和内容之间的间距。默认为 8。 |
| `scrollable` | `bool?` | 选项卡是否可滚动。默认为 `false`。 |
| `dragStartBehavior` | `DragStartBehavior?` | 拖动开始的行为。默认为 `DragStartBehavior.start`。 |
| `physics` | `ScrollPhysics?` | 可滚动选项卡的滚动物理学。 |
| `padding` | `EdgeInsets?` | 选项卡栏的内边距。默认为 `EdgeInsets.zero`。 |
| `decoration` | `ShadDecoration?` | 选项卡栏的装饰。 |
| `tabBarConstraints` | `BoxConstraints?` | 选项卡栏的大小约束。 |
| `contentConstraints` | `BoxConstraints?` | 选项卡内容的大小约束。 |
| `expandContent` | `bool?` | 选项卡内容是否应该扩展以填充可用空间。默认为 `false`。 |
| `restorationId` | `String?` | 用于恢复选项卡状态的 ID。 |
| `onChanged` | `ValueChanged<T>?` | 选项卡选择变化时调用的回调函数。 |

#### ShadTab 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `value` | `T` | 选项卡的值，用于标识选项卡。 |
| `child` | `Widget` | 选项卡的标签内容。 |
| `content` | `Widget?` | 选项卡的内容，当选项卡被选中时显示。 |
| `leading` | `Widget?` | 显示在选项卡标签前面的小部件，通常是图标。 |
| `trailing` | `Widget?` | 显示在选项卡标签后面的小部件。 |
| `enabled` | `bool` | 选项卡是否启用。默认为 `true`。 |
| `flex` | `int` | 选项卡在选项卡栏中的弹性因子。默认为 1。 |
| `height` | `double?` | 选项卡的高度。 |
| `width` | `double?` | 选项卡的宽度。 |
| `backgroundColor` | `Color?` | 选项卡的背景颜色。 |
| `selectedBackgroundColor` | `Color?` | 选项卡选中时的背景颜色。 |
| `hoverBackgroundColor` | `Color?` | 悬停时选项卡的背景颜色。 |
| `selectedHoverBackgroundColor` | `Color?` | 选项卡选中并悬停时的背景颜色。 |
| `padding` | `EdgeInsets?` | 选项卡的内边距。 |
| `decoration` | `ShadDecoration?` | 选项卡的装饰。 |
| `selectedDecoration` | `ShadDecoration?` | 选项卡选中时的装饰。 |
| `foregroundColor` | `Color?` | 选项卡的前景颜色。 |
| `selectedForegroundColor` | `Color?` | 选项卡选中时的前景颜色。 |
| `textStyle` | `TextStyle?` | 选项卡文本的样式。 |
| `shadows` | `List<BoxShadow>?` | 选项卡的阴影列表。 |
| `selectedShadows` | `List<BoxShadow>?` | 选项卡选中时的阴影列表。 |

### TimePicker 时间选择器

TimePicker（时间选择器）组件是一个可定制的时间选择器，包含小时、分钟和秒数输入。

#### 基本用法

```dart
// 24小时制时间选择器
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 600),
  child: ShadTimePicker(
    trailing: const Padding(
      padding: EdgeInsets.only(left: 8, top: 14),
      child: Icon(LucideIcons.clock4),
    ),
    onChanged: (time) {
      print('time: $time');
    },
  ),
)

// 12小时制时间选择器（带AM/PM）
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 600),
  child: ShadTimePicker.period(
    crossAxisAlignment: WrapCrossAlignment.end,
    onChanged: (time) {
      print('time: $time');
    },
  ),
)
```

#### 在表单中使用时间选择器

```dart
// 24小时制表单时间选择器
ShadTimePickerFormField(
  id: 'time',
  label: const Text('选择时间'),
  onChanged: print,
  description: const Text('您想要选择的时间'),
  validator: (v) => v == null ? '需要提供时间' : null,
)

// 12小时制表单时间选择器（带AM/PM）
ShadTimePickerFormField.period(
  id: 'time',
  label: const Text('选择时间'),
  onChanged: print,
  description: const Text('您想要选择的时间'),
  validator: (v) => v == null ? '需要提供时间' : null,
)
```

#### ShadTimePicker 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadTimePickerVariant` | 时间选择器的变体，可以是 `primary`（24小时制）或 `period`（12小时制带AM/PM）。 |
| `axis` | `Axis?` | 时间选择器字段的排列方向。默认为 `Axis.horizontal`。 |
| `spacing` | `double?` | 字段之间的间距。 |
| `runSpacing` | `double?` | 当字段换行时，行与行之间的间距。 |
| `jumpToNextFieldWhenFilled` | `bool?` | 当一个字段填充后是否自动跳到下一个字段。默认为 `true`。 |
| `onChanged` | `ValueChanged<ShadTimeOfDay>?` | 时间变化时调用的回调函数。 |
| `initialValue` | `ShadTimeOfDay?` | 时间选择器的初始值。 |
| `hourLabel` | `Widget?` | 小时字段的标签。默认为 `Text('小时')`。 |
| `minuteLabel` | `Widget?` | 分钟字段的标签。默认为 `Text('分钟')`。 |
| `secondLabel` | `Widget?` | 秒数字段的标签。默认为 `Text('秒数')`。 |
| `hourPlaceholder` | `Widget?` | 小时字段的占位符。默认为 `Text('00')`。 |
| `minutePlaceholder` | `Widget?` | 分钟字段的占位符。默认为 `Text('00')`。 |
| `secondPlaceholder` | `Widget?` | 秒数字段的占位符。默认为 `Text('00')`。 |
| `leading` | `Widget?` | 显示在时间选择器前面的小部件。 |
| `trailing` | `Widget?` | 显示在时间选择器后面的小部件。 |
| `alignment` | `WrapAlignment?` | 时间选择器的对齐方式。 |
| `runAlignment` | `WrapAlignment?` | 时间选择器的行对齐方式。 |
| `crossAxisAlignment` | `WrapCrossAlignment?` | 时间选择器的交叉轴对齐方式。 |
| `maxHour` | `int` | 小时字段的最大值。默认为 23（24小时制）或 12（12小时制）。 |
| `maxMinute` | `int` | 分钟字段的最大值。默认为 59。 |
| `maxSecond` | `int` | 秒数字段的最大值。默认为 59。 |
| `minHour` | `int` | 小时字段的最小值。默认为 0。 |
| `minMinute` | `int` | 分钟字段的最小值。默认为 0。 |
| `minSecond` | `int` | 秒数字段的最小值。默认为 0。 |
| `initialDayPeriod` | `DayPeriod?` | 初始的日间时段（AM/PM）。仅在 `period` 变体中使用。 |
| `periodLabel` | `Widget?` | 日间时段选择器的标签。仅在 `period` 变体中使用。 |
| `periodPlaceholder` | `Widget?` | 日间时段选择器的占位符。仅在 `period` 变体中使用。 |
| `gap` | `double?` | 标签和字段之间的间距。 |
| `style` | `TextStyle?` | 字段文本的样式。 |
| `labelStyle` | `TextStyle?` | 标签文本的样式。 |
| `placeholderStyle` | `TextStyle?` | 占位符文本的样式。 |
| `fieldWidth` | `double?` | 字段的宽度。 |
| `fieldPadding` | `EdgeInsets?` | 字段的内边距。 |
| `fieldDecoration` | `ShadDecoration?` | 字段的装饰。 |
| `controller` | `ShadTimePickerController?` | 用于控制时间选择器的控制器。 |
| `enabled` | `bool` | 时间选择器是否启用。默认为 `true`。 |

#### ShadTimePickerFormField 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `Object` | 表单字段的唯一标识符。 |
| `label` | `Widget?` | 时间选择器的标签。 |
| `error` | `Widget?` | 时间选择器的错误消息。 |
| `description` | `Widget?` | 时间选择器的描述。 |
| `onChanged` | `ValueChanged<ShadTimeOfDay?>?` | 时间变化时调用的回调函数。 |
| `validator` | `String? Function(ShadTimeOfDay?)?` | 用于验证时间的函数。 |
| `enabled` | `bool?` | 时间选择器是否启用。 |
| `initialValue` | `ShadTimeOfDay?` | 时间选择器的初始值。 |
| `autovalidateMode` | `AutovalidateMode?` | 自动验证模式，决定何时进行验证。 |

### Tooltip 提示框

Tooltip（提示框）组件是一个弹出式的提示，当元素获得键盘焦点或鼠标悬停在其上时显示相关信息。

#### 基本用法

```dart
ShadTooltip(
  builder: (context) => const Text('添加到库'),
  child: ShadButton.outline(
    child: const Text('悬停/聚焦'),
    onPressed: () {},
  ),
)
```

#### 自定义提示框

```dart
class CustomTooltip extends StatefulWidget {
  const CustomTooltip({super.key});

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  final focusNode = FocusNode();
  final tooltipController = ShadTooltipController();

  @override
  void dispose() {
    focusNode.dispose();
    tooltipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadTooltip(
      controller: tooltipController,
      focusNode: focusNode,
      waitDuration: const Duration(milliseconds: 300),
      showDuration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(12),
      decoration: ShadDecoration(
        color: ShadTheme.of(context).colorScheme.primary,
        radius: BorderRadius.circular(8),
      ),
      builder: (context) => const Text('自定义提示框'),
      child: ShadButton.outline(
        focusNode: focusNode,
        child: const Text('悬停或点击'),
        onPressed: () => tooltipController.toggle(),
      ),
    );
  }
}
```

#### ShadTooltip 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `child` | `Widget` | 触发提示框的子小部件。当悬停或聚焦在这个小部件上时，提示框将显示。 |
| `builder` | `WidgetBuilder` | 用于构建提示框内容的函数。 |
| `focusNode` | `FocusNode?` | 子小部件的焦点节点。当子小部件获得焦点时，提示框将显示。 |
| `waitDuration` | `Duration?` | 悬停在子小部件上后，显示提示框前的等待时间。 |
| `showDuration` | `Duration?` | 鼠标离开子小部件后，提示框保持显示的时间。 |
| `effects` | `List<Effect<dynamic>>?` | 应用于提示框的动画效果列表。默认为淡入、缩放和移动效果。 |
| `padding` | `EdgeInsets?` | 提示框内容的内边距。默认为 `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`。 |
| `decoration` | `ShadDecoration?` | 提示框的装饰。定义提示框容器的视觉外观。 |
| `anchor` | `ShadAnchorBase?` | 提示框相对于其子小部件的锚点位置。默认为在子小部件的顶部中心。 |
| `hoverStrategies` | `ShadHoverStrategies?` | 在触摸屏幕设备上使用的悬停策略。配置如何解释悬停交互，尤其是在触摸设备上。 |
| `controller` | `ShadTooltipController?` | 管理提示框可见性的控制器。允许程序化控制显示和隐藏提示框。 |
| `longPressDuration` | `Duration?` | 识别长按的持续时间，在触摸设备上触发提示框。 |
| `duration` | `Duration?` | 提示框进入动画的持续时间。默认为 `Animate.defaultDuration`。 |
| `reverseDuration` | `Duration?` | 提示框退出动画的持续时间。默认为 `Duration.zero`。 |

#### ShadTooltipController 方法

| 方法 | 描述 |
|------|------|
| `show()` | 显示提示框。 |
| `hide()` | 隐藏提示框。 |
| `toggle()` | 切换提示框的可见性。 |
| `setOpen(bool open)` | 设置提示框的可见性。 |

### Toast 提示框

Toast（提示框）组件用于显示临时的简洁消息提示。

#### 基本用法

```dart
// 基本提示框
ShadButton.outline(
  child: const Text('显示提示'),
  onPressed: () {
    ShadToaster.of(context).show(
      const ShadToast(
        description: Text('您的消息已发送。'),
      ),
    );
  },
)

// 带标题和操作的提示框
ShadButton.outline(
  child: const Text('添加到日历'),
  onPressed: () {
    final toaster = ShadToaster.of(context);
    toaster.show(
      ShadToast(
        title: const Text('已安排：会议'),
        description: const Text('2023年10月15日 下午3:30'),
        action: ShadButton.outline(
          child: const Text('撤销'),
          onPressed: () => toaster.hide(),
        ),
      ),
    );
  },
)

// 错误提示框
ShadButton.outline(
  child: const Text('显示错误提示'),
  onPressed: () {
    ShadToaster.of(context).show(
      ShadToast.destructive(
        title: const Text('出错了！'),
        description: const Text('您的请求出现了问题。'),
        action: ShadButton.destructive(
          child: const Text('重试'),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  },
)
```

#### 使用 ShadToaster

要使用 Toast 组件，需要在应用的根部添加 `ShadToaster` 小部件：

```dart
ShadApp(
  home: ShadToaster(
    child: MyHomePage(),
  ),
)

// 或者在自定义应用中
 ShadApp.custom(
  appBuilder: (context, theme) => MaterialApp(
    theme: theme,
    home: MyHomePage(),
    builder: (context, child) {
      return ShadToaster(child: child!);
    },
  ),
)
```

#### ShadToaster 方法

| 方法 | 描述 |
|------|------|
| `ShadToaster.of(context)` | 获取最近的 `ShadToasterState`。如果找不到，则抛出断言错误。 |
| `ShadToaster.maybeOf(context)` | 获取最近的 `ShadToasterState`，如果找不到，则返回 null。 |
| `show(ShadToast toast)` | 显示指定的提示框。 |
| `hide({bool animate = true})` | 隐藏当前显示的提示框。参数 `animate` 决定是否使用动画效果。 |

#### ShadToast 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `variant` | `ShadToastVariant` | 提示框的变体，可以是 `primary`（主要）或 `destructive`（破坏性）。决定通过 `ShadTheme` 应用的视觉样式。 |
| `title` | `Widget?` | 提示框的标题小部件，显示在顶部。通常是 `Text` 小部件。 |
| `description` | `Widget?` | 提示框的描述小部件，显示在标题下方。通常是 `Text` 小部件。 |
| `action` | `Widget?` | 提示框的操作小部件，显示在描述下方。通常是按钮。 |
| `closeIcon` | `Widget?` | 关闭按钮的自定义小部件。如果提供，则覆盖 `closeIconData`。 |
| `closeIconData` | `IconData?` | 关闭按钮的图标数据。如果未提供 `closeIcon`，则使用此图标数据创建关闭按钮。 |
| `alignment` | `Alignment?` | 提示框在屏幕上的对齐方式。默认为 `Alignment.bottomRight`。 |
| `offset` | `Offset?` | 提示框相对于其对齐位置的偏移量。 |
| `duration` | `Duration?` | 提示框显示的持续时间。默认为 5 秒。 |
| `textDirection` | `TextDirection?` | 提示框内容的文本方向。如果为 null，则从上下文中推断。 |
| `animateIn` | `List<Effect<dynamic>>?` | 提示框显示时的动画效果列表。 |
| `animateOut` | `List<Effect<dynamic>>?` | 提示框关闭时的动画效果列表。 |
| `crossAxisAlignment` | `CrossAxisAlignment?` | 提示框内容的交叉轴对齐方式。默认为 `CrossAxisAlignment.start`。 |
| `showCloseIconOnlyWhenHovered` | `bool?` | 是否仅在悬停时显示关闭图标。默认为 `true`。 |
| `titleStyle` | `TextStyle?` | 标题的文本样式。如果未指定，默认为主题的柔和样式带中等字重。 |
| `descriptionStyle` | `TextStyle?` | 描述的文本样式。如果未指定，默认为主题的柔和样式。 |
| `actionPadding` | `EdgeInsets?` | 操作按钮的内边距。默认为 `EdgeInsets.only(top: 8)`。 |
| `border` | `Border?` | 提示框的边框。如果未指定，默认为主题的边框。 |
| `radius` | `BorderRadius?` | 提示框的边框半径。如果未指定，默认为主题的半径。 |
| `shadows` | `List<BoxShadow>?` | 提示框的阴影列表。如果未指定，默认为主题的阴影。 |
| `backgroundColor` | `Color?` | 提示框的背景颜色。如果未指定，默认为主题的背景颜色。 |
| `padding` | `EdgeInsets?` | 提示框内容的内边距。默认为 `EdgeInsets.all(16)`。 |
| `closeIconPosition` | `ShadPosition?` | 关闭图标的位置。默认为 `ShadPosition.topRight`。 |
| `constraints` | `BoxConstraints?` | 提示框的大小约束。默认在移动设备上为全宽，在桌面设备上最大宽度为 420。 |

### Typography 排版

Typography（排版）组件提供了一组样式化的文本组件，用于创建一致的文本层次结构。

#### 基本用法

```dart
// 使用主题中的文本样式
final theme = ShadTheme.of(context);

Text('这是一个标题', style: theme.textTheme.h1)
Text('这是一个子标题', style: theme.textTheme.h2)
Text('这是一个段落', style: theme.textTheme.p)
Text('这是一个大文本', style: theme.textTheme.large)
Text('这是一个小文本', style: theme.textTheme.small)
Text('这是一个柔和文本', style: theme.textTheme.muted)
```

#### ShadTextTheme 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `h1` | `TextStyle` | 一级标题样式，通常用于页面主标题。 |
| `h2` | `TextStyle` | 二级标题样式，通常用于部分标题。 |
| `h3` | `TextStyle` | 三级标题样式，通常用于小节标题。 |
| `h4` | `TextStyle` | 四级标题样式，通常用于小标题。 |
| `p` | `TextStyle` | 段落文本样式，用于正文内容。 |
| `blockquote` | `TextStyle` | 引用文本样式，用于引用或突出显示的文本块。 |
| `table` | `TextStyle` | 表格文本样式，用于表格内的文本。 |
| `list` | `TextStyle` | 列表文本样式，用于列表项。 |
| `lead` | `TextStyle` | 引导文本样式，用于段落开头的引导文本。 |
| `large` | `TextStyle` | 大文本样式，用于需要突出显示的文本。 |
| `small` | `TextStyle` | 小文本样式，用于注释或辅助文本。 |
| `muted` | `TextStyle` | 柔和文本样式，用于次要或辅助文本，通常颜色较浅。 |

## 总结

Flutter ShadcnUI 提供了一系列美观、可定制的 UI 组件，可以帮助您快速构建现代化的 Flutter 应用程序。本指南介绍了常用的组件及其属性，帮助您快速上手。

要了解更多组件和高级用法，请参考官方文档：[Flutter ShadcnUI 文档](https://flutter-shadcn-ui.mariuti.com/)

如果您有任何问题或建议，可以在 [GitHub 仓库](https://github.com/nank1ro/flutter-shadcn-ui) 上提出 issue 或者贡献代码。
