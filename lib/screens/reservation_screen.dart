import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';

///////////////////////////////////////////////////////////////
/// Widget which shows screen to make reservation
///////////////////////////////////////////////////////////////

class MakeReservationWidget extends StatefulWidget {
  final Event event;
  const MakeReservationWidget(this.event, {super.key});
  @override
  State<MakeReservationWidget> createState() => _MakeReservationWidget();
}

class _MakeReservationWidget extends State<MakeReservationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PageColor.eventSearch,
        appBar: AppBar(
          backgroundColor: PageColor.appBar,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Logo(),
          ),
          leading: SizedBox(
            width: 60,
            child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  IconsInApp.arrowBack,
                  color: Colors.white,
                )),
          ),
          actions: const <Widget>[
            SizedBox(
              width: 60,
            )
          ],
        ));
  }
}
