import 'package:intl/intl.dart';

class Utils {
  static String convertDate(int dateMilliseconds, [String? locale]) {
    final date = DateTime.fromMillisecondsSinceEpoch(dateMilliseconds);
    return DateFormat('EEEE d MMM hh:mm:ss', locale).format(date);
  }

  static String convertDateWithoutHour(int dateMilliseconds, [String? locale]) {
    final date = DateTime.fromMillisecondsSinceEpoch(dateMilliseconds);
    return DateFormat('EEEE d MMM', locale).format(date);
  }

  static bool isValidEmail(String e) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(e);
  }
}
