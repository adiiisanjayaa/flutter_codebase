import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateMethods {
  static DateTime? parse(String? date) {
    try {
      return DateTime.parse(date!);
    } catch (e) {
      return null;
    }
  }

  static bool isBeforeNow(String? date) {
    if (date == null) return false;
    return DateTime.parse(date).isBefore(DateTime.now());
  }

  static bool isAfterNow(String? date) {
    if (date == null) return false;
    return DateTime.parse(date).isAfter(DateTime.now());
  }

  static bool isAfter(String? dateA, String? dateB) {
    if (dateA == null || dateB == null) return false;
    return DateTime.parse(dateA).isAfter(DateTime.parse(dateB));
  }

  static bool isBefore(String? dateA, String? dateB) {
    if (dateA == null || dateB == null) return false;
    return DateTime.parse(dateA).isBefore(DateTime.parse(dateB));
  }

  static bool isYearPassed(String? date) {
    if (date == null) return false;
    final parsedDate = DateTime.parse(date);
    return parsedDate.year < DateTime.now().year;
  }

  static Duration _getGMTDuration() {
    //get current system local time
    DateTime? currentTime = DateTime?.now();
    //get time diff
    Duration timezoneOffset = currentTime.timeZoneOffset;
    return Duration(
      hours: timezoneOffset.inHours,
      minutes: timezoneOffset.inMinutes % 60,
    );
  }

  static DateTime? convertToGMT(DateTime? localDate) {
    if (localDate == null) return null;
    final Duration duration = _getGMTDuration();
    return localDate.subtract(duration);
  }

  static DateTime? convertFromGMT(String gmtDate) {
    final DateTime? oldDate = parse(gmtDate);
    if (oldDate == null) return null;
    final Duration duration = _getGMTDuration();
    return oldDate.add(duration);
  }

  static String? ddMMMyyyy(String date) {
    DateTime? parsedDate = parse(date);
    if (parsedDate == null) return "";
    try {
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } catch (e) {
      return "";
    }
  }

  static String? ddMMM(String date) {
    DateTime? parsedDate = parse(date);
    if (parsedDate == null) return "";
    try {
      return DateFormat('dd MMM').format(parsedDate);
    } catch (e) {
      return "";
    }
  }

  static String? ddMMMyyyyhhmma(
    dynamic date,
  ) {
    DateTime? parsedDate;
    if (date is DateTime?) {
      parsedDate = date;
    } else if (date is String?) {
      parsedDate = parse(date!);
    }
    if (parsedDate == null) return "";
    try {
      return DateFormat('dd MMM yyyy hh:mm a').format(parsedDate);
    } catch (e) {
      return "";
    }
  }

  static String? yyyyMMddhhmma(DateTime? date) {
    if (date == null) return "";
    try {
      return DateFormat('yyyy-MM-dd hh:mm a').format(date);
    } catch (e) {
      return "";
    }
  }

  static String? mMM(String date) {
    DateTime? parsedDate = parse(date);
    if (parsedDate == null) return "";
    try {
      return DateFormat(
        'MMM',
        Get.locale.toString(),
      ).format(parsedDate);
    } catch (e) {
      return "";
    }
  }

  static String? mMMyyyy(String date) {
    DateTime? parsedDate = parse(date);
    if (parsedDate == null) return "";
    try {
      return DateFormat(
        'MMMM yyyy',
        Get.locale.toString(),
      ).format(parsedDate);
    } catch (e) {
      return "";
    }
  }

  static int calculateMonthDifference(DateTime startDate, DateTime endDate) {
    return (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;
  }

  static String? ddMMMMyyyyhhmma(String dateStr) {
    if (dateStr.isEmpty) {
      return dateStr;
    }
    try {
      DateTime date = DateTime.parse(dateStr);
      String dateFormat = DateFormat('dd MMMM yyyy hh:mm a').format(date);
      DateTime dateUtc = DateFormat('dd MMMM yyyy hh:mm a').parse(dateFormat.toString(), true);
      String dateLocal = DateFormat('dd MMMM yyyy hh:mm a').format(dateUtc.toLocal());
      log('formattingDate dateUtc: $dateUtc -- dateLocal $dateLocal');
      return dateLocal.toString();
    } catch (e) {
      log('error $e');
    }
    return dateStr;
  }

  static String? ddMMMyyy(String dateStr) {
    if (dateStr.isEmpty) {
      return dateStr;
    }
    try {
      DateTime date = DateTime.parse(dateStr);
      String dateFormat = DateFormat('dd MMMM yyyy hh:mm a').format(date);
      DateTime dateUtc = DateFormat('dd MMMM yyyy hh:mm a').parse(dateFormat.toString(), true);
      String dateLocal = DateFormat('dd MMM yyyy').format(dateUtc.toLocal());
      log('formattingDate dateUtc: $dateUtc -- dateLocal $dateLocal');
      return dateLocal.toString();
    } catch (e) {
      log('error $e');
    }
    return dateStr;
  }

  static String? ddMMMyyyhhmma(String dateStr) {
    if (dateStr.isEmpty) {
      return dateStr;
    }
    try {
      DateTime date = DateTime.parse(dateStr);
      String dateFormat = DateFormat('dd MMMM yyyy hh:mm a').format(date);
      DateTime dateUtc = DateFormat('dd MMMM yyyy hh:mm a').parse(dateFormat.toString(), true);
      String dateLocal = DateFormat('dd MMM yyyy hh:mm a').format(dateUtc.toLocal());
      log('formattingDate dateUtc: $dateUtc -- dateLocal $dateLocal');
      return dateLocal.toString();
    } catch (e) {
      log('error $e');
    }
    return dateStr;
  }
}
