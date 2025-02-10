/// Extension on `String?` to handle null safety and provide useful utilities.
extension StringExtensions on String? {
  /// Capitalizes the first letter of a string while keeping the rest unchanged.
  ///
  /// - If the string is null or empty, returns it as is.
  /// - Example:
  /// ```dart
  /// String? text = "hello";
  /// String result = text.capitalizeFirstLetter(); // Returns "Hello"
  /// ```
  String capitalizeFirstLetter() {
    String? value = this?.trim();
    if (value == null || value.isEmpty) return value ?? "";
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }

  /// Converts the string to a double safely, returning `null` if conversion fails.
  ///
  /// - Example:
  /// ```dart
  /// String? numberString = "10.5";
  /// double? value = numberString.toDouble(); // Returns `10.5`
  /// ```
  double? toDouble() {
    if (this == null || this!.trim().isEmpty) return null;
    return double.tryParse(this!.trim());
  }

  /// Returns the string if not null or empty; otherwise, returns a default value.
  ///
  /// - [defaultValue]: Value to return if `this` is null or empty (default: `""`).
  /// - Example:
  /// ```dart
  /// String? name;
  /// String validated = name.validate(defaultValue: "Guest"); // Returns `"Guest"`
  /// ```
  String validate({String defaultValue = ""}) => (this?.isNotEmpty ?? false) ? this! : defaultValue;

  /// Converts the string to an integer, with a fallback default value.
  ///
  /// - [defaultValue]: Value to return if conversion fails (default: `0`).
  /// - Example:
  /// ```dart
  /// String? count = "10";
  /// int value = count.toInt(defaultValue: 5); // Returns `10`
  /// ```
  int toInt({int defaultValue = 0}) => int.tryParse(this ?? '') ?? defaultValue;

  /// Converts the string to a boolean (`"true"` -> `true`, `"false"` -> `false`).
  ///
  /// - Example:
  /// ```dart
  /// String? isEnabled = "true";
  /// bool value = isEnabled.toBool(); // Returns `true`
  /// ```
  bool toBool() => (this?.toLowerCase() == 'true');
}

/// Extension on `bool?` to handle null values and provide utility methods.
extension BooleanExtensions on bool? {
  /// Validates if the boolean is not null; returns a default value if null.
  ///
  /// - [value]: Default boolean value to return if `this` is null (default: `false`).
  /// - Example:
  /// ```dart
  /// bool? isAvailable;
  /// bool validated = isAvailable.validate(value: true); // Returns `true`
  /// ```
  bool validate({bool value = false}) => this ?? value;

  /// Converts a nullable boolean to an integer (1 for `true`, 0 for `false`).
  ///
  /// - [value]: Default boolean value to use if `this` is null (default: `false`).
  /// - Example:
  /// ```dart
  /// bool? isActive;
  /// int intValue = isActive.getIntBool(value: true); // Returns `1`
  /// ```
  int getIntBool({bool value = false}) => (this ?? value) ? 1 : 0;
}

/// Extension on `int?` to handle null safety and conversions.
extension IntExtensions on int? {
  /// Returns the integer if not null; otherwise, returns a default value.
  ///
  /// - [defaultValue]: Value to return if `this` is null (default: `0`).
  int validate({int defaultValue = 0}) => this ?? defaultValue;

  /// Converts an integer to a boolean (`1` -> `true`, otherwise `false`).
  ///
  /// - Example:
  /// ```dart
  /// int? value = 1;
  /// bool isEnabled = value.toBool(); // Returns `true`
  /// ```
  bool toBool() => this == 1;
}

/// Extension on `List<T>?` to handle null safety and provide list operations.
extension ListExtensions<T> on List<T>? {
  /// Returns the list if not null; otherwise, returns an empty list.
  List<T> validate() => this ?? [];

  /// Checks if the list is not null and not empty.
  ///
  /// - Example:
  /// ```dart
  /// List<String>? items;
  /// bool hasData = items.isNotEmptyList(); // Returns `false`
  /// ```
  bool isNotEmptyList() => (this != null && this!.isNotEmpty);

