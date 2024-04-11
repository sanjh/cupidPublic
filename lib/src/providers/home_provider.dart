import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/models/state_model.dart';
import 'package:flutter_assignment/src/models/country_model.dart';
import 'package:flutter_assignment/src/repositories/state_repository.dart';
import 'package:flutter_assignment/src/repositories/country_repository.dart';

class HomeProvider extends ChangeNotifier {
  final CountryRepository _countryRepository = CountryRepository();
  final StateRepository _stateRepository = StateRepository();

  List<Country> countries = [];
  List<States> states = [];

  Country? selectedCountry;

  States? selectedState;

  bool isDataLoaded = false;

  final Country defaultCountry = Country(value: 'Select Country');
  final States defaultState = States(value: 'Select State');

  HomeProvider() {
    loadCountries();
  }

  Future<void> loadCountries() async {
    try {
      countries = await _countryRepository.getCountries();
      isDataLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load countries: $e');
    }
  }

  Future<void> loadStates() async {
    try {
      states = await _stateRepository.getStates(id: selectedCountry!.id!);
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load states: $e');
    }
  }

  void setSelectedCountry(Country? country) {
    selectedCountry = country;
    selectedState = null;
    states.clear();
    loadStates();
    notifyListeners();
  }

  void setSelectedState(States? state) {
    selectedState = state;
    notifyListeners();
  }
}
