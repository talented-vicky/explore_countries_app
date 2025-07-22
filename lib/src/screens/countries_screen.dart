import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:explore_countries_app/src/blocs/country_cubit.dart';
import 'package:explore_countries_app/src/blocs/country_state.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country Explorer"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_sharp),
          )
        ],
        elevation: 2,
        backgroundColor: Colors.tealAccent,
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<CountryCubit>().fetchCountries(),
        child: BlocBuilder<CountryCubit, CountryState>(
            // listen for countrystate changes emitted by countrycubit, then rebuild UI
            builder: (ctxt, state) {
          if (state is CountryLoading) {
            return ListView(children: const [
              Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ))
            ]);
          } else if (state is CountryLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (ctxt, ind) {
                final country = state.countries[ind];
                return ListTile(
                  title: Text(country.name),
                  subtitle: Text(country.code),
                );
              },
            );
          } else if (state is CountryError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error Fetching Countries'),
                  Text('Please retry!'),
                ],
              ),
            );
          }
          // fallback state
          return ListView(children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text('Pull to refresh'),
            ),
          ]);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CountryCubit>().fetchCountries(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
