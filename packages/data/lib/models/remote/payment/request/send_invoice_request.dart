class SendInvoiceRequest {
  SendInvoiceRequest({
    this.amount,
    this.carId,
    this.paymentMethod,
    this.startDateTime,
    this.endDateTime,
  });

  SendInvoiceRequest.fromJson(dynamic json) {
    amount = json['amount'];
    carId = json['car_id'];
    paymentMethod = json['payment_method'];
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
  }

  String? amount;
  num? carId;
  String? paymentMethod;
  String? startDateTime;
  String? endDateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['car_id'] = carId;
    map['payment_method'] = paymentMethod;
    map['start_date_time'] = startDateTime;
    map['end_date_time'] = endDateTime;
    return map;
  }
}
