import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for EventApi
void main() {
  final instance = Openapi().getEventApi();

  group(EventApi, () {
    // Add new event
    //
    //Future<Event> addEvent(String sessionToken, String title, String name, int freePlace, int startTime, int endTime, BuiltList<int> categories, { String placeSchema }) async
    test('test addEvent', () async {
      // TODO
    });

    // Cancel event
    //
    //Future cancelEvent(String sessionToken, String id) async
    test('test cancelEvent', () async {
      // TODO
    });

    // Return list of all events in category
    //
    //Future<BuiltList<Event>> getByCategory(int categoryId) async
    test('test getByCategory', () async {
      // TODO
    });

    // Find event by ID
    //
    // Returns a single event
    //
    //Future<Event> getEventById(int id) async
    test('test getEventById', () async {
      // TODO
    });

    // Return list of all events
    //
    //Future<BuiltList<Event>> getEvents() async
    test('test getEvents', () async {
      // TODO
    });

    // Return list of events made by organizer, according to session
    //
    //Future<BuiltList<Event>> getMyEvents(String sessionToken) async
    test('test getMyEvents', () async {
      // TODO
    });

    // patch existing event
    //
    //Future patchEvent(String sessionToken, String id, { Event event }) async
    test('test patchEvent', () async {
      // TODO
    });

  });
}
