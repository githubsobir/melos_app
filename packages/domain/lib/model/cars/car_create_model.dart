class CarCreateModel {
  CarCreateModel({
    this.processNumber,
    this.make,
    this.model,
    this.year,
    this.category,
    this.fuelCapacity,
    this.mileage,
    this.transmission,
    this.passengerCapacity,
    this.registrationNumber,
    this.dailyRate,
    this.description,
    this.city,
    this.port,
    this.uniqueId,
    this.latitude,
    this.longitude,
    this.photos,
    this.document,
  });

  num? processNumber;
  String? make;
  String? model;
  num? year;
  String? category;
  num? fuelCapacity;
  num? mileage;
  String? transmission;
  String? passengerCapacity;
  String? registrationNumber;
  num? dailyRate;
  String? description;
  String? city;
  String? port;
  String? uniqueId;
  double? latitude;
  double? longitude;
  List<String>? photos;
  String? document;

  CarCreateModel copyWith(
          {num? processNumber,
          String? make,
          String? model,
          num? year,
          String? category,
          num? fuelCapacity,
          num? mileage,
          String? transmission,
          String? passengerCapacity,
          String? registrationNumber,
          num? dailyRate,
          String? description,
          String? city,
          String? port,
          String? uniqueId,
          double? latitude,
          double? longitude,
          List<String>? photos,
          String? document}) =>
      CarCreateModel(
        processNumber: processNumber ?? this.processNumber,
        make: make ?? this.make,
        model: model ?? this.model,
        year: year ?? this.year,
        category: category ?? this.category,
        fuelCapacity: fuelCapacity ?? this.fuelCapacity,
        mileage: mileage ?? this.mileage,
        transmission: transmission ?? this.transmission,
        passengerCapacity: passengerCapacity ?? this.passengerCapacity,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        dailyRate: dailyRate ?? this.dailyRate,
        description: description ?? this.description,
        city: city ?? this.city,
        port: port ?? this.port,
        uniqueId: uniqueId ?? this.uniqueId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        photos: photos ?? this.photos,
        document: document ?? this.document,
      );
}
