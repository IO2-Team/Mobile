import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ReservationApi
void main() {
  final instance = Openapi().getReservationApi();

  group(ReservationApi, () {
    // Create new reservation
    //
    //Future deleteReservation(String reservationToken) async
    test('test deleteReservation', () async {
      // TODO
    });

    // Create new reservation
    //
    //Future<ReservationDTO> makeReservation(int eventId, { int placeID }) async
    test('test makeReservation', () async {
      // TODO
    });

  });
}
