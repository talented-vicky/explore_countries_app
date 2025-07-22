import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/country.dart';

class CountryRepository {
  final GraphQLClient client;

  CountryRepository({required this.client});

  Future<List<Country>> fetchCountries() async {
    const String query = r'''
      query {
        countries {
          name
          capital
          code
          emoji
          phone
          continent {
            name
            code
          }
        }
      }
    ''';

    final result = await client.query(QueryOptions(document: gql(query)));
    if (result.hasException) {
      print(result.source.toString());
      throw Exception(result.exception.toString());
    }

    try {
      final countriesData = result.data!['countries'] as List;
      print(countriesData);
      return countriesData.map((data) => Country.fromJson(data)).toList();
    } catch (e) {
      print("error loading countried: $e");
      throw Exception("Failed to load data");
    }
  }
}
