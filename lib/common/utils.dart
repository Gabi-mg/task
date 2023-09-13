import 'package:intl/intl.dart';

class Utils {
  static String convertDate(int dateMilliseconds, [String? locale]) {
    final date = DateTime.fromMillisecondsSinceEpoch(dateMilliseconds);
    return DateFormat('EEEE d MMM hh:mm:ss', locale).format(date);
  }
}
