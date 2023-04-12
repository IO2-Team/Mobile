import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';

///////////////////////////////////////////////////////////////
/// Widget which shows reservated events list
///////////////////////////////////////////////////////////////

class ReservatedListEventsWidget extends StatefulWidget {
  const ReservatedListEventsWidget({super.key});
  // final APIProvider apiProvider;
  @override
  State<ReservatedListEventsWidget> createState() =>
      _ReservatedListEventsWidget();
}

class _ReservatedListEventsWidget extends State<ReservatedListEventsWidget> {
  final Map<String, bool> statusIndex = {
    "inFuture": false,
    "pending": false,
    "done": false,
    "cancelled": false
  };
  final Set<String> statusArray = {"inFuture", "pending", "done", "cancelled"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PageColor.eventSearch,
        appBar: AppBar(
          backgroundColor: PageColor.appBar,
          automaticallyImplyLeading: true,
          title: const Center(
            child: Logo(),
          ),
          actions: <Widget>[
            SizedBox(
              width: 65,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, true); // true when pop to home page
                },
                child: const Icon(
                  Icons.home_outlined,
                  size: 37,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsetsDirectional.all(30),
          child: Column(
            children: [
              Text("ssssssssssss"),
              // FutureBuilder<SharedPreferences>(
              //     future: SaveAndDeleteReservation.getInstance(),
              //     builder: (context, response) {
              //       if (response.hasData) {
              //         return Text(
              //             "ssssssssssss"); //response.data!.getKeys().first
              //       } else {
              //         return Text("nicfffffffffffffffffffffffffffffffff");
              //       }
              //       ;
              //     }),
            ],
          ),
        ));
  }
}
