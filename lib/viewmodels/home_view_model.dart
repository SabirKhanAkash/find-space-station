import 'dart:async';

import 'package:find_space_station/core/services/log_service.dart';
import 'package:find_space_station/data/models/data_model/data.dart';
import 'package:find_space_station/data/repositories/remote/home_repository.dart';
import 'package:find_space_station/utils/config/app_text.dart';
import 'package:find_space_station/utils/date_util.dart';
import 'package:find_space_station/utils/get_country_from_lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository homeRepository;
  var isLoading = false;
  var locationStatus = AppText().locationNotFetched;
  var isIssOnMyCountry = false;
  var myCountry = "mUnknown";
  var issCurrentLat = "N/A";
  var issCurrentLng = "N/A";
  var issOnCountry = 'Unknown';
  var lastUpdatedTime = "N/A";
  var lastUpdatedTimeInUtc = "N/A";
  var seconds = 60;
  var error = "N/A";
  late Timer timer;

  HomeViewModel({required this.homeRepository});

  void startCountDownTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        notifyListeners();
      } else {
        getIssCurrentLocation();
        seconds = 60;
        notifyListeners();
      }
    });
    notifyListeners();
  }

  Future<void> getIssCurrentLocation() async {
    isLoading = true;
    notifyListeners();
    try {
      Data? issCurrentLocation = await homeRepository.getIssCurrentLocation(null);
      issCurrentLat = issCurrentLocation?.iss_position?.latitude ?? "N/A";
      issCurrentLng = issCurrentLocation?.iss_position?.longitude ?? "N/A";
      lastUpdatedTime = DateUtil.formatDateTime(DateTime.now());
      lastUpdatedTimeInUtc = DateUtil.formatDateTimeInUtc(DateTime.now());
      isLoading = false;
      await getMyLocation();
      notifyListeners();
      if (locationStatus != AppText().locationDisabled &&
          locationStatus != AppText().locationDenied &&
          locationStatus != AppText().locationPermDenied) {
        issOnCountry = await getCountryFromLatLng(
            double.parse(issCurrentLocation?.iss_position?.latitude ?? "0.0"),
            double.parse(issCurrentLocation?.iss_position?.longitude ?? "0.0"));
        notifyListeners();
        if (issOnCountry == myCountry) {
          isIssOnMyCountry = true;
          notifyListeners();
        }
      }
      Log.create(
          Level.info,
          "ISS current location is: ${issCurrentLocation?.iss_position?.latitude ?? "0.0"}, "
          "${issCurrentLocation?.iss_position?.longitude ?? "0.0"} | on country: $issOnCountry | my"
          " country: $myCountry");
    } catch (e) {
      error = e.toString();
      Log.create(Level.error, "Error: $error");
      issOnCountry = 'Unknown';
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String> getMyLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationStatus = AppText().locationDisabled;
      notifyListeners();
      return "mUnknown";
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationStatus = AppText().locationDenied;
        notifyListeners();
        return "mUnknown";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationStatus = AppText().locationPermDenied;
      notifyListeners();
      return "mUnknown";
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.reduced, forceAndroidLocationManager: false);
    myCountry = await getCountryFromLatLng(position.latitude, position.longitude);
    locationStatus = "";
    notifyListeners();
    return myCountry;
  }
}
