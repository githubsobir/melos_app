import 'package:domain/model/payment/send_invoice_model.dart';

class InvoiceResponse {
  InvoiceResponse({
    this.errorCode,
    this.errorNote,
    this.paymentId,
    this.message,
    this.url,
  });

  InvoiceResponse.fromJson(dynamic json) {
    errorCode = json['error_code'];
    errorNote = json['error_note'];
    paymentId = json['payment_id'];
    message = json['message'];
    url = json['url'];
  }

  num? errorCode;
  String? errorNote;
  num? paymentId;
  String? message;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = errorCode;
    map['error_note'] = errorNote;
    map['payment_id'] = paymentId;
    map['message'] = message;
    map['url'] = url;
    return map;
  }
}

extension SendInvoiceMapper on InvoiceResponse {
  InvoiceModel toDomainModel() {
    return InvoiceModel(
      errorCode: errorCode,
      errorNote: errorNote,
      paymentId: paymentId,
      message: message,
      url: url,
    );
  }
}
