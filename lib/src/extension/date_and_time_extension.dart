import 'package:intl/intl.dart';

/// Provides useful extensions for `DateTime` operations.
extension DateTimeExtensions on DateTime {
  /// 📅 **Formats the date to a given pattern.**
  ///
  /// Default format: `yyyy-MM-dd HH:mm:ss`
  ///
  /// Example:
  /// ```dart
  /// String formatted = DateTime.now().format();
  /// ```
  String format([String pattern = 'yyyy-MM-dd HH:mm:ss']) {
    return DateFormat(pattern).format(this);
  }

  /// 📆 **Returns `true` if the date is today.**
  ///
  /// Example:
  /// ```dart
  /// bool isToday = someDate.isToday;
  /// ```
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// 📅 **Returns `true` if the date is yesterday.**
  ///
  /// Example:
  /// ```dart
  /// bool isYesterday = someDate.isYesterday;
  /// ```
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  /// 📅 **Returns `true` if the date is tomorrow.**
  ///
  /// Example:
  /// ```dart
  /// bool isTomorrow = someDate.isTomorrow;
  /// ```
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;
  }

  /// ⏳ **Returns `true` if the date is in the past.**
  ///
  /// Example:
  /// ```dart
  /// bool past = someDate.isPast;
  /// ```
  bool get isPast => isBefore(DateTime.now());

  /// ⏳ **Returns `true` if the date is in the future.**
  ///
  /// Example:
  /// ```dart
  /// bool future = someDate.isFuture;
  /// ```
  bool get isFuture => isAfter(DateTime.now());

  /// ⏳ **Returns `true` if the year is a leap year.**
  ///
  /// Example:
  /// ```dart
  /// bool leapYear = someDate.isLeapYear;
  /// ```
  bool get isLeapYear {
    if (year % 4 != 0) return false;
    if (year % 100 == 0 && year % 400 != 0) return false;
    return true;
  }

  /// ⏰ **Returns a human-readable "time ago" format.**
  ///
  /// Example:
  /// ```dart
  /// String timeAgo = someDate.timeAgo();
  /// ```
  String timeAgo({DateTime? reference}) {
    final now = reference ?? DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else {
      return '${(difference.inDays / 365).floor()} years ago';
    }
  }

  /// 🕰 **Returns the start of the day (midnight) for the current date.**
  ///
  /// Example:
  /// ```dart
  /// DateTime start = someDate.startOfDay;
  /// ```
  DateTime get startOfDay => DateTime(year, month, day);

  /// 🌙 **Returns the end of the day (23:59:59) for the current date.**
  ///
  /// Example:
  /// ```dart
  /// DateTime end = someDate.endOfDay;
  /// ```
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// 📆 **Returns the start of the week (Monday).**
  ///
  /// Example:
  /// ```dart
  /// DateTime startWeek = someDate.startOfWeek;
  /// ```
  DateTime get startOfWeek => subtract(Duration(days: weekday - 1)).startOfDay;

  /// 📆 **Returns the end of the week (Sunday).**
  ///
  /// Example:
  /// ```dart
  /// DateTime endWeek = someDate.endOfWeek;
  /// ```
  DateTime get endOfWeek => add(Duration(days: 7 - weekday)).endOfDay;

  /// 📅 **Returns the start of the month.**
  ///
  /// Example:
  /// ```dart
  /// DateTime startMonth = someDate.startOfMonth;
  /// ```
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// 📅 **Returns the end of the month.**
  ///
  /// Example:
  /// ```dart
  /// DateTime endMonth = someDate.endOfMonth;
  /// ```
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999);

  /// 📅 **Returns the number of days in the current month.**
  ///
  /// Example:
  /// ```dart
  /// int daysInMonth = someDate.daysInMonth;
  /// ```
  int get daysInMonth => DateTime(year, month + 1, 0).day;

  /// 📅 **Returns the start of the year.**
  ///
  /// Example:
  /// ```dart
  /// DateTime startYear = someDate.startOfYear;
  /// ```
  DateTime get startOfYear => DateTime(year, 1, 1);

  /// 📅 **Returns the end of the year.**
  ///
  /// Example:
  /// ```dart
  /// DateTime endYear = someDate.endOfYear;
  /// ```
  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59, 999);
}
