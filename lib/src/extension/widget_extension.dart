import 'package:flutter/material.dart';

/// Extension on Widget for enhanced UI modifications.
extension WidgetExtensions on Widget {
  /// 🌟 **Applies custom border radius to each corner using ClipRRect.**
  Widget cornerRadiusWithClipRRectOnly({
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
    double topLeft = 0.0,
    double topRight = 0.0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// 🟩 **Applies a uniform corner radius to all corners.**
  Widget cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// 🔄 **Adds rotation transformation to a widget.**
  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      origin: origin,
      angle: angle,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// 🎭 **Applies opacity animation to a widget.**
  Widget fade({
    required double opacity,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      child: this,
    );
  }

  /// 🎯 **Adds an InkWell tap effect to a widget.**
  Widget onTap(
    VoidCallback? function, {
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? focusColor,
    WidgetStateProperty<Color?>? overlayColor,
  }) {
    return InkWell(
      onTap: function,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      splashColor: splashColor ?? Colors.grey.withOpacity(0.2),
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      focusColor: focusColor,
      overlayColor: overlayColor,
      child: this,
    );
  }

  /// 💡 **Wraps a widget inside a tooltip.**
  Widget withTooltip({required String message}) {
    return Tooltip(message: message, child: this);
  }

  /// 🔄 **Makes any widget refreshable using RefreshIndicator.**
  Widget withRefreshIndicator({
    required Future<void> Function() onRefresh,
  }) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: this,
      ),
    );
  }

  /// 🏞 **Centers a widget inside its parent.**
  Widget get centered => Center(child: this);

  /// 🎨 **Wraps widget in a container with a background color.**
  Widget withBackground(Color color) {
    return Container(color: color, child: this);
  }

  /// 🖼 **Wraps widget in a Material widget for better Material behaviors.**
  Widget get asMaterial => Material(type: MaterialType.transparency, child: this);

  /// Wraps the widget with a [Center] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').center();
  /// ```
  Widget center() => Center(child: this);

  /// Wraps the widget with an [Expanded] widget.
  ///
  /// The [flex] parameter determines how much space the widget takes up
  /// relative to other expanded widgets.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').expanded(flex: 2);
  /// ```
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Wraps the widget with a [Flexible] widget.
  ///
  /// The [flex] parameter defines the flex factor.
  /// The [fit] parameter determines whether the widget takes up loose or tight space.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').flexible(flex: 3, fit: FlexFit.tight);
  /// ```
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);

  /// Wraps the widget with a [Padding] widget.
  ///
  /// The [padding] parameter allows setting custom padding.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').withPadding(padding: EdgeInsets.all(16));
  /// ```
  Widget withPadding({required EdgeInsets padding}) => Padding(padding: padding, child: this);

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }
}

extension WidgetExtension on Widget? {
  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const Offstage()}) => this ?? value;
}
