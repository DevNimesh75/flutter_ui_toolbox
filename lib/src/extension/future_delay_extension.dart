/// An extension on [int] to easily introduce delays in asynchronous operations.
extension FutureExtensions on int {
  /// Delays execution by the given number of milliseconds.
  ///
  /// Example usage:
  /// ```dart
  /// await 1000.delay; // Delays for 1 second (1000 milliseconds)
  /// ```
  Future<void> get millisecondsDelay async => Future.delayed(Duration(milliseconds: this));

  /// Delays execution by the given number of **seconds**.
  ///
  /// Example usage:
  /// ```dart
  /// await 2.secondsDelay; // Delays for 2 seconds
  /// ```
  Future<void> get secondsDelay async => Future.delayed(Duration(seconds: this));

  /// Delays execution by the given number of **minutes**.
  ///
  /// Example usage:
  /// ```dart
  /// await 1.minutesDelay; // Delays for 1 minute
  /// ```
  Future<void> get minutesDelay async => Future.delayed(Duration(minutes: this));
}

