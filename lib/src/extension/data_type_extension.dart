import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_toolbox/flutter_ui_toolbox.dart';

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
  String capitalizeFirstLetterX() {
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
  /// - [value]: Value to return if `this` is null or empty (default: `""`).
  /// - Example:
  /// ```dart
  /// String? name;
  /// String validated = name.validate(defaultValue: "Guest"); // Returns `"Guest"`
  /// ```
  String validate({String value = ""}) => (this?.isNotEmpty ?? false) ? this! : value;

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

  /// Get Color from HEX String
  Color toColor({Color? defaultColor}) {
    return getColorFromHex(validate(), defaultColor: defaultColor);
  }

  /// Copy String to Clipboard
  Future<void> copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: validate()));
  }

  bool validateEmail() => hasMatch(this, Patterns.email);

  /// Check email validation

  bool validateEmailEnhanced() => hasMatch(this, Patterns.emailEnhanced);

  /// Check phone validation
  bool validatePhone() => hasMatch(this, Patterns.phone);

  /// Check URL validation
  bool validateURL() => hasMatch(this, Patterns.url);

  String mask({MaskType maskType = MaskType.auto, bool? isMaskingEnabled}) {
    String data = validate();
    isMaskingEnabled ??= isMaskingEnabledGlobal;

    if (!isMaskingEnabledGlobal && !isMaskingEnabled) {
      return data; // Return original data if masking is disabled
    }
    if (isMaskingEnabledGlobal && !isMaskingEnabled) {
      return data; // Return original data if masking is disabled
    }

    if (maskType == MaskType.auto) {
      if (data.validateEmail()) {
        return maskEmail();
      } else if (data.validatePhone()) {
        return maskPhone();
      }
    }
    if (maskType == MaskType.email) {
      return maskEmail();
    } else if (maskType == MaskType.phone) {
      return maskPhone();
    }

    return data; // Return original data if something goes wrong
  }

  /// Mask email (e.g., user@example.com -> u***@example.com)
  String maskEmail({bool? isMaskingEnabled}) {
    String data = validate();

    isMaskingEnabled ??= isMaskingEnabledGlobal;

    if (!isMaskingEnabledGlobal && !isMaskingEnabled) {
      return data; // Return original data if masking is disabled
    }
    if (isMaskingEnabledGlobal && !isMaskingEnabled) {
      return data; // Return original data if masking is disabled
    }

    final parts = data.split('@');
    if (parts.length == 2) {
      final namePart = parts[0].substring(0, 1);
      final domainPart = parts[1];
      final maskedName = namePart + '*' * (parts[0].length - 1);
      return '$maskedName@$domainPart';
    }
    return data;
  }

  /// Mask phone (e.g., 1234567890 -> 12****7890)
  String maskPhone({bool? isMaskingEnabled}) {
    String data = validate();

    isMaskingEnabled ??= isMaskingEnabledGlobal;

    if (!isMaskingEnabledGlobal && !isMaskingEnabled) {
      return data; // Return original data if masking is disabled
    }
    if (isMaskingEnabledGlobal && !isMaskingEnabled) {
      return data; // Return original data if masking is disabled
    }

    final length = data.length;
    if (length > 4) {
      final prefix = data.substring(0, 2);
      final suffix = data.substring(length - 2);
      final maskedMiddle = '*' * (length - 4);
      return '$prefix$maskedMiddle$suffix';
    }
    return data;
  }
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

  /// Returns microseconds duration
  /// 5.microseconds
  Duration get microseconds => Duration(microseconds: validate());

  /// Returns milliseconds duration
  /// ```dart
  /// 5.milliseconds
  /// ```
  Duration get milliseconds => Duration(milliseconds: validate());

  /// Returns seconds duration
  /// ```dart
  /// 5.seconds
  /// ```
  Duration get seconds => Duration(seconds: validate());

  /// Returns minutes duration
  /// ```dart
  /// 5.minutes
  /// ```
  Duration get minutes => Duration(minutes: validate());

  /// Returns hours duration
  /// ```dart
  /// 5.hours
  /// ```
  Duration get hours => Duration(hours: validate());

  /// Returns days duration
  /// ```dart
  /// 5.days
  /// ```
  Duration get days => Duration(days: validate());

  /// Leaves given height of space
  Widget get height => SizedBox(height: this?.toDouble());

  double get dynamicHeight {
    double screenHeight = SizeConfig.screenHeight as double;
    // 812 is the layout height that designer use
    return (this! / 585) * screenHeight;
  }

  double get dynamicWidth {
    double screenWidth = SizeConfig.screenWidth as double;
    // 375 is the layout width that designer use
    return (this! / 270) * screenWidth;
  }

  /// Leaves given width of space
  Widget get width => SizedBox(width: this?.toDouble());

  /// HTTP status code
  bool isSuccessful() => this! >= 200 && this! <= 206;

  BorderRadius borderRadius([double? val]) => radius(val);

  /// Returns if a number is between `first` and `second`
  /// ```dart
  /// 100.isBetween(50, 150) // true;
  /// 100.isBetween(100, 100) // true;
  /// ```
  bool isBetween(num first, num second) {
    if (first <= second) {
      return validate() >= first && validate() <= second;
    } else {
      return validate() >= second && validate() <= first;
    }
  }

  /// Returns Size
  Size get size => Size(this!.toDouble(), this!.toDouble());

  // return suffix (th,st,nd,rd) of the given month day number
  String toMonthDaySuffix() {
    if (!(this! >= 1 && this! <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (this! >= 11 && this! <= 13) {
      return '$this th';
    }

    switch (this! % 10) {
      case 1:
        return '$this st';
      case 2:
        return '$this nd';
      case 3:
        return '$this rd';
      default:
        return '$this th';
    }
  }

  // returns month name from the given int
  String toMonthName({bool isHalfName = false}) {
    String status = '';
    if (!(this! >= 1 && this! <= 12)) {
      throw Exception('Invalid day of month');
    }
    if (this == 1) {
      return status = isHalfName ? 'Jan' : 'January';
    } else if (this == 2) {
      return status = isHalfName ? 'Feb' : 'February';
    } else if (this == 3) {
      return status = isHalfName ? 'Mar' : 'March';
    } else if (this == 4) {
      return status = isHalfName ? 'Apr' : 'April';
    } else if (this == 5) {
      return status = isHalfName ? 'May' : 'May';
    } else if (this == 6) {
      return status = isHalfName ? 'Jun' : 'June';
    } else if (this == 7) {
      return status = isHalfName ? 'Jul' : 'July';
    } else if (this == 8) {
      return status = isHalfName ? 'Aug' : 'August';
    } else if (this == 9) {
      return status = isHalfName ? 'Sept' : 'September';
    } else if (this == 10) {
      return status = isHalfName ? 'Oct' : 'October';
    } else if (this == 11) {
      return status = isHalfName ? 'Nov' : 'November';
    } else if (this == 12) {
      return status = isHalfName ? 'Dec' : 'December';
    }
    return status;
  }

  // returns WeekDay from the given int
  String toWeekDay({bool isHalfName = false}) {
    if (!(this! >= 1 && this! <= 7)) {
      throw Exception('Invalid day of month');
    }
    String weekName = '';

    if (this == 1) {
      return weekName = isHalfName ? "Mon" : "Monday";
    } else if (this == 2) {
      return weekName = isHalfName ? "Tue" : "Tuesday";
    } else if (this == 3) {
      return weekName = isHalfName ? "Wed" : "Wednesday";
    } else if (this == 4) {
      return weekName = isHalfName ? "Thu" : "Thursday";
    } else if (this == 5) {
      return weekName = isHalfName ? "Fri" : "Friday";
    } else if (this == 6) {
      return weekName = isHalfName ? "Sat" : "Saturday";
    } else if (this == 7) {
      return weekName = isHalfName ? "Sun" : "Sunday";
    }
    return weekName;
  }

  /// Returns true if given value is 1, else returns false
  bool getBoolInt() {
    if (this == 1) {
      return true;
    }
    return false;
  }
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

// Double Extensions
extension DoubleExtensions on double? {
  /// Validate given double is not null and returns given value if null.
  double validate({double value = 0.0}) => this ?? value;

  /// 100.0.isBetween(50.0, 150.0) // true;
  /// 100.0.isBetween(100.0, 100.0) // true;
  /// ```
  bool isBetween(num first, num second) {
    final lower = min(first, second);
    final upper = max(first, second);
    return validate() >= lower && validate() <= upper;
  }

  /// Returns Size
  Size get size => Size(this!, this!);
}
