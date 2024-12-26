import 'package:geocoding/geocoding.dart';

Future<String> getCountryFromLatLng(double latitude, double longitude) async {
  var country = 'Unknown';
  List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

  if (placemarks.isNotEmpty) {
    Placemark place = placemarks[0];
    country = place.country ?? "Unknown";
  } else {
    country = "Unknown";
  }
  return country;
}
