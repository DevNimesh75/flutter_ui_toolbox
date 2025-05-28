import 'package:flutter/material.dart';

/// A set of padding extensions for Flutter widgets, making it easier to apply padding.
extension PaddingExtensions on Widget {
  /// Applies equal padding on all sides.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingAll(16);
  /// ```
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  /// Applies symmetrical padding.
  ///
  /// - [horizontal]: Padding for left and right.
  /// - [vertical]: Padding for top and bottom.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingSymmetric(horizontal: 12, vertical: 8);
  /// ```
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  /// Applies padding to specific sides.
  ///
  /// - [left]: Padding on the left.
  /// - [top]: Padding on the top.
  /// - [right]: Padding on the right.
  /// - [bottom]: Padding on the bottom.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingOnly(left: 8, top: 16);
  /// ```
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  /// Applies padding only at the top.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingTop(10);
  /// ```
  Widget paddingTop(double value) => Padding(
        padding: EdgeInsets.only(top: value),
        child: this,
      );

  /// Applies padding only at the bottom.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingBottom(12);
  /// ```
  Widget paddingBottom(double value) => Padding(
        padding: EdgeInsets.only(bottom: value),
        child: this,
      );

  /// Applies padding only on the left.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingLeft(8);
  /// ```
  Widget paddingLeft(double value) => Padding(
        padding: EdgeInsets.only(left: value),
        child: this,
      );

  /// Applies padding only on the right.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingRight(8);
  /// ```
  Widget paddingRight(double value) => Padding(
        padding: EdgeInsets.only(right: value),
        child: this,
      );

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this! : (defaultWidget ?? SizedBox());
  }

}
