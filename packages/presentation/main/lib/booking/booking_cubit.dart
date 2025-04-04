import 'package:domain/model/booking/booking_current_model.dart';
import 'package:domain/model/booking/booking_model.dart';
import 'package:domain/usecase/booking_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._bookingUseCase)
      : super(const BookingState(
          bookingList: [],
          bookingCurrent: [],
          bookingIsFinished: false,
        ));
  final BookingUseCase _bookingUseCase;

  Future<void> bookingList() async {
    var response = await _bookingUseCase.bookingList();
    if (response.success) {
      var booking = response.body;
      if (booking != null) {
        emit(state.copyWith(bookingList: booking));
      }
    } else {
      // emit(const HistoryState([]));
    }
  }

  Future<void> bookingCurrent() async {
    var response = await _bookingUseCase.bookingCurrent();
    if (response.success) {
      var booking = response.body;
      if (booking != null) {
        emit(state.copyWith(bookingCurrent: booking));
      }
    } else {
      // emit(const HistoryState([]));
    }
  }

  Future<void> finishBooking(num bookingId) async {
    var response = await _bookingUseCase.finishBooking(bookingId: bookingId);
    if (response.success) {
      bookingList();
      bookingCurrent();
      emit(state.copyWith(bookingIsFinished: true));
      state.copyWith(bookingIsFinished: false);
    }
  }

  Future<void> createReview({
    required num bookingId,
    required int rating,
    required String comment,
  }) async {
    var response = await _bookingUseCase.createReview(
      bookingId: bookingId,
      rating: rating,
      comment: comment,
    );
  }
}

final class BookingState extends Equatable {
  final List<BookingModel> bookingList;
  final List<BookingCurrentModel> bookingCurrent;
  final bool bookingIsFinished;

  const BookingState({
    required this.bookingList,
    required this.bookingCurrent,
    required this.bookingIsFinished,
  });

  BookingState copyWith({
    List<BookingModel>? bookingList,
    List<BookingCurrentModel>? bookingCurrent,
    bool? bookingIsFinished,
  }) {
    return BookingState(
      bookingList: bookingList ?? this.bookingList,
      bookingCurrent: bookingCurrent ?? this.bookingCurrent,
      bookingIsFinished: bookingIsFinished ?? this.bookingIsFinished,
    );
  }

  @override
  List<Object?> get props => [
        bookingList,
        bookingCurrent,
        bookingIsFinished,
      ];
}
