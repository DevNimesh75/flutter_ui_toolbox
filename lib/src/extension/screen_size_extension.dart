
import 'package:flutter/material.dart';

/// A set of extensions to easily access screen size and safe area height.
extension ScreenSize on BuildContext {
  /// Returns the full screen width of the device.
  ///
  /// Example:
  /// ```dart
  /// double width = context.screenWidth;
  /// ```
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the full screen height of the device.
  ///
  /// Example:
  /// ```dart
  /// double height = context.screenHeight;
  /// ```
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Returns the height of the screen excluding the top and bottom safe areas.
  ///
  /// Useful for layouts where you need to exclude the status bar and navigation bar.
  ///
  /// Example:
  /// ```dart
  /// double safeHeight = context.safeAreaHeight;
  /// ```
  double get safeAreaHeight => MediaQuery.of(this).size.height - MediaQuery.of(this).padding.top - MediaQuery.of(this).padding.bottom;

  /// Checks if the device is in portrait mode
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Checks if the device is in landscape mode
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
}