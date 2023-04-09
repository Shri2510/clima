// import 'package:flutter/material.dart';
// ignore_for_file: unused_local_variable

import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude = 0.0;
  late double longitude = 0.0;

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // print("Permission not given");
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // print(position);
      // print("Longitude:" + position.longitude.toString());
      // print("Latitude:" + position.latitude.toString());
      latitude = position.latitude.toDouble();
      longitude = position.longitude.toDouble();
    }
  }
}
