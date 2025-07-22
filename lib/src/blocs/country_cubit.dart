import 'package:explore_countries_app/src/models/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:explore_countries_app/src/blocs/country_state.dart';
import 'package:explore_countries_app/src/repositories/country_repository.dart';

// for managing & emitting various country states defined in "CountryState"
class CountryCubit extends Cubit<CountryState> {
  final CountryRepository repository;
  List<Country> _allCountries = [];

  CountryCubit(this.repository) : super(CountryInit());

  void fetchCountries() async {
    emit(CountryLoading());

    try {
      final countries = await repository.fetchCountries();
      _allCountries = countries;
      emit(CountryLoaded(countries));
    } catch (e) {
      emit(CountryError(msg: e.toString()));
    }
  }

  void searchCountries(String params) {
    if (state is CountryLoaded) {
      final filteredCountry = _allCountries
          .where((country) =>
              country.name.toLowerCase().contains(params.toLowerCase()))
          .toList();

      emit(CountryLoaded(filteredCountry));
    }
  }
}
