import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/models/country_model.dart';
import 'package:flutter_assignment/src/models/state_model.dart';
import 'package:flutter_assignment/src/providers/home_provider.dart';
import 'package:flutter_assignment/src/widgets/custom_dropdown.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assignment'),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return Center(
            child: !provider.isDataLoaded
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CustomDropdownButton<Country>(
                          label: 'Select Country*',
                          value: provider.selectedCountry ??
                              provider.defaultCountry,
                          items: [
                            if (provider.selectedCountry == null ||
                                !provider.countries
                                    .contains(provider.selectedCountry))
                              provider.defaultCountry,
                            ...provider.countries
                          ],
                          onChanged: provider.setSelectedCountry,
                          displayText: (country) => country.value!,
                        ),
                        const SizedBox(height: 20),
                        CustomDropdownButton<States>(
                          label: 'Select State',
                          value:
                              provider.selectedState ?? provider.defaultState,
                          items: [
                            if (provider.selectedState == null ||
                                !provider.states
                                    .contains(provider.selectedState))
                              provider.defaultState,
                            ...provider.states
                          ],
                          onChanged: provider.setSelectedState,
                          displayText: (state) => state.value!,
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
