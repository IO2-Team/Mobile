import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:eventapp_mobile/screens/main_screen/eventsearch_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/blob.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();

  SaveAndDeleteReservation sharedPref =
      SaveAndDeleteReservation(sharedPreferences: prefs);

  Blob blob = new Blob();
  blob.delete("layouts/test.txt");

  runApp(
    ChangeNotifierProvider<APIProvider>(
      create: (context) => APIProvider(sharedPref),
      child: MyApp(sharedPref: sharedPref),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({required this.sharedPref, super.key});
  final SaveAndDeleteReservation sharedPref;
  //final apiProvider = APIProvider();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventSearchWidget(
        sharedPref: sharedPref,
        title: 'Home page with events',
      ),
    );
  }
}
