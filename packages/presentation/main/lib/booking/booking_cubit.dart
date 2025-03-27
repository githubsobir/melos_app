import 'package:domain/model/booking/booking_current_model.dart';
import 'package:domain/model/booking/booking_model.dart';
import 'package:domain/usecase/booking_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._bookingUseCase)
      : super(const BookingState(bookingList: [], bookingCurrent: []));
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
}

final class BookingState extends Equatable {
  final List<BookingModel> bookingList;
  final List<BookingCurrentModel> bookingCurrent;

  const BookingState({
    required this.bookingList,
    required this.bookingCurrent,
  });

  BookingState copyWith({
    List<BookingModel>? bookingList,
    List<BookingCurrentModel>? bookingCurrent,
  }) {
    return BookingState(
      bookingList: bookingList ?? this.bookingList,
      bookingCurrent: bookingCurrent ?? this.bookingCurrent,
    );
  }

  @override
  List<Object?> get props => [bookingList];
}
