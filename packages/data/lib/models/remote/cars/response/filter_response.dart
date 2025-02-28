import 'package:domain/model/cars/filter_model.dart';

class FilterResponse {
  final Map<String, int> categoryCounts;
  final Map<String, int> passengerCapacityCounts;
  final Map<String, int> cityCounts;

  FilterResponse({
    required this.categoryCounts,
    required this.passengerCapacityCounts,
    required this.cityCounts,
  });

  factory FilterResponse.fromJson(Map<String, dynamic> json) {
    return FilterResponse(
      categoryCounts: Map<String, int>.from(json['category_counts']),
      passengerCapacityCounts:
          Map<String, int>.from(json['passenger_capacity_counts']),
      cityCounts: Map<String, int>.from(json['city_counts']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_counts': categoryCounts,
      'passenger_capacity_counts': passengerCapacityCounts,
      'city_counts': cityCounts,
    };
  }
}

extension FilterMapper on FilterResponse {
  FilterModel toDomainModel() {
    return FilterModel(
      categoryCounts: categoryCounts.entries
          .map(
            (e) => Filter(
              count: e.value,
              title: e.key,
            ),
          )
          .toList(),
      cityCounts: cityCounts.entries
          .map(
            (e) => Filter(
              count: e.value,
              title: e.key,
            ),
          )
          .toList(),
      passengerCapacityCounts: passengerCapacityCounts.entries
          .map(
            (e) => Filter(
              count: e.value,
              title: e.key,
            ),
          )
          .toList(),
    );
  }
}
