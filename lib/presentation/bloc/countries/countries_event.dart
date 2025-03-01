import 'package:equatable/equatable.dart';

abstract class CountriesEvent extends Equatable {
  const CountriesEvent();

  @override
  List<Object> get props => [];
}

class FetchCountries extends CountriesEvent {}

class SearchCountries extends CountriesEvent {
  final String countryName;

  const SearchCountries(this.countryName);

  @override
  List<Object> get props => [countryName];
}
