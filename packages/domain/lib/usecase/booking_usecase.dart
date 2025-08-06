import 'package:domain/model/booking/booking_current_model.dart';
import 'package:domain/model/booking/booking_history_model.dart';
import 'package:domain/model/booking/booking_model.dart';
import 'package:domain/repository/booking_repository.dart';
import 'package:domain/utils/base_result.dart';

class BookingUseCase {
  final BookingRepository _bookingRepository;

  BookingUseCase(this._bookingRepository);

  Future<BaseResult<List<BookingHistoryModel>>> bookingHistory() {
    return _bookingRepository.bookingHistory();
  }

  Future<BaseResult<List<BookingModel>>> bookingList() async{
    return await _bookingRepository.bookingList();
  }

  Future<BaseResult<List<BookingCurrentModel>>> bookingCurrent() {
    return _bookingRepository.bookingCurrent();
  }

  Future<BaseResult<bool>> finishBooking({required num bookingId}) {
    return _bookingRepository.finishBooking(bookingId: bookingId);
  }

  Future<BaseResult<bool>> createReview({
    required num bookingId,
    required int rating,
    required String comment,
  }) {
    return _bookingRepository.createReview(
      bookingId: bookingId,
      rating: rating,
      comment: comment,
    );
  }

  Future<BaseResult<String>> cancelBooking({required num bookingId}) {
    return _bookingRepository.cancelBooking(bookingId: bookingId);
  }
}
