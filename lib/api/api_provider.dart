import 'package:flutter/foundation.dart';
import 'package:openapi/openapi.dart';
import 'package:dio/dio.dart';

class APIProvider extends ChangeNotifier {
  Openapi api = Openapi(
      dio: Dio(BaseOptions(
          baseUrl: 'https://dionizos-backend-app.azurewebsites.net')),
      serializers: standardSerializers);
}
