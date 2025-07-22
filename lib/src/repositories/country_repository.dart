import 'package:graphql_flutter/graphql_flutter.dart';

import '../models//country.dart';

class CountryRepository {
  final GraphQLClient client;

  CountryRepository({required this.client});

  Future<List<Country>> fetchCountries() async {
    const String query = r'''
      query {
        countries {
          code
          name
        }
      }
    ''';

    final result = await client.query(QueryOptions(document: gql(query)));
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final countriesData = result.data!['countries'] as List;
    return countriesData.map((data) => Country.fromJson(data)).toList();
  }
}
