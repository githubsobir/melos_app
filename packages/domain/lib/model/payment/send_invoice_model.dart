class SendInvoiceModel {
  SendInvoiceModel({
    this.message,
    this.invoiceModel,
  });

  String? message;
  InvoiceModel? invoiceModel;
}

class InvoiceModel {
  InvoiceModel({
    this.errorCode,
    this.errorNote,
    this.paymentId,
    this.url,
  });

  InvoiceModel.fromJson(dynamic json) {
    errorCode = json['error_code'];
    errorNote = json['error_note'];
    paymentId = json['payment_id'];
    url = json['url'];
  }

  num? errorCode;
  String? errorNote;
  num? paymentId;
  String? url;
}
