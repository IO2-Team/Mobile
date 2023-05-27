import 'dart:convert';

import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:eventapp_mobile/screens/main_screen/eventsearch_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'api/blob.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;

// encoding
// Future<File> writeToFile(ByteData data) async {
//   final buffer = data.buffer;
//   Directory tempDir = await getTemporaryDirectory();
//   String tempPath = tempDir.path;
//   var filePath =
//       tempPath + '/file_01.tmp'; // file_01.tmp is dump file, can be anything
//   return new File(filePath)
//       .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();

  SaveAndDeleteReservation sharedPref =
      SaveAndDeleteReservation(sharedPreferences: prefs);
////////////////////////////////////////////////////////////
  ///put photo base64
//   ByteData bytes = await rootBundle.load('assets/photo.jpg');
//   File file;
//   //file = await writeToFile(bytes); // <= returns File
// // BLOB
//   String base64Encode(List<int> bytes) => base64.encode(bytes);
//   //final bytes2 = await file.readAsBytes();
//   Directory tempDir = await getTemporaryDirectory();
//   String tempPath = tempDir.path;
//   var filePath = tempPath + '/file_01.tmp';
//   final bytes2 = await File(filePath).readAsBytes();
//   String audioString = base64Encode(bytes2);
  Blob blob = new Blob();
  //await blob.put("layouts/test_photo.jpg", audioString);
////////////////////////////////////////////////////////////
  runApp(
    ChangeNotifierProvider<APIProvider>(
      create: (context) => APIProvider(sharedPref),
      child: MyApp(sharedPref: sharedPref, blob: blob),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({required this.sharedPref, required this.blob, super.key});
  final SaveAndDeleteReservation sharedPref;
  final Blob blob;
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
        blob: blob,
      ),
    );
  }
}
