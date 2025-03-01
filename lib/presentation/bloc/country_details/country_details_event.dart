import 'package:equatable/equatable.dart';

abstract class CountryDetailsEvent extends Equatable {
  const CountryDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchCountryDetails extends CountryDetailsEvent {
  final String countryName;

  const FetchCountryDetails(this.countryName);

  @override
  List<Object> get props => [countryName];
}
