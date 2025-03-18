class CarCreateModel {
  CarCreateModel({
    this.processNumber,
    this.make,
    this.model,
    this.year,
    this.category,
    this.fuelCapacity,
    this.transmission,
    this.passengerCapacity,
    this.registrationNumber,
    this.dailyRate,
    this.originalPrice,
    this.description,
    this.city,
    this.port,
    this.uniqueId,
  });

  num? processNumber;
  String? make;
  String? model;
  num? year;
  String? category;
  num? fuelCapacity;
  String? transmission;
  num? passengerCapacity;
  String? registrationNumber;
  String? dailyRate;
  String? originalPrice;
  String? description;
  String? city;
  String? port;
  String? uniqueId;

  CarCreateModel copyWith({
    num? processNumber,
    String? make,
    String? model,
    num? year,
    String? category,
    num? fuelCapacity,
    String? transmission,
    num? passengerCapacity,
    String? registrationNumber,
    String? dailyRate,
    String? originalPrice,
    String? description,
    String? city,
    String? port,
    String? uniqueId,
  }) =>
      CarCreateModel(
        processNumber: processNumber ?? this.processNumber,
        make: make ?? this.make,
        model: model ?? this.model,
        year: year ?? this.year,
        category: category ?? this.category,
        fuelCapacity: fuelCapacity ?? this.fuelCapacity,
        transmission: transmission ?? this.transmission,
        passengerCapacity: passengerCapacity ?? this.passengerCapacity,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        dailyRate: dailyRate ?? this.dailyRate,
        originalPrice: originalPrice ?? this.originalPrice,
        description: description ?? this.description,
        city: city ?? this.city,
        port: port ?? this.port,
        uniqueId: uniqueId ?? this.uniqueId,
      );
}
