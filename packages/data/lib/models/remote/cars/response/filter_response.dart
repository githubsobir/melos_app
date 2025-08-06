import 'package:domain/model/cars/filter_model.dart';
class FilterResponse {
  List<Category> categories;
  List<PassengerCapacity> passengerCapacity;
  List<Category> transmission;
  List<City> cities;
  List<Make> makes;
  List<Model> models;

  FilterResponse({
    required this.categories,
    required this.passengerCapacity,
    required this.transmission,
    required this.cities,
    required this.makes,
    required this.models,
  });

  factory FilterResponse.fromJson(Map<String, dynamic> json) => FilterResponse(
    categories: json["categories"] != null
        ? List<Category>.from(json["categories"].map((x) => Category.fromJson(x)))
        : [],
    passengerCapacity: json["passenger_capacity"] != null
        ? List<PassengerCapacity>.from(
        json["passenger_capacity"].map((x) => PassengerCapacity.fromJson(x)))
        : [],
    transmission: json["transmission"] != null
        ? List<Category>.from(json["transmission"].map((x) => Category.fromJson(x)))
        : [],
    cities: json["cities"] != null
        ? List<City>.from(json["cities"].map((x) => City.fromJson(x)))
        : [],
    makes: json["makes"] != null
        ? List<Make>.from(json["makes"].map((x) => Make.fromJson(x)))
        : [],
    models: json["models"] != null
        ? List<Model>.from(json["models"].map((x) => Model.fromJson(x)))
        : [],
  );


  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "passenger_capacity": List<dynamic>.from(passengerCapacity.map((x) => x.toJson())),
    "transmission": List<dynamic>.from(transmission.map((x) => x.toJson())),
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    "makes": List<dynamic>.from(makes.map((x) => x.toJson())),
    "models": List<dynamic>.from(models.map((x) => x.toJson())),
  };
}

class Category {
  String key;
  String label;

  Category({
    required this.key,
    required this.label,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    key: json["key"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "label": label,
  };
}

class City {
  int id;
  String nameUz;
  String nameRu;

  City({
    required this.id,
    required this.nameUz,
    required this.nameRu,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    nameUz: json["name_uz"],
    nameRu: json["name_ru"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_uz": nameUz,
    "name_ru": nameRu,
  };
}

class Make {
  int id;
  String name;

  Make({
    required this.id,
    required this.name,
  });

  factory Make.fromJson(Map<String, dynamic> json) => Make(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Model {
  int id;
  String name;
  int makeId;

  Model({
    required this.id,
    required this.name,
    required this.makeId,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    name: json["name"],
    makeId: json["make_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "make_id": makeId,
  };
}

class PassengerCapacity {
  int key;
  String label;

  PassengerCapacity({
    required this.key,
    required this.label,
  });

  factory PassengerCapacity.fromJson(Map<String, dynamic> json) => PassengerCapacity(
    key: json["key"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "label": label,
  };
}
extension FilterMapper on FilterResponse {
  FilterModel toDomainModel() {
    List<Filter> _safeMap<T>(
        List<T>? items,
        String Function(T) getKey,
        String Function(T) getTitle,
        ) {
      return (items ?? [])
          .map((e) => Filter(
        key: getKey(e),
        title: getTitle(e),
      ))
          .toList();
    }

    return FilterModel(
      categoryCounts: _safeMap<Category>(
        categories,
            (e) => e.key,
            (e) => e.label,
      ),
      transmissionCounts: _safeMap<Category>(
        transmission,
            (e) => e.key,
            (e) => e.label,
      ),
      passengerCapacityCounts: _safeMap<PassengerCapacity>(
        passengerCapacity,
            (e) => e.key.toString(),
            (e) => e.label,
      ),
      cityCounts: _safeMap<City>(
        cities,
            (e) => e.id.toString(),
            (e) => e.nameUz,
      ),
      makeCounts: _safeMap<Make>(
        makes,
            (e) => e.id.toString(),
            (e) => e.name,
      ),
      modelCounts: _safeMap<Model>(
        models,
            (e) => e.id.toString(),
            (e) => e.name,
      ),
    );
  }
}


// extension FilterMapper on FilterResponse {
//   FilterModel toDomainModel() {
//     return FilterModel(
//       categoryCounts: categoryCounts.entries
//           .map(
//             (e) => Filter(
//           count: e.value,
//           title: e.key,
//         ),
//       )
//           .toList(),
//       cityCounts: cityCounts.entries
//           .map(
//             (e) => Filter(
//           count: e.value,
//           title: e.key,
//         ),
//       )
//           .toList(),
//       passengerCapacityCounts: passengerCapacityCounts.entries
//           .map(
//             (e) => Filter(
//           count: e.value,
//           title: e.key,
//         ),
//       )
//           .toList(),
//     );
//   }
// }
