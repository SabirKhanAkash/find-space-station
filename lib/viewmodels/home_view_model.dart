import 'package:find_space_station/core/services/log_service.dart';
import 'package:find_space_station/data/repositories/remote/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository homeRepository;
  var isLoading = true;
  var myLatitude = "Location not fetched";
  var myLongitude = "Location not fetched";

  HomeViewModel({required this.homeRepository});

  Future<void> getIssCurrentLocation(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      var issCurrentLocation = await homeRepository.getIssCurrentLocation(null);
      getMyLocation();
      if (issCurrentLocation?.iss_position?.latitude == myLatitude &&
          issCurrentLocation?.iss_position?.longitude == myLongitude) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The Space Station is above your Country Now!!")),
        );
      }
      Log.create(
          Level.info,
          "ISS current location is: ${issCurrentLocation?.iss_position?.latitude ?? "0.0"}, "
          "${issCurrentLocation?.iss_position?.longitude ?? "0.0"}");
      notifyListeners();
    } catch (error) {
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sorry! Failed to get ISS current location")),
      );
      throw Exception(error.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getMyLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      myLatitude = "Location services are disabled.";
      myLongitude = "Location services are disabled.";
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        myLatitude = "Location permissions are denied";
        myLongitude = "Location permissions are denied";
        notifyListeners();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      myLatitude = "Location permissions are permanently denied.";
      myLongitude = "Location permissions are permanently denied.";
      notifyListeners();
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    myLatitude = '${position.latitude}';
    myLongitude = '${position.longitude}';

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];

      myCountry = '${place.country ?? "Unknown"}';
    } else {
      myCountry = "Unknown";
    }
    notifyListeners();
  }
}
