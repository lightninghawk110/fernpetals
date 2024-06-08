import 'package:fern_n_petals/viewmodel/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PincodeSuggestionBox extends StatefulWidget {
  const PincodeSuggestionBox();

  @override
  State<PincodeSuggestionBox> createState() => _AsyncAutocompleteState();
}

class _AsyncAutocompleteState extends State<PincodeSuggestionBox> {
  // The query currently being searched for. If null, there is no pending
  // request.
  String? _searchingWithQuery;

  // The most recent options received from the API.
  late Iterable<String> _lastOptions = <String>[];

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context, provider, child) {
        return Autocomplete<String>(
          
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
            debugPrint('You just selected $selection');
          },
        );
      }
    );
  }
}
