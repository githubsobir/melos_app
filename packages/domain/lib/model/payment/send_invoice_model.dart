class InvoiceModel {
  InvoiceModel({
    this.errorCode,
    this.errorNote,
    this.paymentId,
    this.message,
    this.url,
  });

  InvoiceModel.fromJson(dynamic json) {
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
}
