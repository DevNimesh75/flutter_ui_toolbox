
import 'package:flutter/material.dart';

/// A set of extensions to easily access screen size and safe area height.
extension ScreenSize on BuildContext {
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