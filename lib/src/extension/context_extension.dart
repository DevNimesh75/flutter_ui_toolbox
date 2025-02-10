import 'package:flutter/material.dart';

/// An extension on `BuildContext` to provide quick access to commonly used utilities.
extension BuildContextExtensions on BuildContext {
  /// 📏 **Returns the screen size (width & height).**
  ///
  /// Example:
  /// ```dart
  /// Size screenSize = context.screenSize;
  /// ```
  Size get screenSize => MediaQuery.of(this).size;

  /// 📏 **Returns the screen width.**
  ///
  /// - If `maxScreenWidth` is set, it returns that value.
  /// - Otherwise, it retrieves the actual screen width.
  ///
  /// Example:
  /// ```dart
  /// double width = context.screenWidth;
  /// ```
  double get screenWidth => MediaQuery.of(this).size.width;

  /// 📏 **Returns the screen height.**
  ///
  /// Example:
  /// ```dart
  /// double height = context.screenHeight;
  /// ```
  double get screenHeight => MediaQuery.of(this).size.height;

  /// 🔍 **Returns the device's pixel ratio.**
  ///
  /// Example:
  /// ```dart
  /// double ratio = context.pixelRatio;
  /// ```
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// 🌞 **Returns the current brightness mode (light/dark).**
  ///
  /// Example:
  /// ```dart
  /// Brightness brightness = context.platformBrightness;
  /// ```
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  /// 📱 **Returns the status bar height.**
  ///
  /// Example:
  /// ```dart
  /// double statusBar = context.statusBarHeight;
  /// ```
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// 🏠 **Returns the navigation bar height.**
  ///
  /// Example:
  /// ```dart
  /// double navBarHeight = context.navigationBarHeight;
  /// ```
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  /// 🎨 **Returns the current theme.**
  ///
  /// Example:
  /// ```dart
  /// ThemeData theme = context.theme;
  /// ```
  ThemeData get theme => Theme.of(this);

  /// 🔠 **Returns the text theme of the current theme.**
  ///
  /// Example:
  /// ```dart
  /// TextTheme textTheme = context.textTheme;
  /// ```
  TextTheme get textTheme => theme.textTheme;

  /// 📝 **Returns the default text style of the context.**
  ///
  /// Example:
  /// ```dart
  /// DefaultTextStyle textStyle = context.defaultTextStyle;
  /// ```
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// 📋 **Returns the nearest Form widget state.**
  ///
  /// Example:
  /// ```dart
  /// FormState? form = context.formState;
  /// ```
  FormState? get formState => Form.of(this);

  /// 🏗 **Returns the nearest Scaffold widget state.**
  ///
  /// Example:
  /// ```dart
  /// ScaffoldState scaffold = context.scaffoldState;
  /// ```
  ScaffoldState get scaffoldState => Scaffold.of(this);

  /// 🔄 **Returns the nearest Overlay widget state.**
  ///
  /// Example:
  /// ```dart
  /// OverlayState? overlay = context.overlayState;
  /// ```
  OverlayState? get overlayState => Overlay.of(this);

  /// 🎨 **Returns primary color of the theme.**
  Color get primaryColor => theme.primaryColor;

  /// 🎨 **Returns the accent (secondary) color of the theme.**
  Color get accentColor => theme.colorScheme.secondary;

  /// 🎨 **Returns scaffold background color.**
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// 🎨 **Returns card color of the theme.**
  Color get cardColor => theme.cardColor;

  /// 🎨 **Returns divider color of the theme.**
  Color get dividerColor => theme.dividerColor;

  /// 🎨 **Returns icon color of the theme.**
  Color get iconColor => theme.iconTheme.color ?? Colors.black;

  /// 🎯 **Requests focus to the given `FocusNode`.**
  ///
  /// Example:
  /// ```dart
  /// context.requestFocus(myFocusNode);
  /// ```
  void requestFocus(FocusNode focus) => FocusScope.of(this).requestFocus(focus);

  /// 🎯 **Removes focus from the given `FocusNode`.**
  ///
  /// Example:
  /// ```dart
  /// context.unFocus(myFocusNode);
  /// ```
  void unFocus(FocusNode focus) => focus.unfocus();

  /// 📱 **Returns `true` if the device is a phone.**
  bool get isPhone => screenWidth < 600; // Assuming 600px as tablet breakpoint

  /// 📱 **Returns `true` if the device is a tablet.**
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;

  /// 🖥 **Returns `true` if the device is a desktop.**
  bool get isDesktop => screenWidth >= 1200;

  /// 🔄 **Returns the current screen orientation.**
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// 🔄 **Returns `true` if the screen is in landscape mode.**
  bool get isLandscape => orientation == Orientation.landscape;

  /// 🔄 **Returns `true` if the screen is in portrait mode.**
  bool get isPortrait => orientation == Orientation.portrait;

  /// 🔙 **Checks if the current navigator can pop a page.**
  bool get canPop => Navigator.canPop(this);

  /// 🔙 **Pops the current route.**
  void pop<T extends Object>([T? result]) => Navigator.pop(this, result);

  /// 🏆 **Returns the current platform type.**
  TargetPlatform get platform => theme.platform;

  /// 🤖 **Returns `true` if running on Android.**
  bool get isAndroid => platform == TargetPlatform.android;

  /// 🍏 **Returns `true` if running on iOS.**
  bool get isIOS => platform == TargetPlatform.iOS;

  /// 🍏 **Returns `true` if running on MacOS.**
  bool get isMacOS => platform == TargetPlatform.macOS;

  /// 🖥 **Returns `true` if running on Windows.**
  bool get isWindows => platform == TargetPlatform.windows;

  /// 🖥 **Returns `true` if running on Linux.**
  bool get isLinux => platform == TargetPlatform.linux;

  /// 🔥 **Returns `true` if running on Fuchsia.**
  bool get isFuchsia => platform == TargetPlatform.fuchsia;

  /// 📖 **Opens the drawer in the current scaffold.**
  void openDrawer() => scaffoldState.openDrawer();

  /// 📖 **Opens the end drawer in the current scaffold.**
  void openEndDrawer() => scaffoldState.openEndDrawer();

  /// 🎹 **Returns `true` if the keyboard is currently visible.**
  bool get isKeyboardShowing => MediaQuery.of(this).viewInsets.bottom > 0;
}
