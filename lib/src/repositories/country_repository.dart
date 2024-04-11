import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_assignment/src/constants/url_config.dart';
import 'package:flutter_assignment/src/models/country_model.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  Future<List<Country>> getCountries() async {
    try {
      var response = await http.get(Uri.parse(URLConfiguration.countryUrl),
          headers: URLConfiguration.headers);
      if (response.statusCode == 200) {
        final List<dynamic> countriesJson = json.decode(response.body);
        debugPrint(countriesJson.toString());
        List<Country> countries =
            countriesJson.map((json) => Country.fromJson(json)).toList();
        return countries;
      } else {
        throw Exception('Failed to load countries: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }
}
