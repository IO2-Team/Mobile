import 'package:geolocator/geolocator.dart';

// if there is no permissions - then what?
class MyLocalization {
  static Future<Position> getCurrentLocation() async {
    // bool serviceEnabled;
    // LocationPermission permission;
    // try {
    //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //   if (!serviceEnabled) {
    //     return Future.error('Location services are disabled');
    //   }

    //   permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission == LocationPermission.denied) {
    //       return Future.error('Location permissions are denied');
    //     }
    //   }
    //   if (permission == LocationPermission.deniedForever) {
    //     return Future.error(
    //         'Location permissions are permanently denied, we cannot request permissions.');
    //   }
    //   if (permission != LocationPermission.unableToDetermine) {
    //     return Future.error('Unable tp determine.');
    //   }

    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    bool permissionGranted;

    LocationPermission _permission = await Geolocator.checkPermission();

    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.always ||
          _permission == LocationPermission.whileInUse) {
        permissionGranted = true;
      } else {
        permissionGranted = false;
      }
    } else {
      if (_permission == LocationPermission.always ||
          _permission == LocationPermission.whileInUse) {
        permissionGranted = true;
      } else {
        permissionGranted = false;
      }
    }
    if (!permissionGranted) throw Future.error('Not permission granted');

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      rethrow;
    }

    // } catch (e) {
    //   rethrow;
    // }
  }
}
