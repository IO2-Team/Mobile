// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// // event to Json
// class JsonEvent {
//   int? eventId;
//   int? placeId;
//   String? reservationToken;

//   JsonEvent({this.eventId, this.placeId, this.reservationToken});

//   // Convert object to map
//   Map<String, dynamic> toJson() {
//     return {
//       'eventId': eventId,
//       'placeId': placeId,
//       'reservationToken': reservationToken,
//     };
//   }

//   // Create object from map
//   factory JsonEvent.fromJson(Map<String, dynamic> json) {
//     return JsonEvent(
//       eventId: json['eventId'],
//       placeId: json['placeId'],
//       reservationToken: json['reservationToken'],
//     );
//   }
// }

// // saving, retrieving and deleating data
// class SaveAndDeleteReservation {
//   // Store data
//   static Future<void> saveRes(JsonEvent event) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String eventJson = json.encode(event.toJson());
//     await prefs.setString('${event.eventId}', eventJson);
//   }

//   // Retrieve data
//   static Future<JsonEvent?> getRes(int eventId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String eventJson = prefs.getString('$eventId');
//     if (eventJson != null) {
//       Map<String, dynamic> eventMap = json.decode(eventJson);
//       return JsonEvent.fromJson(eventMap);
//     } else {
//       return null;
//     }
//   }

// // Remove data
//   static Future<void> removeRes(int eventId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('$eventId');
//   }

//   static Future<SharedPreferences> getInstance() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs;
//   }
// }
