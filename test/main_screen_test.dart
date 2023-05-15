import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:eventapp_mobile/screens/main_screen/eventsearch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test/test.dart' as tests;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/testing.dart';

// The function to be tested
Future<String> fetchData(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://dionizos-backend-app.azurewebsites.net'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
  }
}

void main() {
  test('fetchData returns data if HTTP call completes successfully', () async {
    final client = MockClient((request) async {
      return http.Response('{"data": "Hello, world!"}', 200);
    });

    final result = await fetchData(client);

    expect(result, '{"data": "Hello, world!"}');
  });

  test('fetchData throws an exception if HTTP call fails', () async {
    final client = MockClient((request) async {
      return http.Response('Not Found', 404);
    });

    expect(() => fetchData(client), throwsException);
  });
}
// Future<void> main() async {
//   HttpOverrides.global =
//       _MyHttpOverrides(); // Setting a customer override that'll use an unmocked HTTP client

//   testWidgets(
//     'Test with HTTP enabled',
//     (tester) async {
//       await tester.runAsync(() async {
//         // Use `runAsync` to make real asynchronous calls
//         expect(
//           (await http.Client().get(
//                   Uri.parse('https://dionizos-backend-app.azurewebsites.net')))
//               .statusCode,
//           200,
//         );
//       });
//     },
//   );
// }

// class _MyHttpOverrides extends HttpOverrides {}
//   testWidgets('singIn_noEmptyFields', (WidgetTester tester) async {


//     tester.binding.window.physicalSizeTestValue = const Size(600, 300);
//     tester.binding.window.devicePixelRatioTestValue = 1.0;

//     // init sharedPrefs
//     SharedPreferences.setMockInitialValues({});
//     var prefs = await SharedPreferences.getInstance();

//     SaveAndDeleteReservation sharedPref =
//         SaveAndDeleteReservation(sharedPreferences: prefs);

//     await tester.pumpWidget(
//       ChangeNotifierProvider<APIProviderT>(
//         create: (context) => APIProviderT(sharedPref),
//         child: MaterialApp(
//           home: EventSearchWidget(
//             sharedPref: sharedPref,
//             title: 'Home page with events',
//           ),
//         ),
//       ),
//     );

//     // final drawer = find.byKey(ValueKey('drawer'));
//     //tester.pump;
//     // expect(drawer, findsOneWidget);
//     expect(find.byKey(Key('Appbarr')), findsOneWidget);
//     await tester.pumpAndSettle();
//   });
// }


// class APIProviderT extends ChangeNotifier {
//   APIProvider(SaveAndDeleteReservation sharedPref) {
//      final client = MockClient((request) async {
//       return http.Response('{"data": "Hello, world!"}', 200);
//     });

//     final result = await fetchData(client);
//     WidgetsFlutterBinding.ensureInitialized();
//     api = Openapi(
//         dio: Dio(BaseOptions(
//             baseUrl: sharedPref.getApi() != null
//                 ? sharedPref.getApi()!
//                 : 'https://dionizos-backend-app.azurewebsites.net')),
//         // baseUrl:
//         //     'http://io2central-env.eba-vfjwqcev.eu-north-1.elasticbeanstalk.com')),
//         serializers: standardSerializers);
//     sharedPref.removeAll();
//   }
//   late Openapi api;
// }