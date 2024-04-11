import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_assignment/src/constants/url_config.dart';
import 'package:flutter_assignment/src/models/state_model.dart';
import 'package:http/http.dart' as http;

class StateRepository {
  Future<List<States>> getStates({required int id}) async {
    final String stateURL = '${URLConfiguration.countryUrl}/$id/states';

    try {
      var url = Uri.parse(stateURL);
      debugPrint('url: $url');

      var response = await http.get(url, headers: URLConfiguration.headers);

      if (response.statusCode == 200) {
        final List<dynamic> statesJson = json.decode(response.body);
        debugPrint('response: ${statesJson.toString()}');
        List<States> states =
            statesJson.map((json) => States.fromJson(json)).toList();
        return states;
      } else {
        throw Exception('Failed to load states: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load states: $e');
    }
  }
}
