import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for EventOrganizerApi
void main() {
  final instance = Openapi().getEventOrganizerApi();

  group(EventOrganizerApi, () {
    // Confirm orginizer account
    //
    //Future confirm(String id, String code) async
    test('test confirm', () async {
      // TODO
    });

    // Confirm orginizer account
    //
    //Future deleteOrganizer(String sessionToken, String id) async
    test('test deleteOrganizer', () async {
      // TODO
    });

    // Get organizer account (my account)
    //
    //Future<Organizer> getOrganizer(String sessionToken) async
    test('test getOrganizer', () async {
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
    //Future patchOrganizer(String sessionToken, String id, { OrganizerPatch organizerPatch }) async
    test('test patchOrganizer', () async {
      // TODO
    });

    // Create orginizer account
    //
    //Future<Organizer> signUp({ OrganizerForm organizerForm }) async
    test('test signUp', () async {
      // TODO
    });

  });
}
