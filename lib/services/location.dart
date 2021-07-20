import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    Duration d = Duration(seconds: 30);
    try {
      Position position = await Geolocator.getCurrentPosition(
          timeLimit: d,
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: false);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
