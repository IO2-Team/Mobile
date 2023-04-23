import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi/openapi.dart';
import 'package:dio/dio.dart';

import '../additional_widgets/saveanddelete_reservation.dart';

class APIProvider extends ChangeNotifier {
  APIProvider(SaveAndDeleteReservation sharedPref) {
    WidgetsFlutterBinding.ensureInitialized();
    api = Openapi(
        dio: Dio(BaseOptions(
            baseUrl: sharedPref.getApi() != null
                ? sharedPref.getApi()!
                : 'https://dionizos-backend-app.azurewebsites.net')),
        // baseUrl:
        //     'http://io2central-env.eba-vfjwqcev.eu-north-1.elasticbeanstalk.com')),
        serializers: standardSerializers);
    sharedPref.removeAll();
  }
  late Openapi api;
}
