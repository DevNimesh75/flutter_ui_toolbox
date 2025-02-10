import 'dart:io';
import 'package:flutter/foundation.dart';

/// Extension to determine the platform the app is running on.
extension DeviceExtensions on Object {
  /// 🖥 **Returns `true` if the app is running on Web.**
  bool get isWeb => kIsWeb;

  /// 📱 **Returns `true` if running on a mobile OS (iOS or Android).**
  bool get isMobile => !isWeb && (Platform.isIOS || Platform.isAndroid);

  /// 🖥 **Returns `true` if running on a desktop OS (Windows, macOS, Linux).**
  bool get isDesktop =>
      !isWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  /// 🍏 **Returns `true` if running on an Apple device (iOS/macOS).**
  bool get isApple => !isWeb && (Platform.isIOS || Platform.isMacOS);

  /// 🤖 **Returns `true` if running on a Google platform (Android/Fuchsia).**
  bool get isGoogle => !isWeb && (Platform.isAndroid || Platform.isFuchsia);

  /// 📱 **Returns `true` if running on Android.**
  bool get isAndroid => !isWeb && Platform.isAndroid;

  /// 🍎 **Returns `true` if running on iOS.**
  bool get isIOS => !isWeb && Platform.isIOS;

  /// 🍏 **Returns `true` if running on macOS.**
  bool get isMacOS => !isWeb && Platform.isMacOS;

  /// 🐧 **Returns `true` if running on Linux.**
  bool get isLinux => !isWeb && Platform.isLinux;

  /// 🏁 **Returns `true` if running on Windows.**
  bool get isWindows => !isWeb && Platform.isWindows;

  /// 🔄 **Returns `true` if running on Fuchsia (Google's experimental OS).**
  bool get isFuchsia => !isWeb && Platform.isFuchsia;

  /// 🛠 **Returns the name of the operating system (e.g., "android", "ios", "windows").**
  String get operatingSystemName => Platform.operatingSystem;

  /// 🔢 **Returns the OS version as a string.**
  String get operatingSystemVersion => Platform.operatingSystemVersion;

  /// 💾 **Returns the system architecture (e.g., "x86_64", "arm64").**
  String get operatingSystemArchitecture => Platform.version.split(' ').last;
}
