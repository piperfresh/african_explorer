import 'package:african_explorer/data/models/country_details_model.dart';
import 'package:equatable/equatable.dart';

abstract class CountryDetailsState extends Equatable {
  const CountryDetailsState();

  @override
  List<Object?> get props => [];
}

class CountryDetailsInitial extends CountryDetailsState {}

class CountryDetailsLoading extends CountryDetailsState {}

class CountryDetailsLoaded extends CountryDetailsState {
  final CountryDetailsModel countryDetails;

  const CountryDetailsLoaded({required this.countryDetails});

  @override
  List<Object?> get props => [countryDetails];
}

class CountryDetailsError extends CountryDetailsState {
  final String message;

  const CountryDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
