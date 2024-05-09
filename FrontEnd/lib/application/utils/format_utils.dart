import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormatUtils {
  const FormatUtils._();

  static String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    return formatter.format(amount);
  }

  static String formatKilometers(int kilometers) {
    final formatter = NumberFormat('#,###');
    if (kilometers >= 1000) {
      return formatter.format(kilometers);
    } else {
      return kilometers.toString();
    }
  }

  static ThousandsFormatter thousandsFormatter() {
    return ThousandsFormatter();
  }
  static String removeDot(String text) {
    return text.replaceAll(".", "");
  }

}

class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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


