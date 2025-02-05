class CarsModel {
  CarsModel({required this.recommendCars, required this.carsList});

  List<CarModel> recommendCars;
  List<CarModel> carsList;
}

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
    this.firstPhotoUrl,
  });

  num? id;
  String? make;
  String? category;
  num? fuelCapacity;
  String? transmission;
  num? passengerCapacity;
  num? dailyRate;
  num? originalPrice;
  String? firstPhotoUrl;

}
