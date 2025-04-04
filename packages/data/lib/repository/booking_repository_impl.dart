import 'package:data/models/remote/booking/booking_current_response.dart';
import 'package:data/models/remote/booking/booking_history_response.dart';
import 'package:data/models/remote/booking/booking_response.dart';
import 'package:data/service/booking_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/booking/booking_current_model.dart';
import 'package:domain/model/booking/booking_history_model.dart';
import 'package:domain/model/booking/booking_model.dart';
import 'package:domain/repository/booking_repository.dart';
import 'package:domain/utils/base_result.dart';

class BookingRepositoryImpl extends BookingRepository {
  final BookingService _bookingService;

  BookingRepositoryImpl(this._bookingService);

  @override
  Future<BaseResult<List<BookingHistoryModel>>> bookingHistory() async {
    try {
      var response = await _bookingService.bookingHistory();
      return BaseResult(
        success: true,
        body: BookingHistoryResponse.listFromJson(response.data)
            .map(
              (e) => e.toDomainModel(),
            )
            .toList(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<List<BookingModel>>> bookingList() async {
    try {
      var response = await _bookingService.bookingList();
      return BaseResult(
        success: true,
        body: BookingResponse.listFromJson(response.data)
            .map(
              (e) => e.toDomainModel(),
            )
            .toList(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<List<BookingCurrentModel>>> bookingCurrent() async {
    try {
      var response = await _bookingService.bookingCurrent();
      return BaseResult(
        success: true,
        body: BookingCurrentResponse.listFromJson(response.data)
            .map(
              (e) => e.toDomainModel(),
            )
            .toList(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> finishBooking({required num bookingId}) async {
    try {
      var response = await _bookingService.finishBooking(bookingId: bookingId);
      return BaseResult(
        success: true,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> createReview({
    required num bookingId,
    required int rating,
    required String comment,
  }) async {
    try {
      var response = await _bookingService.createReview(
        bookingId: bookingId,
        rating: rating,
        comment: comment,
      );
      return BaseResult(
        success: true,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}
