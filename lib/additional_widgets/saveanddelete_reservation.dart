import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// event to Json
class JsonEvent {
  int? eventId;
  int? placeId;
  String? reservationToken;

  JsonEvent({this.eventId, this.placeId, this.reservationToken});

  // Convert object to map
  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'placeId': placeId,
      'reservationToken': reservationToken,
    };
  }

  // Create object from map
  factory JsonEvent.fromJson(Map<String, dynamic> json) {
    return JsonEvent(
      eventId: json['eventId'],
      placeId: json['placeId'],
      reservationToken: json['reservationToken'],
    );
  }
}

// saving, retrieving and deleating data
class SaveAndDeleteReservation {
  final SharedPreferences sharedPreferences;
  SaveAndDeleteReservation({required this.sharedPreferences});
  Future<void> saveRes(JsonEvent event) async {
    String eventJson = json.encode(event.toJson());
    await sharedPreferences.setString('${event.eventId}', eventJson);
  }

  // Retrieve data
  JsonEvent? getRes(String eventId) {
    String? eventJson = sharedPreferences.getString(eventId);
    if (eventJson != null) {
      Map<String, dynamic> eventMap = json.decode(eventJson);
      return JsonEvent.fromJson(eventMap);
    } else {
      return null;
    }
  }

// Remove data
  Future<void> removeRes(int eventId) async {
    sharedPreferences.remove('$eventId');
  }

// Remove all
  Future<void> removeAll() async {
    sharedPreferences.clear();
  }

  Set<String> getAllKeys() {
    return sharedPreferences.getKeys();
  }

  // change API
  Future<void> apiChange(String APIUrl) async {
    await sharedPreferences.setString('UrlAddress', APIUrl);
  }

// Retrieve API data
  String? getApi() {
    String? url = sharedPreferences.getString('UrlAddress');

    return url;
  }
}
