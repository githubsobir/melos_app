import 'package:domain/model/contracts/contract_owner_model.dart';

class ContractOwnerResponse {
  ContractOwnerResponse({
      this.id, 
      this.photo, 
      this.rentalDays, 
      this.dailyRate, 
      this.securityDeposit, 
      this.totalAmount, 
      this.clientName, 
      this.clientProfileImage, 
      this.clientPhoneNumber, 
      this.paymentMethod, 
      this.clientDocument,});

  ContractOwnerResponse.fromJson(dynamic json) {
    id = json['id'];
    photo = json['photo'];
    rentalDays = json['rental_days'];
    dailyRate = json['daily_rate'];
    securityDeposit = json['security_deposit'];
    totalAmount = json['total_amount'];
    clientName = json['client_name'];
    clientProfileImage = json['client_profile_image'];
    clientPhoneNumber = json['client_phone_number'];
    paymentMethod = json['payment_method'];
    clientDocument = json['client_document'];
  }
  num? id;
  String? photo;
  num? rentalDays;
  String? dailyRate;
  String? securityDeposit;
  String? totalAmount;
  String? clientName;
  String? clientProfileImage;
  String? clientPhoneNumber;
  String? paymentMethod;
  String? clientDocument;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photo'] = photo;
    map['rental_days'] = rentalDays;
    map['daily_rate'] = dailyRate;
    map['security_deposit'] = securityDeposit;
    map['total_amount'] = totalAmount;
    map['client_name'] = clientName;
    map['client_profile_image'] = clientProfileImage;
    map['client_phone_number'] = clientPhoneNumber;
    map['payment_method'] = paymentMethod;
    map['client_document'] = clientDocument;
    return map;
  }

}

extension ContactOwnerMapper on ContractOwnerResponse {
  ContractOwnerModel toDomainModel() {
    return ContractOwnerModel(
      id: id,
      photo: photo,
      rentalDays: rentalDays,
      dailyRate: dailyRate,
      securityDeposit: securityDeposit,
      totalAmount: totalAmount,
      clientName: clientName,
      clientProfileImage: clientProfileImage,
      clientPhoneNumber: clientPhoneNumber,
      paymentMethod: paymentMethod,
      clientDocument: clientDocument,
    );
  }
}