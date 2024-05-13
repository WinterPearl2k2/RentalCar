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

  static DateTime parseDateString(String dateString) {
    DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss.S");
    return format.parse(dateString);
  }

  static DateTime stringToDateFormat({
    required String date,
    required String format,
  }) {
    final formatter = DateFormat(format);
    final dateTime = formatter.parse(date);
    return dateTime;
  }

  static String convertDateFormat({
    required String inputDate,
    required String format,
  }) {
    final initialDate = DateTime.parse(inputDate);
    final adjustedDateTime = initialDate.toLocal();
    final formattedDate = DateFormat(format).format(adjustedDateTime);
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
