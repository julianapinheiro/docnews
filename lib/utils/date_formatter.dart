import 'package:intl/intl.dart';

class DateFormatter {
  static String toArticleDate(DateTime date) {
    return DateFormat("MMMM d, y", 'en_US').format(date);
  }
}
