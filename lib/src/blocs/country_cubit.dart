import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:explore_countries_app/src/blocs/country_state.dart';
import 'package:explore_countries_app/src/repositories/country_repository.dart';

// for managing & emitting various country states defined in "CountryState"
class CountryCubit extends Cubit<CountryState> {
  final CountryRepository repository;

  CountryCubit(this.repository) : super(CountryInit());

  void fetchCountries() async {
    emit(CountryLoading());

    try {
      final countries = await repository.fetchCountries();
      emit(CountryLoaded(countries));
    } catch (e) {
      emit(CountryError(msg: e.toString()));
    }
  }
}
