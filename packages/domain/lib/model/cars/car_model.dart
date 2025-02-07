class CarModel {
  CarModel({
    this.id,
    this.make,
    this.category,
    this.fuelCapacity,
    this.transmission,
    this.passengerCapacity,
    this.dailyRate,
    this.originalPrice,
    this.photo,
    this.liked,
  });

  num? id;
  String? make;
  String? category;
  num? fuelCapacity;
  String? transmission;
  num? passengerCapacity;
  String? dailyRate;
  String? originalPrice;
  String? photo;
  bool? liked;
}
