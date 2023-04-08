// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_interpolation_to_compose_strings

import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

import 'location.dart';

const apiKey = '0aea7b50ddc6745273b9c9e962aaffde';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();

    latitude = location.latitude;
    longitude = location.longitude;
    NetworkManager networkManager = NetworkManager(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkManager.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
