import 'package:eventapp_mobile/screens/main_screen/eventsearch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eventapp_mobile/additional_widgets/drawer_mainscreen.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';

class MockAPIProvider extends Mock implements APIProvider {}

void main() {
  // Set up the mock APIProvider
  final apiProvider = MockAPIProvider();

  // Test case 1: Test initial state
  testWidgets('Test initial state', (WidgetTester tester) async {
    // Create the widget
    await tester.pumpWidget(EventSearchWidget(
      title: 'Test Title',
      sharedPref: SaveAndDeleteReservation(),
    ));

    // Expectations
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(DrawerBurger), findsOneWidget);
    expect(find.byType(FutureBuilder), findsOneWidget);
  });
  // Test 2: Test events list refresh
  testWidgets('Test events list refresh', (WidgetTester tester) async {
    await tester.pumpWidget(
      EventSearchWidget(
        title: 'Test',
        sharedPref: SaveAndDeleteReservation(),
      ),
    );

    // Call the refresh function
    await tester.drag(find.byType(RefreshIndicator), const Offset(200.0, 0.0));
    await tester.pumpAndSettle();

    // Check if events list is updated
    expect(find.text('change it!'), findsOneWidget);
  });
}
