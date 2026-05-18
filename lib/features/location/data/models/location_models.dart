class GovernorateModel {
  final int id;
  final String name;
  final List<CityModel> cities;

  const GovernorateModel({
    required this.id,
    required this.name,
    required this.cities,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      id: json['id'] as int,
      name: json['name'] as String,
      cities: (json['cities'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

// =============================== City Model ===============================

class CityModel {
  final int id;
  final String name;

  const CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(id: json['id'] as int, name: json['name'] as String);
  }
}
