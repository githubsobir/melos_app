import 'package:domain/model/cars/car_step.dart';
import 'package:domain/model/cars/car_step.dart' as entity;

class CarStep1Model {
  List<Make> makes;
  List<Model> models;
  List<City> cities;
  List<Transmission> transmission;

  CarStep1Model({
    required this.makes,
    required this.models,
    required this.cities,
    required this.transmission,
  });

  factory CarStep1Model.fromJson(Map<String, dynamic> json) => CarStep1Model(
        makes: List<Make>.from(json["makes"].map((x) => Make.fromJson(x))),
        models: List<Model>.from(json["models"].map((x) => Model.fromJson(x))),
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
        transmission: List<Transmission>.from(
            json["transmission"].map((x) => Transmission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "makes": List<dynamic>.from(makes.map((x) => x.toJson())),
        "models": List<dynamic>.from(models.map((x) => x.toJson())),
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
        "transmission": List<dynamic>.from(transmission.map((x) => x.toJson())),
      };
}

extension MyCarMapper on CarStep1Model {
  CarStep1Entities toDomainModel() {
    return CarStep1Entities(
      makes: makes.map((e) => e.toEntity()).toList(),
      models: models.map((e) => e.toEntity()).toList(),
      cities: cities.map((e) => e.toEntity()).toList(),
      transmission: transmission.map((e) => e.toEntity()).toList(),
    );
  }
}

extension MakeMapper on Make {
  entity.Make toEntity() => entity.Make(id: id, name: name);
}

extension ModelMapper on Model {
  entity.Model toEntity() => entity.Model(id: id, name: name, makeId: makeId);
}

extension CityMapper on City {
  entity.City toEntity() => entity.City(id: id, nameUz: nameUz, nameRu: nameRu);
}

extension TransmissionMapper on Transmission {
  entity.Transmission toEntity() =>
      entity.Transmission(key: key, label: label);
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

class Transmission {
  String key;
  String label;

  Transmission({
    required this.key,
    required this.label,
  });

  factory Transmission.fromJson(Map<String, dynamic> json) => Transmission(
        key: json["key"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "label": label,
      };
}
