import 'package:domain/model/booking/booking_current_model.dart';
import 'package:domain/model/booking/booking_history_model.dart';
import 'package:domain/model/booking/booking_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class BookingRepository {
  Future<BaseResult<List<BookingHistoryModel>>> bookingHistory();

  Future<BaseResult<List<BookingModel>>> bookingList();

  Future<BaseResult<List<BookingCurrentModel>>> bookingCurrent();

  Future<BaseResult<bool>> finishBooking({required num bookingId});

  Future<BaseResult<bool>> createReview({
    required num bookingId,
    required int rating,
    required String comment,
  });

  Future<BaseResult<String>> cancelBooking({required num bookingId});
}
