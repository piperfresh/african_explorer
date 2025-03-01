import 'dart:convert';
import 'dart:developer';
import 'package:african_explorer/core/config/constant.dart';
import 'package:african_explorer/core/exceptions/exception.dart';
import 'package:http/http.dart' as http;

abstract class ApiServices {
  Future<List<dynamic>> getAfricanCountries();

  Future<Map<String, dynamic>> getCountryDetails(String countryName);
}

class CountryApiService implements ApiServices {
  final http.Client _client = http.Client();

  @override
  Future<List<dynamic>> getAfricanCountries() async {
    try {
      final response = await _client.get(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.africaRegion}'));

      log(response.request!.url.toString());

      if (response.statusCode == 200) {
        final List<dynamic> countries = jsonDecode(response.body);
        return countries;
      } else {
        throw FailedException(
            '${response.statusCode}');
      }
    } catch (e) {
      throw FailedException('$e');
    }
  }

  @override
  Future<Map<String, dynamic>> getCountryDetails(String countryName) async {
    try {
      final response = await _client.get(Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.query}$countryName'));

      if (response.statusCode == 200) {
        final List<dynamic> countries = jsonDecode(response.body);
        return countries.first;
      } else {
        throw FailedException(
            '${response.statusCode}');
      }
    } catch (e) {
      throw FailedException('$e');
    }
  }
}
