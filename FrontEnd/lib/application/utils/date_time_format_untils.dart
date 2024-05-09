import 'package:intl/intl.dart';

class DateTimeFormatUtils {
  DateTimeFormatUtils._();

  static String dateToFormat({
    required DateTime date,
    required String format,
  }) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  static int pareDate({
    required String date1,
    required String date2,
  }) {
    DateTime dateTime1 = DateTime.parse(date1);
    DateTime dateTime2 = DateTime.parse(date2);
    Duration difference = dateTime1.difference(dateTime2);
    return difference.inSeconds;
  }
}
