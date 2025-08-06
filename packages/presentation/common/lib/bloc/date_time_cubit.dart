// import 'dart:developer';

import 'package:common/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/adapters.dart';

class DateTimeCubit extends Cubit<DateTimeVariable?> {
  // final box = Hive.box("myBox");

  DateTimeCubit()
      : super(
    DateTimeVariable(
      startTime:
          DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 0),
      endTime:
          DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1, 6, 0),
    ),
  );
  void setDateTime(DateTime start, DateTime end) {
    // box.put("startTime", start);
    // box.put("endTime", end);
    emit(DateTimeVariable(startTime: start, endTime: end));
  }

  void clear() {
    emit(null);
  }
}