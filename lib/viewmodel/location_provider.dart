import 'dart:convert';
import 'dart:developer';
import 'package:fern_n_petals/models/pincodemodel.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationProvider with ChangeNotifier {
  static List<String> pincodeList = [];
  Position? currentPosition;
  String? currentAddress;
  String? pincode = "Location Missing >";
  String? subLocality;
  String? subArea = "Where to Deliver ?";
  PincodeModel? pinResponse;
  bool getCurrLocation = false;
  bool getLocation = false;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log("Location services are not enabled");
      return false;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log("Location permissions are denied");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log("Location permissions are permanently denied");
      return false;
    }

    return true;
  }

  Future<void> getPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    try {
      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      log("Latitude: ${currentPosition!.latitude}");
      log("Longitude: ${currentPosition!.longitude}");
      notifyListeners();
    } catch (e) {
      log("Error getting current position: $e");
    }
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      currentAddress =
          "${place.postalCode},${place.subLocality},${place.subAdministrativeArea}";
      log(currentAddress!);
      pincode = place.postalCode;
      subLocality = place.subLocality;
      subArea = place.subAdministrativeArea;
    } catch (e) {
      debugPrint(e.toString());
    }
    getCurrLocation = true;
    notifyListeners();
  }

  Future<Iterable<String>> search(String query) async {
    String url = "https://api.postalpincode.in/pincode/$query";
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    pinResponse = PincodeModel.fromJson(jsonDecode(response.body));
    if (pinResponse!.status == "Success") {
      for (var value in pinResponse!.postOffice) {
        pincodeList.add("${value.pincode}, ${value.name}, ${value.district}");
      }
    }
    notifyListeners();

    if (query == '') {
      return const Iterable<String>.empty();
    }

    return pincodeList.where((String option) {
      return option.contains(query.toLowerCase());
    });
  }
}
