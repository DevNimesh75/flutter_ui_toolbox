import 'package:flutter/material.dart';

/// Extension on `Color` to provide additional utilities.
extension ColorExtensions on Color {
  /// Adjusts the brightness of a color.
  ///
  /// - [amount]: The percentage to lighten (positive) or darken (negative) the color.
  /// - Example:
  /// ```dart
  /// Color baseColor = Colors.blue;
  /// Color lighterColor = baseColor.adjustBrightness(20); // Lightens by 20%
  /// Color darkerColor = baseColor.adjustBrightness(-20); // Darkens by 20%
  /// ```
  Color adjustBrightness(double amount) {
    assert(amount >= -100 && amount <= 100, 'Brightness adjustment must be between -100 and 100');
    HSLColor hsl = HSLColor.fromColor(this);
    double lightness = (hsl.lightness + (amount / 100)).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Returns a color with increased opacity.
  ///
  /// - [opacity]: The opacity percentage (0 - 100).
  /// - Example:
  /// ```dart
  /// Color transparentColor = Colors.red.withOpacityLevel(50); // 50% opacity
  /// ```
  Color withOpacityLevel(double opacity) {
    assert(opacity >= 0 && opacity <= 100, 'Opacity must be between 0 and 100');
    return withOpacity(opacity / 100);
  }

  /// Returns `true` if the color is considered dark.
  ///
  /// - Example:
  /// ```dart
  /// bool isDark = Colors.black.isDark; // Returns `true`
  /// ```
  bool get isDark {
    double brightness = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    return brightness < 0.5;
  }

  /// Returns `true` if the color is considered light.
  ///
  /// - Example:
  /// ```dart
  /// bool isLight = Colors.white.isLight; // Returns `true`
  /// ```
  bool get isLight => !isDark;

  /// Converts the color to a hex string (e.g., `#RRGGBB` or `#AARRGGBB`).
  ///
  /// - Example:
  /// ```dart
  /// String hex = Colors.blue.toHex(); // Returns `#FF0000FF`
  /// ```
  String toHex({bool includeAlpha = true}) {
    return includeAlpha
        ? '#${alpha.toRadixString(16).padLeft(2, '0')}${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}'
        : '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
  }

  /// Creates a `Color` from a hex string.
  ///
  /// - Supports both `#RRGGBB` and `#AARRGGBB` formats.
  /// - Example:
  /// ```dart
  /// Color color = ColorExtensions.fromHex("#3498db"); // Blue color
  /// ```
  static Color fromHex(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex"; // Add full opacity if alpha is missing
    }
    return Color(int.parse(hex, radix: 16));
  }

  /// Creates a `Color` from RGB values (0-255).
  ///
  /// - Example:
  /// ```dart
  /// Color color = ColorExtensions.fromRGB(52, 152, 219); // Blue color
  /// ```
  static Color fromRGB(int red, int green, int blue, [double opacity = 1.0]) {
    return Color.fromRGBO(red, green, blue, opacity);
  }
}
