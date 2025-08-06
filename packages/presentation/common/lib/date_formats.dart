import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormats {

  static dateFormat(String date,BuildContext context) {
    DateTime parseDate = DateTime.parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat.yMMMd(Localizations.localeOf(context).languageCode);
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}