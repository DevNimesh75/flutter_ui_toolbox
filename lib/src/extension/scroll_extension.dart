import 'package:flutter/widgets.dart';

/// Extension to enhance ScrollController functionality.
extension ScrollControllerExtensions on ScrollController {
  /// 📜 **Scrolls to the bottom of the scrollable widget.**
  /// - [duration]: Duration of the scrolling animation. *(Default: 300ms)*
  /// - [curve]: Animation curve for smooth scrolling. *(Default: Curves.easeOut)*
  void scrollToBottom({Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.easeOut}) {
    if (hasClients) {
      animateTo(position.maxScrollExtent, duration: duration, curve: curve);
    }
  }

  /// 🔝 **Scrolls to the top of the scrollable widget.**
  /// - [duration]: Duration of the scrolling animation. *(Default: 300ms)*
  /// - [curve]: Animation curve for smooth scrolling. *(Default: Curves.easeOut)*
  void scrollToTop({Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.easeOut}) {
    if (hasClients) {
      animateTo(position.minScrollExtent, duration: duration, curve: curve);
    }
  }

  /// 🔄 **Scrolls to a specific offset in the scrollable widget.**
  /// - [offset]: The position to scroll to.
  /// - [duration]: Duration of the scrolling animation. *(Default: 300ms)*
  /// - [curve]: Animation curve for smooth scrolling. *(Default: Curves.easeOut)*
  void scrollTo(double offset, {Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.easeOut}) {
    if (hasClients) {
      animateTo(offset, duration: duration, curve: curve);
    }
  }

  /// ⚡ **Jumps to the bottom of the scrollable widget instantly.**
  void jumpToBottom() {
    if (hasClients) {
      jumpTo(position.maxScrollExtent);
    }
  }

  /// ⏫ **Jumps to the top of the scrollable widget instantly.**
  void jumpToTop() {
    if (hasClients) {
      jumpTo(position.minScrollExtent);
    }
  }

  /// 🔄 **Checks if the user is at the top of the scrollable widget.**
  bool get isAtTop => position.pixels <= position.minScrollExtent;

  /// ⬇ **Checks if the user is at the bottom of the scrollable widget.**
  bool get isAtBottom => position.pixels >= position.maxScrollExtent;

  /// 📊 **Gets the current scroll percentage (0.0 - 1.0).**
  double get scrollPercentage {
    if (!hasClients || position.maxScrollExtent == 0) return 0.0;
    return position.pixels / position.maxScrollExtent;
  }
}
