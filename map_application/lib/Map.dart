import 'package:flutter/material.dart';

import 'map_location_picker.dart';

class Map extends StatefulWidget {
  const Map({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  String address = "null";
  String autocompletePlace = "null";
  Prediction? initialValue;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: MaterialApp(
          home: MapLocationPicker(
          apiKey: "AIzaSyDo2V2ggOnq3oPDk_qqCnxaP0M4IIiMXDY",
          canPopOnNextButtonTaped: true,
          currentLatLng: const LatLng(65.0593477383384, 25.466392861471927),
          onNext: (GeocodingResult? result) {
            if (result != null) {
              setState(() {
                address = result.formattedAddress ?? "";
              });
            }
          },
          onSuggestionSelected: (PlacesDetailsResponse? result) {
            if (result != null) {
              setState(() {
                autocompletePlace = result.result.formattedAddress ?? "";
              });
            }
          },
        ),
        ),
      ),
    );
  }
}
