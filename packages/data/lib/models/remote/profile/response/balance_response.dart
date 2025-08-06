import 'package:domain/model/profile/balance_model.dart';

class BalanceResponse {
  BalanceResponse({
    this.balance,
  });

  BalanceResponse.fromJson(dynamic json) {
    balance = json['balance'];
  }

  String? balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balance'] = balance;
    return map;
  }
}

extension BalanceMapper on BalanceResponse {
  BalanceModel toDomainModel() {
    return BalanceModel(
      balance: balance,
    );
  }
}
