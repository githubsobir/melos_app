import 'package:domain/model/profile/check_model.dart';

class CheckResponse {
  CheckResponse({
    this.total,
    this.totalsByStatus,
    this.invoices,
  });

  CheckResponse.fromJson(dynamic json) {
    total = json['total'];
    totalsByStatus = json['totals_by_status'] != null
        ? TotalsByStatus.fromJson(json['totals_by_status'])
        : null;
    if (json['invoices'] != null) {
      invoices = [];
      json['invoices'].forEach((v) {
        invoices?.add(Invoices.fromJson(v));
      });
    }
  }

  String? total;
  TotalsByStatus? totalsByStatus;
  List<Invoices>? invoices;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    if (totalsByStatus != null) {
      map['totals_by_status'] = totalsByStatus?.toJson();
    }
    if (invoices != null) {
      map['invoices'] = invoices?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Invoices {
  Invoices({
    this.id,
    this.amount,
    this.createdAt,
    this.status,
  });

  Invoices.fromJson(dynamic json) {
    id = json['id'];
    amount = json['amount'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  num? id;
  String? amount;
  String? createdAt;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['amount'] = amount;
    map['created_at'] = createdAt;
    map['status'] = status;
    return map;
  }
}

class TotalsByStatus {
  TotalsByStatus({
    this.pending,
    this.approved,
    this.rejected,
  });

  TotalsByStatus.fromJson(dynamic json) {
    pending = json['pending'];
    approved = json['approved'];
    rejected = json['rejected'];
  }

  String? pending;
  String? approved;
  String? rejected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pending'] = pending;
    map['approved'] = approved;
    map['rejected'] = rejected;
    return map;
  }
}

extension CheckMapper on CheckResponse {
  CheckModel toDomainModel() {
    return CheckModel(
      total: total,
      totalsByStatus: totalsByStatus?.toDomainModel(),
      invoices: invoices?.map((e) => e.toDomainModel()).toList(),
    );
  }
}

extension on Invoices {
  InvoiceModel toDomainModel() {
    return InvoiceModel(
      id: id,
      amount: amount,
      createdAt: createdAt,
      status: status,
    );
  }
}

extension on TotalsByStatus {
  TotalsByStatusModel toDomainModel() {
    return TotalsByStatusModel(
      pending: pending,
      approved: approved,
      rejected: rejected,
    );
  }
}
