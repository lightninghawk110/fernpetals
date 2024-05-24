import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  String? currentAddress;
  Position? currentPosition;
  

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log("Location service is not enabled");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log("Location Service are denied ");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      log("Location permissions are permanently denied");
      return false;
    }
    return true;
  }

  Future getPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
