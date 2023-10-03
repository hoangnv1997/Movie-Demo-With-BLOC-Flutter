import 'package:intl/intl.dart';
import 'package:moviedemo/utils/logger.dart';

class Timestamp {
  static String getCurrentTimeStamp() {
    DateTime now = DateTime.now();
    return ' timestamp: ${now.hour}:${now.minute}:${now.second}.${now.millisecond}';
  }

  static String getCurrentTimeStampInMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static String getTimeZone() {
    return DateTime.now().timeZoneName;
  }

  static String convertTimeVisitHistory({required String time}) {
    try {
      return DateFormat('y年M月d日 hh時mm分', 'ja').format(DateTime.parse(time));
    } catch (e) {
      logger.e("Error when convert time visit history: $e");
      return '';
    }
  }

  static String convertTimeVisitHistoryFromMilliseconds(
      {required String time}) {
    try {
      return DateFormat('y年M月d日 hh時mm分', 'ja')
          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(time)));
    } catch (e) {
      logger.e("Error when convert time visit history: $e");
      return '';
    }
  }

  /// input must be: yyyy-mm-dd
  static String getNumberDayTimeRemainCoupon(String time) {
    try {
      final timeCoupon = DateTime.parse(time);
      final timeRemain = timeCoupon.difference(DateTime.now()).inDays;
      if (timeRemain <= 0) return '0';
      return timeRemain.toString();
    } catch (e) {
      logger.e("Error when convert time visit history: $e");
      return '0';
    }
  }
}
