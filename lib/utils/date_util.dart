import 'package:intl/intl.dart';

class DateUtil {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy hh:mm:ss a').format(dateTime);
  }

  static String formatDateTimeInUtc(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy hh:mm:ss a').format(dateTime.toUtc());
  }
}
