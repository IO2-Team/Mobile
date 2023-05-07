import 'package:geolocator/geolocator.dart';

class MyLocalization {
  static Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
