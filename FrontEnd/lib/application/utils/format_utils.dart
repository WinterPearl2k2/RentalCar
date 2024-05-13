import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormatUtils {
  const FormatUtils._();

  static String formatNumber(double amount) {
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    return formatter.format(amount);
  }

  static ThousandsFormatter thousandsFormatter() {
    return ThousandsFormatter();
  }
  static String removeDot(String text) {
    return text.replaceAll(".", "");
  }

  static String formatDistance(double distance) {
    String distanceString = '';
    if (distance < 1000) {
      distanceString = '${distance.toStringAsFixed(0)} m';
    } else {
      double kmDistance = distance / 1000;
      distanceString = '${kmDistance.toStringAsFixed(0)} km';
    }
    return distanceString;
  }

}

class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final cleanText = newValue.text.replaceAll(RegExp(r'\D'), '');
    final formattedText = _addDotSeparator(cleanText);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _addDotSeparator(String text) {
    final buffer = StringBuffer();
    final length = text.length;
    for (var i = 0; i < length; i++) {
      buffer.write(text[i]);
      final remainingDigits = length - i - 1;
      if (remainingDigits > 0 && remainingDigits % 3 == 0) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }
}