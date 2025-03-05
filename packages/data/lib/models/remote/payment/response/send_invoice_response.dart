import 'package:domain/model/payment/send_invoice_model.dart';

class SendInvoiceResponse {
  SendInvoiceResponse({
    this.message,
    this.invoiceResponse,
  });

  SendInvoiceResponse.fromJson(dynamic json) {
    message = json['message'];
    invoiceResponse = json['invoice_response'] != null
        ? InvoiceResponse.fromJson(json['invoice_response'])
        : null;
  }

  String? message;
  InvoiceResponse? invoiceResponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (invoiceResponse != null) {
      map['invoice_response'] = invoiceResponse?.toJson();
    }
    return map;
  }
}

class InvoiceResponse {
  InvoiceResponse({
    this.errorCode,
    this.errorNote,
    this.paymentId,
    this.url,
  });

  InvoiceResponse.fromJson(dynamic json) {
    errorCode = json['error_code'];
    errorNote = json['error_note'];
    paymentId = json['payment_id'];
    url = json['url'];
  }

  num? errorCode;
  String? errorNote;
  num? paymentId;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = errorCode;
    map['error_note'] = errorNote;
    map['payment_id'] = paymentId;
    map['url'] = url;
    return map;
  }
}

extension SendInvoiceMapper on SendInvoiceResponse {
  SendInvoiceModel toDomainModel() {
    return SendInvoiceModel(
      message: message,
      invoiceModel: InvoiceModel(
        errorCode: invoiceResponse?.errorCode,
        errorNote: invoiceResponse?.errorNote,
        paymentId: invoiceResponse?.paymentId,
        url: invoiceResponse?.url,
      ),
    );
  }
}
