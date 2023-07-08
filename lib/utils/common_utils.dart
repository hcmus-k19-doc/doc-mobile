import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class CommonUtil {
  String formatTimeago(DateTime date, String locale) {
    try {
      return timeago.format(date, clock: DateTime.now(), locale: locale);
    } catch (error) {
      return "";
    }
  }

  String formatDate(DateTime date, String formatType) {
    try {
      final f = DateFormat(formatType);
      return f.format(date);
    } catch (error) {
      return "";
    }
  }
}
