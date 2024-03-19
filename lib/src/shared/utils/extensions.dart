import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on Widget {
  /// Adds padding to the widget with all sides having the same padding value.
  Widget padAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding.h),
      child: this, // 'this' refers to the current widget.
    );
  }

  /// Adds horizontal padding to the widget.
  Widget padHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: this,
    );
  }

  /// Adds vertical padding to the widget.
  Widget padVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding.h),
      child: this,
    );
  }

  /// Adds symmetric padding to the widget.
  Widget padSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w),
      child: this,
    );
  }

  /// Adds left padding to the widget.
  Widget padLeft(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding.w),
      child: this,
    );
  }

  /// Adds right padding to the widget.
  Widget padRight(double padding) {
    return Padding(
      padding: EdgeInsets.only(right: padding.w),
      child: this,
    );
  }

  /// Adds top padding to the widget.
  Widget padTop(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding.h),
      child: this,
    );
  }

  /// Adds bottom padding to the widget.
  Widget padBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding.h),
      child: this,
    );
  }

  Widget padOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left?.w ?? 0,
        right: right?.w ?? 0,
        top: top?.h ?? 0,
        bottom: bottom?.h ?? 0,
      ),
      child: this,
    );
  }
}

extension CustomSizedBox on num {
  /// Creates a SizedBox with the width set to the value.
  SizedBox get wi {
    return SizedBox(
      width: toDouble().w,
    );
  }

  /// Creates a SizedBox with the height set to the value.
  SizedBox get hi {
    return SizedBox(
      height: toDouble().h,
    );
  }

  /// Creates a SizedBox with both width and height set to the value.
  SizedBox get wh {
    return SizedBox(
      width: toDouble().w,
      height: toDouble().h,
    );
  }

  /// Creates a SizedBox with the specified width and height.
  SizedBox size({required double width, required double height}) {
    return SizedBox(
      width: width.toDouble().w,
      height: height.toDouble().h,
    );
  }
}

extension FilePaths on String {
  String get svg => 'assets/svgs/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get jpeg => 'assets/images/$this.jpeg';
  String get gif => 'assets/images/$this.gif';
  String get json => 'assets/animations/$this.json';

  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String capitalizeAllFirstWords() {
    List<String> words = split(' ');
    List<String> capitalizedWords =
        words.map((word) => word.capitalizeFirstLetter()).toList();
    return capitalizedWords.join(' ');
  }

  String getInitials() {
    List<String> words = split(' ');
    String initials = words
        .map((word) {
          if (word.isNotEmpty) {
            return word[0].toUpperCase();
          } else {
            return '';
          }
        })
        .where((initial) => initial.isNotEmpty)
        .join('');

    return initials;
  }

  String formatPhoneNumber() {
    if (length == 10 && int.tryParse(this) != null) {
      String numberWithZero = '0$this';
      return '+234$numberWithZero';
    } else {
      //remove zero from the number
      // String numberWithZero = replaceFirst('0', '');
      return '+234$this';
    }
  }

  String maskPhoneNumber() => replaceRange(7, 13, '*****');
}

extension NairaFormat on String {
  String formatAsNaira() {
    try {
      int value = int.parse(replaceAll(',', ''));
      String formattedValue = value.toStringAsFixed(0);
      String result =
          '₦ ${formattedValue.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
      return result;
    } catch (e) {
      return this; // Return the original string in case of an error
    }
  }
}

extension TextStyleBuildContext on BuildContext {
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
}

extension NavigationExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget widget, BuildContext context) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }
}

extension DateTimeFormatting on DateTime {
  String toFormattedString() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    final year = this.year.toString();

    return '$day/$month/$year';
  }

  bool isLessThan48HoursFromNow() {
    final now = DateTime.now();
    final difference = now.difference(this).inHours;
    return difference < 48;
  }

  String toFormattedLongString() {
    final String month = _getMonthAbbreviation();
    final String day = _addLeadingZero(this.day);
    final String year = this.year.toString();
    final String hour = _get12HourFormat();
    final String minute = _addLeadingZero(this.minute);
    final String amPm = this.hour < 12 ? 'AM' : 'PM';

    return '$month $day, $year $hour:$minute $amPm';
  }

  String _getMonthAbbreviation() {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  String _get12HourFormat() {
    int hour = this.hour % 12;
    hour = hour == 0 ? 12 : hour;
    return _addLeadingZero(hour);
  }

  String _addLeadingZero(int value) {
    return value < 10 ? '0$value' : '$value';
  }
}

extension SecondsToHoursMinutes on int {
  String toHoursMinutes() {
    final hours = this ~/ 3600;
    final minutes = (this % 3600) ~/ 60;
    if (hours == 1 && (minutes == 1 || minutes == 0)) {
      return '$hours Hr $minutes Min';
    } else if (hours == 1) {
      return '$hours Hr $minutes Mins';
    } else if (minutes == 1 || minutes == 0) {
      return '$hours Hrs $minutes Min';
    } else {
      return '$hours Hrs $minutes Mins';
    }
  }

  String toHours() {
    final hours = this ~/ 3600;
    return '${hours}Hrs';
  }
}
