import 'package:intl/intl.dart';
import 'package:logger/logger.dart';


class DateUtility {
  static String getChatDate({required int timeInMilliSeconds}) {
    try {
      return DateFormat("h:mm a").format(DateTime.parse(
          DateTime.fromMillisecondsSinceEpoch(timeInMilliSeconds).toString()));
    } catch (e) {
      Logger().e("getChatDate", e);
      return '';
    }
  }

}
