import 'package:african_explorer/data/models/country_model.dart';
import 'package:equatable/equatable.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();

  @override
  List<Object?> get props => [];
}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<CountryModel> countries;
  final List<CountryModel> filterCountries;

  const CountriesLoaded({required this.countries, required this.filterCountries});

  @override
  List<Object?> get props => [countries,filterCountries];

  CountriesLoaded copyWith({
    List<CountryModel>? countries,
    List<CountryModel>? filterCountries,
  }) {
    return CountriesLoaded(
      countries: countries ?? this.countries,
      filterCountries: filterCountries ?? this.filterCountries,
    );
  }
}

class CountriesError extends CountriesState {
  final String message;

  const CountriesError(this.message);

  @override
  List<Object?> get props => [message];


}
