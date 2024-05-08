import 'package:intl/intl.dart';

class FormatUtils {
  const FormatUtils._();

  static String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    return formatter.format(amount);
  }

  static String formatKilometers(int kilometers) {
    if (kilometers >= 1000) {
      return '${(kilometers / 1000).toStringAsFixed(1)} km';
    } else {
      return '${kilometers.toStringAsFixed(1)} m';
    }
  }
}
