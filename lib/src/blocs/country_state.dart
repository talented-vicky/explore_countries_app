import 'package:equatable/equatable.dart';
import 'package:explore_countries_app/src/models/country.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryProps extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;
  const CountryLoaded(this.countries);

  @override
  List<Object> get props => [countries];
}

class CountryError extends CountryState {
  final String msg;
  const CountryError({required this.msg});

  @override
  List<Object> get props => [msg];
}
