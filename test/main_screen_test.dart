import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:eventapp_mobile/screens/main_screen/eventsearch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test/test.dart' as test;

void main() {
  testWidgets('singIn_noEmptyFields', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(600, 300);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // init sharedPrefs
    SharedPreferences.setMockInitialValues({});
    var prefs = await SharedPreferences.getInstance();

    SaveAndDeleteReservation sharedPref =
        SaveAndDeleteReservation(sharedPreferences: prefs);

    await tester.pumpWidget(
      ChangeNotifierProvider<APIProvider>(
        create: (context) => APIProvider(sharedPref),
        child: MaterialApp(
          home: EventSearchWidget(
            sharedPref: sharedPref,
            title: 'Home page with events',
          ),
        ),
      ),
    );

    // final drawer = find.byKey(ValueKey('drawer'));
    //tester.pump;
    // expect(drawer, findsOneWidget);
    expect(find.byKey(Key('Appbarr')), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
