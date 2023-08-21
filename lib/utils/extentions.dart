import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// extension HexColor on Color {
//   static Color getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF$hexColor";
//     }
//     return Color(int.parse(hexColor, radix: 16));
//   }

//   static Color fromHex(String hexColor) => getColorFromHex(hexColor);
// }

String generateRandomString(int len) {
  var r = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

extension GlobalKeyExtension on GlobalKey {
  Rect get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return Rect.zero;
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalize())
      .join(' ');
}

extension RandomOfDigits on Random {
  /// Generates a non-negative random integer with a specified number of digits.
  /// Supports [digitCount] values between 1 and 9 inclusive.
  ///
  num generateNumbers(int digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    int min = digitCount == 1 ? 0 : pow(10, digitCount - 1) as int;
    int max = pow(10, digitCount) as int;
    return min + nextInt(max - min);
  }

  // Usage:
  //  final random = Random();
  //  random.generateNumbers(6); // Generates a 6 digit number.
}

extension DoubleExtension on double {
  String removeTrailingZeros() {
    String stringValue = toString();

    //* Remove decimal point and trailing zeros if there are only zeros after decimal.
    if (stringValue.contains('.') && RegExp(r'\.0+$').hasMatch(stringValue)) {
      stringValue = stringValue.replaceAll(RegExp(r'\.0+$'), '');
    }

    //* Remove trailing zeros after the decimal point.
    if (stringValue.contains('.')) {
      stringValue = stringValue.replaceAll(RegExp(r'0+$'), '');

      //* Remove the decimal point if there are no digits after it.
      if (stringValue.endsWith('.')) {
        stringValue = stringValue.substring(0, stringValue.length - 1);
      }
    }

    //* Limit the number of decimal places to 2 if the number has some non-zero digits after the decimal.
    if (stringValue.contains('.') && !RegExp(r'\.0+$').hasMatch(stringValue)) {
      double parsedValue = double.parse(stringValue);
      stringValue = parsedValue.toStringAsFixed(2);
    }

    return stringValue;
  }
}

extension ExtendedFlex on Flex {
  int get childCount => children.length;
}

extension ExtendedText on Widget {
  alignAtStart() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: this,
    );
  }

  alignAtCenter() {
    return Align(
      alignment: AlignmentDirectional.center,
      child: this,
    );
  }

  alignAtEnd() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: this,
    );
  }
}

extension DateTimeExtension on DateTime {
  String get humanizeDate {
    return "$day/$month/$year ";
  }

  String yearMonthdate() {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }

  String dateTime12Hours() {
    final formatter = DateFormat('dd/MM/yyyy hh:mm aa');
    return formatter.format(this);
  }

  String dateTime24Hours() {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(this);
  }

  String time12Hours() {
    final formatter = DateFormat('hh:mm aa');
    return formatter.format(this);
  }

  String time24Hours() {
    final formatter = DateFormat('HH:mm');
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension NumberConverter on num {
  static const Map<String, String> arabicDigits = <String, String>{
    '0': '\u0660',
    '1': '\u0661',
    '2': '\u0662',
    '3': '\u0663',
    '4': '\u0664',
    '5': '\u0665',
    '6': '\u0666',
    '7': '\u0667',
    '8': '\u0668',
    '9': '\u0669',
  };

  String toArabicDigits() {
    final String number = toString();
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      sb.write(arabicDigits[number[i]] ?? number[i]);
    }
    return sb.toString();
  }
}

extension SeparatedList<T> on List<T> {
  List<T> separated(T separator) {
    final newList = <T>[];
    for (var i = 0; i < length; i++) {
      if (i == 0) {
        newList.add(this[i]);
      } else {
        newList.add(separator);
        newList.add(this[i]);
      }
    }
    return newList;
  }
}

extension ThemedSlider on Slider {
  static Widget withTheme({
    Key? key,
    required double value,
    required Function(double) onChanged,
    Function(double)? onChangeStart,
    Function(double)? onChangeEnd,
    double min = 0.0,
    double max = 1.0,
    int? divisions,
    String? label,
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    MouseCursor? mouseCursor,
    String Function(double)? semanticFormatterCallback,
    FocusNode? focusNode,
    bool autofocus = false,
    required SliderThemeData themeData,
  }) {
    return SliderTheme(
      data: themeData,
      child: Slider(
        key: key,
        value: value,
        onChanged: onChanged,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        thumbColor: thumbColor,
        mouseCursor: mouseCursor,
        semanticFormatterCallback: semanticFormatterCallback,
        focusNode: focusNode,
        autofocus: autofocus,
      ),
    );
  }
}
