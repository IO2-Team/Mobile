import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:eventapp_mobile/screens/eventsearch_screen.dart';

void main() => runApp(
      ChangeNotifierProvider<APIProvider>(
        create: (context) => APIProvider(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //final apiProvider = APIProvider();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EventSearchWidget(
        title: 'Home page with events',
      ),
    );
  }
}
