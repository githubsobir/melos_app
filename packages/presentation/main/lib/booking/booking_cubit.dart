import 'dart:convert';
import 'dart:developer';

import 'package:common/widgets/custom_functions.dart';
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
          loading: false,
          finishedBookingId: 0,
        ));
  final BookingUseCase _bookingUseCase;

  Future<void> bookingList() async {
    try {
      emit(state.copyWith(loading: true));
      var response = await _bookingUseCase.bookingList();
      if (response.success) {
        var booking = response.body;
        if (booking != null) {
          emit(state.copyWith(bookingList: booking, loading: false));
        } else {
          emit(state.copyWith(bookingCurrent: [], loading: false));
        }
      } else {
        emit(state.copyWith(bookingList: [], loading: false));
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(bookingList: [], loading: false));
    }
  }

  Future<void> bookingCurrent() async {
    try {
      emit(state.copyWith(loading: true));
      var response = await _bookingUseCase.bookingCurrent();
      if (response.success) {
        var booking = response.body;
        if (booking != null) {
          emit(state.copyWith(bookingCurrent: booking, loading: false));
        } else {
          emit(state.copyWith(bookingCurrent: [], loading: false));
        }
      } else {
        emit(state.copyWith(bookingCurrent: [], loading: false));
      }
    } catch (e) {
      emit(state.copyWith(bookingCurrent: [], loading: false));
    }
  }

  Future<void> finishBooking(num bookingId) async {
    emit(state.copyWith(bookingIsFinished: true));
    var response = await _bookingUseCase.finishBooking(bookingId: bookingId);
    if (response.success) {
      bookingList();
      bookingCurrent();
      emit(
        state.copyWith(
          finishedBookingId: bookingId,
          bookingIsFinished: false,
        ),
      );
    }
  }

  Future<void> createReview({
    required int rating,
    required String comment,
  }) async {
    var response = await _bookingUseCase.createReview(
      bookingId: state.finishedBookingId,
      rating: rating,
      comment: comment,
    );
  }

  Future<void> cancelBooking(num bookingId) async {
    var response = await _bookingUseCase.cancelBooking(bookingId: bookingId);
    if (response.success) {
      var data = DeleteMessage1.fromJson(jsonDecode(response.body ?? ""));
      showToastSms(data.message);
    } else {
      var data = DeleteMessage2.fromJson(jsonDecode(response.body ?? ""));
      showToastSms(data.nonFieldErrors.first.toString());

      // showToastSms(response.body.toString());
    }

    bookingList();
    bookingCurrent();
  }
}

final class BookingState extends Equatable {
  final List<BookingModel> bookingList;
  final List<BookingCurrentModel> bookingCurrent;
  final bool bookingIsFinished;
  final num finishedBookingId;
  final bool loading;

  const BookingState({
    required this.bookingList,
    required this.bookingCurrent,
    required this.bookingIsFinished,
    required this.finishedBookingId,
    required this.loading,
  });

  BookingState copyWith({
    List<BookingModel>? bookingList,
    List<BookingCurrentModel>? bookingCurrent,
    bool? bookingIsFinished,
    num? finishedBookingId,
    bool? loading,
  }) {
    return BookingState(
      bookingList: bookingList ?? this.bookingList,
      loading: loading ?? this.loading,
      bookingCurrent: bookingCurrent ?? this.bookingCurrent,
      bookingIsFinished: bookingIsFinished ?? this.bookingIsFinished,
      finishedBookingId: finishedBookingId ?? this.finishedBookingId,
    );
  }

  @override
  List<Object?> get props => [
        bookingList,
        bookingCurrent,
        bookingIsFinished,
        finishedBookingId,
        loading,
      ];
}

class DeleteMessage1 {
  String message;
  String newStatus;

  DeleteMessage1({
    required this.message,
    required this.newStatus,
  });

  factory DeleteMessage1.fromJson(Map<String, dynamic> json) => DeleteMessage1(
        message: json["message"],
        newStatus: json["new_status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "new_status": newStatus,
      };
}

class DeleteMessage2 {
  List<String> nonFieldErrors;

  DeleteMessage2({
    required this.nonFieldErrors,
  });

  factory DeleteMessage2.fromJson(Map<String, dynamic> json) => DeleteMessage2(
        nonFieldErrors:
            List<String>.from(json["non_field_errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "non_field_errors": List<dynamic>.from(nonFieldErrors.map((x) => x)),
      };
}