  /// Joins the list into a string with a given separator.
  ///
  /// - Example:
  /// ```dart
  /// List<String>? words = ["Hello", "World"];
  /// String result = words.joinWith(", "); // Returns `"Hello, World"`
  /// ```
  String joinWith(String separator) => this?.join(separator) ?? "";
}

/// Extension on `Map<K, V>?` to handle null safety and provide utilities.
extension MapExtensions<K, V> on Map<K, V>? {
  /// Returns the map if not null; otherwise, returns an empty map.
  Map<K, V> validate() => this ?? {};

  /// Checks if the map is not null and not empty.
  ///
  /// - Example:
  /// ```dart
  /// Map<String, dynamic>? data;
  /// bool hasData = data.isNotEmptyMap(); // Returns `false`
  /// ```
  bool isNotEmptyMap() => (this != null && this!.isNotEmpty);

  /// Retrieves a value from the map safely, with a default fallback.
  ///
  /// - Example:
  /// ```dart
  /// Map<String, int>? scores = {"Alice": 10};
  /// int aliceScore = scores.get("Alice", defaultValue: 0); // Returns `10`
  /// ```
  V get(K key, {V? defaultValue}) => this?.containsKey(key) == true ? this![key]! : defaultValue!;
}

/// Extension on `num?` to provide safer operations and better default handling.
extension NumExtensions on num? {
  /// Ensures the number is not null, returning a default value if it is.
  ///
  /// - [defaultValue]: The value to return if `this` is null. Default is `0`.
  /// - Example:
  /// ```dart
  /// num? value;
  /// num safeValue = value.validate(defaultValue: 5); // Returns `5`
  /// ```
  num validate({num defaultValue = 0}) => this ?? defaultValue;

  /// Returns the absolute value of the number.
  ///
  /// - Example:
  /// ```dart
  /// num? value = -10;
  /// num absolute = value.absValue(); // Returns `10`
  /// ```
  num absValue() => (this ?? 0).abs();

  /// Returns `true` if the number is null or zero.
  ///
  /// - Example:
  /// ```dart
  /// num? value = 0;
  /// bool isZero = value.isNullOrZero(); // Returns `true`
  /// ```
  bool isNullOrZero() => this == null || this == 0;

  /// Limits the number within a given range.
  ///
  /// - [min]: The minimum allowed value.
  /// - [max]: The maximum allowed value.
  /// - Example:
  /// ```dart
  /// num value = 15;
  /// num clamped = value.clampValue(10, 20); // Returns `15`
  /// num clamped2 = value.clampValue(5, 12); // Returns `12`
  /// ```
  num clampValue(num min, num max) => (this ?? 0).clamp(min, max);

  /// Converts a number to a formatted string with a fixed number of decimal places.
  ///
  /// - [decimals]: The number of decimal places to keep.
  /// - Example:
  /// ```dart
  /// num value = 12.34567;
  /// String formatted = value.toFixed(2); // Returns `"12.35"`
  /// ```
  String toFixed(int decimals) => (this ?? 0).toStringAsFixed(decimals);

  /// Converts a number to an integer safely.
  ///
  /// - Example:
  /// ```dart
  /// num? value = 10.9;
  /// int intValue = value.toIntSafe(); // Returns `10`
  /// ```
  int toIntSafe() => (this ?? 0).toInt();

  /// Converts a number to a double safely.
  ///
  /// - Example:
  /// ```dart
  /// num? value = 10;
  /// double doubleValue = value.toDoubleSafe(); // Returns `10.0`
  /// ```
  double toDoubleSafe() => (this ?? 0).toDouble();

  /// Checks whether the number is even.
  ///
  /// - Example:
  /// ```dart
  /// num value = 4;
  /// bool isEven = value.isEvenNum(); // Returns `true`
  /// ```
  bool isEvenNum() => (this?.toInt() ?? 0) % 2 == 0;

  /// Checks whether the number is odd.
  ///
  /// - Example:
  /// ```dart
  /// num value = 5;
  /// bool isOdd = value.isOddNum(); // Returns `true`
  /// ```
  bool isOddNum() => (this?.toInt() ?? 0) % 2 != 0;
}
