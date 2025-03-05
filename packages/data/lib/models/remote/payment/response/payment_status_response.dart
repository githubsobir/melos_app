import 'package:domain/model/payment/payment_status_model.dart';

class PaymentStatusResponse {
  PaymentStatusResponse({
    this.status,
    this.bookingId,
  });

  PaymentStatusResponse.fromJson(dynamic json) {
    status = json['status'];
    bookingId = json['booking_id'];
  }

  num? status;
  num? bookingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['booking_id'] = bookingId;
    return map;
  }
}

extension PaymentStatusMapper on PaymentStatusResponse {
  PaymentStatusModel toDomainModel() {
    return PaymentStatusModel(
      status: status,
      bookingId: bookingId,
    );
  }
}
