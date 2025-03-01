import 'package:african_explorer/data/repository/country_repository.dart';
import 'package:african_explorer/presentation/bloc/countries/countries.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountryRepository countryRepository;

  CountriesBloc({required this.countryRepository}) : super(CountriesInitial()) {
    on<FetchCountries>(_onFetchCountries);
    on<SearchCountries>(_onSearchCountries);
  }

  Future<void> _onFetchCountries(
      FetchCountries event, Emitter<CountriesState> emit) async {
    emit(CountriesLoading());

    try {
      final countries = await countryRepository.getAfricanCountries();

      /// Sort the countries by name alphabetically
      countries.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));
      emit(CountriesLoaded(countries: countries, filterCountries: countries));
    } catch (e) {
      emit(CountriesError(e.toString()));
    }
  }

  void _onSearchCountries(SearchCountries event, Emitter<CountriesState> emit) {
    if (state is CountriesLoaded) {
      final currentState = state as CountriesLoaded;
      final query = event.countryName.toLowerCase().trim();

      if (query.isEmpty) {
        emit(currentState.copyWith(filterCountries: currentState.countries));
      } else {
        final filterCountries = currentState.countries
            .where((country) =>
                country.name!.common!.toLowerCase().contains(query) ||
                country.name!.official!.toLowerCase().contains(query) ||
                country.capital.first.toLowerCase().contains(query))
            .toList();
        emit(currentState.copyWith(filterCountries: filterCountries));
      }
    }
  }
}
