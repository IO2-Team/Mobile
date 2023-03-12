import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for EventOrganizerApi
void main() {
  final instance = Openapi().getEventOrganizerApi();

  group(EventOrganizerApi, () {
    // Confirm orginizer account
    //
    //Future<Organizer> confirm(String id, String code) async
    test('test confirm', () async {
      // TODO
    });

    // Confirm orginizer account
    //
    //Future deleteOrganizer(String sessionToken, String id) async
    test('test deleteOrganizer', () async {
      // TODO
    });

    // Logs organizer into the system
    //
    // 
    //
    //Future<LoginOrganizer200Response> loginOrganizer(String email, String password) async
    test('test loginOrganizer', () async {
      // TODO
    });

    // Patch orginizer account
    //
    //Future patchOrganizer(String sessionToken, String id, { Organizer organizer }) async
    test('test patchOrganizer', () async {
      // TODO
    });

    // Create orginizer account
    //
    //Future<Organizer> signUp(String name, String email, String password) async
    test('test signUp', () async {
      // TODO
    });

  });
}
