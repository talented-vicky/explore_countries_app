class Continent {
  final String name;
  final String code;

  Continent({required this.name, required this.code});

  factory Continent.fromJson(Map<String, dynamic> jsonData) {
    return Continent(
      name: jsonData['name'],
      code: jsonData['code'],
    );
  }
}

class Country {
  final String name;
  final String code;
  final String emoji;
  final String phone;
  String? capital;
  final Continent continent;

  Country({
    required this.name,
    required this.code,
    required this.emoji,
    required this.phone,
    this.capital,
    required this.continent,
  });

  factory Country.fromJson(Map<String, dynamic> jsonData) {
    return Country(
      name: jsonData['name'],
      capital: jsonData['capital'],
      code: jsonData['code'],
      emoji: jsonData['emoji'],
      phone: jsonData['phone'],
      continent: Continent.fromJson(jsonData['continent']),
    );
  }
}
