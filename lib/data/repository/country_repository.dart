import 'package:african_explorer/core/exceptions/exception.dart';
import 'package:african_explorer/data/models/country_details_model.dart';
import 'package:african_explorer/data/models/country_model.dart';
import 'package:african_explorer/data/services/api_service.dart';

class CountryRepository {
  final ApiServices apiServices;

  CountryRepository(this.apiServices);

  Future<List<CountryModel>> getAfricanCountries() async {
    try {
      final countries = await apiServices.getAfricanCountries();
      return countries
          .map((country) => CountryModel.fromJson(country))
          .toList();
    } catch (e) {
      throw FailedException('$e');
    }
  }

  Future<CountryDetailsModel> getCountryDetails(String countryName) async {
    try {
      final country = await apiServices.getCountryDetails(countryName);
      return CountryDetailsModel.fromJson(country);
    } catch (e) {
      throw FailedException('$e');
    }
  }
}
