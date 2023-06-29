import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  Future<void> getCurrentLocation() async {//future assures a future value
    try {
      //if any exception occurs it catches always use it in app if some exception occurs
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      //to compute and load the location it takes time so it can take large time to avoid our apps to freeze
      //by running on foreground so we use async we run it on backgrnd and avoid app freeze
      // Future<Position> position = Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //the future will not provide the output bt it provides assurance that the output will be provided in the future
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy
              .low); //location accuracy is set to low to consume less battery higher accuracy uses more  battery
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) //e or exception anything we can write
    {
      return e;
    }
  } //await is used with async
}
