import 'package:african_explorer/data/repository/country_repository.dart';
import 'package:african_explorer/presentation/bloc/country_details/country_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailsBloc
    extends Bloc<CountryDetailsEvent, CountryDetailsState> {
  final CountryRepository countryRepository;

  CountryDetailsBloc(this.countryRepository) : super(CountryDetailsInitial()) {
    on<FetchCountryDetails>(_onFetchCountryDetails);
  }

  Future<void> _onFetchCountryDetails(
      FetchCountryDetails event, Emitter<CountryDetailsState> emit) async {
    emit(CountryDetailsLoading());
    try {
      final countryDetails =
          await countryRepository.getCountryDetails(event.countryName);

      emit(CountryDetailsLoaded(countryDetails: countryDetails));
    } catch (e) {
      emit(CountryDetailsError(e.toString()));
    }
  }
}
