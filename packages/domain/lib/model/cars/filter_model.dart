// class FilterModel {
//   final List<Filter> categoryCounts;
//   final List<Filter> passengerCapacityCounts;
//   final List<Filter> cityCounts;
//   int? maxPrice;
//
//   FilterModel({
//     required this.categoryCounts,
//     required this.passengerCapacityCounts,
//     required this.cityCounts,
//   });
// }
//
// class Filter {
//   num count;
//   String title;
//   bool isSelected = false;
//
//   Filter({
//     required this.count,
//     required this.title,
//   });
// }
class FilterModel {
  final List<Filter> categoryCounts;
  final List<Filter> transmissionCounts;
  final List<Filter> passengerCapacityCounts;
  final List<Filter> cityCounts;
  final List<Filter> makeCounts;
  final List<Filter> modelCounts;
  int? maxPrice;

  FilterModel({
    required this.categoryCounts,
    required this.transmissionCounts,
    required this.passengerCapacityCounts,
    required this.cityCounts,
    required this.makeCounts,
    required this.modelCounts,
  });

  FilterModel copyWith({
    List<Filter>? categoryCounts,
    List<Filter>? transmissionCounts,
    List<Filter>? passengerCapacityCounts,
    List<Filter>? cityCounts,
    List<Filter>? makeCounts,
    List<Filter>? modelCounts,
  }) {
    return FilterModel(
      categoryCounts: categoryCounts ?? this.categoryCounts,
      transmissionCounts: transmissionCounts ?? this.transmissionCounts,
      passengerCapacityCounts: passengerCapacityCounts ?? this.passengerCapacityCounts,
      cityCounts: cityCounts ?? this.cityCounts,
      makeCounts: makeCounts ?? this.makeCounts,
      modelCounts: modelCounts ?? this.modelCounts,
    );
  }


}

class Filter {
  final String key;
  final String title;
  final int? count;
  bool isSelected;

  Filter({
    required this.key,
    required this.title,
    this.count,
    this.isSelected = false,
  });

  Filter copyWith({
    String? title,
    int? count,
    bool? isSelected,
  }) {
    return Filter(
      title: title ?? this.title,
      count: count ?? this.count,
      isSelected: isSelected ?? this.isSelected,
      key: '',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'key': key,
        'title': title,
        'count': count,
        'is_selected': isSelected,
      };
}
