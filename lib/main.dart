import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:eventapp_mobile/screens/main_screen/eventsearch_screen.dart';

void main() => runApp(
      ChangeNotifierProvider<APIProvider>(
        create: (context) => APIProvider(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //final apiProvider = APIProvider();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventSearchWidget(
        sharedPref: SaveAndDeleteReservation(),
        title: 'Home page with events',
      ),
    );
  }
}
