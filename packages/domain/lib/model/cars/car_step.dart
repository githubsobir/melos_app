class CarStep1Entities {
  List<Make> makes;
  List<Model> models;
  List<City> cities;
  List<Transmission> transmission;

  CarStep1Entities({
    required this.makes,
    required this.models,
    required this.cities,
    required this.transmission,
  });
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
}

class Make {
  int id;
  String name;

  Make({
    required this.id,
    required this.name,
  });
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
}

class Transmission {
  String key;
  String label;

  Transmission({
    required this.key,
    required this.label,
  });
}
