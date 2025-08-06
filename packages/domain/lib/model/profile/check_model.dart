class CheckModel {
  CheckModel({
    this.total,
    this.totalsByStatus,
    this.invoices,
  });

  String? total;
  TotalsByStatusModel? totalsByStatus;
  List<InvoiceModel>? invoices;
}

class InvoiceModel {
  InvoiceModel({
    this.id,
    this.amount,
    this.createdAt,
    this.status,
  });

  num? id;
  String? amount;
  String? createdAt;
  String? status;
}

class TotalsByStatusModel {
  TotalsByStatusModel({
    this.pending,
    this.approved,
    this.rejected,
  });

  String? pending;
  String? approved;
  String? rejected;
}
