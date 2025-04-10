class FilterModel {
  final List<Filter> categoryCounts;
  final List<Filter> passengerCapacityCounts;
  final List<Filter> cityCounts;
  int? maxPrice;

  FilterModel({
    required this.categoryCounts,
    required this.passengerCapacityCounts,
    required this.cityCounts,
  });
}

class Filter {
  num count;
  String title;
  bool isSelected = false;

  Filter({
    required this.count,
    required this.title,
  });
}
