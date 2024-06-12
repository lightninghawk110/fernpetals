import 'package:fern_n_petals/viewmodel/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PincodeSuggestionBox extends StatefulWidget {
  const PincodeSuggestionBox();

  @override
  State<PincodeSuggestionBox> createState() => _AsyncAutocompleteState();
}

class _AsyncAutocompleteState extends State<PincodeSuggestionBox> {
  String? _searchingWithQuery;

  late Iterable<String> _lastOptions = <String>[];

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
        builder: (context, provider, child, {listen = true}) {
          
      return provider.getLocation ? TextFormField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabled: false,
                                      hintText: "${provider.pincode}, ${provider.subLocality}, ${provider.subArea}",
                                      border: InputBorder.none),
                                ) : Autocomplete<String>(

        optionsBuilder: (TextEditingValue textEditingValue) async {
          _searchingWithQuery = textEditingValue.text;
          final Iterable<String> options =
              await provider.search(_searchingWithQuery!);

          if (_searchingWithQuery != textEditingValue.text) {
            return _lastOptions;
          }

          _lastOptions = options;
          return options;
        },
        onSelected: (String selection) {
          List<String> delimitedList = selection.split(',');
          provider.pincode = delimitedList[0];
          provider.subLocality = delimitedList[1];
          provider.subArea = delimitedList[2];
          provider.getLocation = true;
        },
      );
    });
  }
}
