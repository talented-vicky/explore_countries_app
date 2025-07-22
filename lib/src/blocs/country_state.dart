import 'package:equatable/equatable.dart';
import 'package:explore_countries_app/src/models/country.dart';

// base class for various states comparison via equatable
abstract class CountryState extends Equatable {
  const CountryState();

  @override
  // List<Object> props(){
  //   return []
  // }
  List<Object> get props => [];
}

// when app first opens
class CountryInit extends CountryState {}

// for spinners/loaders
class CountryLoading extends CountryState {}

// after successful fetch
class CountryLoaded extends CountryState {
  final List<Country> countries;
  const CountryLoaded(this.countries);

  @override
  List<Object> get props => [countries];
}

// if fetching fails
class CountryError extends CountryState {
  final String msg;
  const CountryError({required this.msg});

  @override
  List<Object> get props => [msg];
}
