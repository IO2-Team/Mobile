import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final api = Openapi(
      dio: Dio(BaseOptions(baseUrl: 'https://dionizos-backend-app.azurewebsites.net')),
      serializers: standardSerializers);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home page with events',
          api: api
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.api});
  final String title;
  final Openapi api;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void strzalDoAPI() async
  {
    var res = await widget.api.getEventApi().getEvents();
    print(res.data);
  }


  @override
  Widget build(BuildContext context) {

    strzalDoAPI();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Text('Hello World:) So far nothing'),
    );
  }
}
