import 'package:intl/intl.dart';

class DateTimeFormatUtils {
  DateTimeFormatUtils._();

  static String dateToFormat({
    required String date,
    required String format,
  }) {
    DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
    return DateFormat(format).format(dateTime);
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
