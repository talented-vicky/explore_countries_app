import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:explore_countries_app/src/blocs/country_cubit.dart';
import 'package:explore_countries_app/src/repositories/country_repository.dart';
import 'package:explore_countries_app/src/screens/countries_screen.dart';
import 'package:explore_countries_app/src/services/graphql_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = GraphqlService.initClient().value;
  final repo = CountryRepository(client: client);

  runApp(MyApp(
    repository: repo,
  ));
}

class MyApp extends StatelessWidget {
  final CountryRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CountryExplorer',
      theme: ThemeData(useMaterial3: true),
      home: BlocProvider(
        create: (_) => CountryCubit(repository),
        child: const CountriesScreen(),
      ),
    );
  }
}
