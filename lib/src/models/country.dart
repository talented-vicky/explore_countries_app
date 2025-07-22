class Country {
  final String name;
  final String code;

  Country({required this.name, required this.code});

  factory Country.fromJson(Map<String, dynamic> jsonData) {
    return Country(
      code: jsonData['code'],
      name: jsonData['name'],
    );
  }
}
