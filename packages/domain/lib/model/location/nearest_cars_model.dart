import 'package:domain/model/location/gps_model.dart';

class NearestCarsModel {
  NearestCarsModel({
    this.nearest,
    this.others,
  });

  List<GpsModel>? nearest;
  List<GpsModel>? others;
}
