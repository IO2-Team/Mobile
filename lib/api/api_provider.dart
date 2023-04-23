import 'package:flutter/foundation.dart';
import 'package:openapi/openapi.dart';
import 'package:dio/dio.dart';

class APIProvider extends ChangeNotifier {
  Openapi api = Openapi(
      dio: Dio(BaseOptions(
          baseUrl: 'https://dionizos-backend-app.azurewebsites.net')),
      // baseUrl:
      //     'http://io2central-env.eba-vfjwqcev.eu-north-1.elasticbeanstalk.com')),
      serializers: standardSerializers);
}
