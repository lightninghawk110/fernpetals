import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? currentPosition;
  String? currentAddress;

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
    await placemarkFromCoordinates(latitude, longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress =
          "${place.postalCode},${place.subLocality},${place.subAdministrativeArea}";
      log(currentAddress!);
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
