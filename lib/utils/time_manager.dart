import 'package:fancricsport/res/appconfig.dart';
import 'package:intl/intl.dart';

class TimeManager {
  static final TimeManager _timeManager = TimeManager._init();

  factory TimeManager() {
    return _timeManager;
  }

  TimeManager._init();
  String displayOnlyDate(int time, {bool numericDates = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);

    String result = '';

    final DateFormat formatter = DateFormat(AppConfig.dateFormat);
    result = formatter.format(date);
    return result;
  }

/*  String getRemainTimeFromMilliSecond(int milliSecond) {
    String result;

    Duration dif = DateTime.fromMillisecondsSinceEpoch(milliSecond)
        .difference(DateTime.now());

    var test = dif.toString().split(':');

    if (dif.inSeconds < 0) {
      result = Strings.live;
    } else if (dif.inMinutes < 60) {
      result = '${test[1]}m ${test[2].split('.').first}s';
    } else if (dif.inMinutes < 2840) {
      result = '${test[0]}h ${test[1]}m';
    } else {
      result = '${dif.inDays} days';
    }
    return result;
  }*/

  String displayTimeAgoFromTimestamp(int time, {bool numericDates = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(date);

    String result = '';

    if (difference.inHours > 24) {
      final DateFormat formatter = DateFormat(AppConfig.dateTimeFormate);
      result = formatter.format(date);
    } else if (difference.inDays >= 1) {
      result = (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      result = '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      result = (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      result = '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      result = (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      result = '${difference.inSeconds} seconds ago';
    } else {
      final DateFormat formatter = DateFormat(AppConfig.dateTimeFormate);
      result = formatter.format(date);
    }
    return result;
  }

  static String setNewsUpdateTime(int? startTime) {
    String time;
    time = "${TimeManager().getNewsRemainTimeFromMilliSecond(startTime ?? 0)} ago";
    return time;
  }

  String getNewsRemainTimeFromMilliSecond(int milliSecond) {
    String result;

    Duration dif = DateTime.fromMillisecondsSinceEpoch(milliSecond).difference(DateTime.now());

    if (dif.inMicroseconds < 0) {
      dif = -dif;
    }

    var test = dif.toString().split(':');

    if (dif.inMinutes < 60) {
      result = '${test[1]}m ${test[2].split('.').first}s';
    } else if (dif.inMinutes < 1440) {
      result = '${test[0]}h ${test[1]}m';
    } else {
      result = '${dif.inDays} days';
    }
    return result;
  }

/*String displayTime(int time, {bool numericDates = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
    String result = '';

    final DateFormat formatter = DateFormat(Constant.dateTimeFormate);
    result = formatter.format(date);
    return result;
  }

  String displayOnlyTime(int time, {bool numericDates = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);

    String result = '';

    final DateFormat formatter = DateFormat(Constant.timeFormat);
    result = formatter.format(date);
    return result;
  }

  String displayOnlyDate(int time, {bool numericDates = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);

    String result = '';

    final DateFormat formatter = DateFormat(Constant.dateFormat);
    result = formatter.format(date);
    return result;
  }


  ntpTimeMillis() async {
    Strings.ntp = await NTP.now();
  }

  Future<int> timeDifference(QuestionDetail questionListModel) async {
    String showTime = questionListModel.showTime!;

    DateTime showtimeDateTime = DateFormat("dd-MM-yyyy hh:mm:ss:a").parse(showTime);

    String ntpFormat = DateFormat("dd-MM-yyyy hh:mm:ss:a").format(await NTP.now());

    DateTime ntpDateTime = DateFormat("dd-MM-yyyy hh:mm:ss:a").parse(ntpFormat);

    int dif = showtimeDateTime.difference(ntpDateTime).inSeconds;

    return dif;
  }

  DateTime stringToDateTimeConvert(String showTime) {

    // String ntpFormat = DateFormat("dd-MM-yyyy hh:mm:ss:a").format(await NTP.now());
    DateTime ntpDateTime = DateFormat("dd-MM-yyyy hh:mm:ss:a").parse(showTime);

    return ntpDateTime;
  }

  getNextQueRemainingMilliSecond(int minTime) async {
    String result;
    DateTime ntp = await NTP.now();
    String ntpFormated = DateFormat("dd-MM-yyyy hh:mm:ss:a").format(ntp);
    DateTime ntpDateTime =
        DateFormat("dd-MM-yyyy hh:mm:ss:a").parse(ntpFormated);

    Duration dif =
        DateTime.fromMillisecondsSinceEpoch(minTime).difference(ntpDateTime);

    if (dif.inMicroseconds < 0) {
      dif = -dif;
    }
    if (dif.inMicroseconds > 0) {
      var test = dif.toString().split(':');

      if (dif.inMinutes < 60) {
        result = '${test[1]}m ${test[2].split('.').first}s';
      } else if (dif.inMinutes < 1440) {
        result = '${test[0]}h ${test[1]}m';
      } else {
        result = '${dif.inDays} days';
      }
      return result;
    }
  }*/
}

/*
int showTimeMillis(showtime) {
  String showTime = showtime;
  DateTime showtimeDateTime =
      DateFormat("dd-MM-yyyy hh:mm:ss:a").parse(showTime);
  int showtimeMillisecondsSinceEpoch = showtimeDateTime.millisecondsSinceEpoch;
  return showtimeMillisecondsSinceEpoch;
}
*/
