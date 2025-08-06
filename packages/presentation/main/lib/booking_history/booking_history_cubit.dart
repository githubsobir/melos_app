import 'package:domain/model/booking/booking_history_model.dart';
import 'package:domain/usecase/booking_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingHistoryCubit extends Cubit<BookingHistoryState> {
  BookingHistoryCubit(this._bookingUseCase) : super(BookingHistoryInitial());
  final BookingUseCase _bookingUseCase;

  Future<void> bookingHistory() async {
    // if (!await _bookingUseCase.hasUser()) return;
    emit(LoadingState());
    var response = await _bookingUseCase.bookingHistory();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(HistoryState(cars));
      }
    } else {
      emit(const HistoryState([]));
    }
  }

// Future<void> bookingList() async {
//   // if (!await _bookingUseCase.hasUser()) return;
//   emit(LoadingState());
//   var response = await _bookingUseCase.bookingList();
//   if (response.success) {
//     var cars = response.body;
//     if (cars != null) {
//       emit(CarsState(cars));
//     }
//   } else {
//     emit(const CarsState([]));
//   }
// }
}

sealed class BookingHistoryState extends Equatable {
  const BookingHistoryState();
}

final class BookingHistoryInitial extends BookingHistoryState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends BookingHistoryState {
  @override
  List<Object> get props => [];
}

final class HistoryState extends BookingHistoryState {
  final List<BookingHistoryModel> histories;

  const HistoryState(this.histories);

  @override
  List<Object> get props => [histories];
}
