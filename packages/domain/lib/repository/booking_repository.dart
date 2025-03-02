import 'package:domain/model/booking/booking_history_model.dart';
import 'package:domain/model/booking/booking_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class BookingRepository {
  Future<BaseResult<List<BookingHistoryModel>>> bookingHistory();

  Future<BaseResult<List<BookingModel>>> bookingList();
}
