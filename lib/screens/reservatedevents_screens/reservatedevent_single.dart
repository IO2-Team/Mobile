// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/screens/withqrcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///////////////////////////////////////////////////////////////
/// Widget which shows single event (in event search screen)
///////////////////////////////////////////////////////////////
class SingleEventReservated extends StatefulWidget {
  final EventWithPlaces event;
  final JsonEvent jsonEvet;
  final SaveAndDeleteReservation sharedPref;

  SingleEventReservated(this.event, this.jsonEvet, this.sharedPref,
      {super.key});
  @override
  State<SingleEventReservated> createState() => _SingleEventReservated();
}

class _SingleEventReservated extends State<SingleEventReservated> {
  final Color textsCol = PageColor.texts;
  final Color textsCol2 = PageColor.textsLight;
  bool canceled = false;
  @override
  Widget build(BuildContext context) {
    // conversion - start and end time of event
    final DateTime dateStart =
        DateTime.fromMillisecondsSinceEpoch(widget.event.startTime * 1000);
    final DateTime dateFinish =
        DateTime.fromMillisecondsSinceEpoch(widget.event.endTime * 1000);
    if (canceled == false)
      return Column(
        children: [
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: widget.event.status.name == "inFuture"
                  ? PageColor.singleEventActive
                  : PageColor.asActiveEvent,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: PageColor.burger,
                width: 0.1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: eventTitle(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: Divider(
                          color: PageColor.divider,
                          height: 12.0,
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(
                                bottom: 0.0, right: 0.0, left: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                showDate(dateStart, IconsInApp.dateIcon0),
                                showTime(dateStart),
                              ],
                            ),
                          ),
                          dashBetweenData(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              showDate(dateFinish, IconsInApp.dateIcon1),
                              showTime(dateFinish),
                            ],
                          ),
                        ],
                      ),
                      showPlaceCordinates(),
                      Divider(
                        color: PageColor.divider,
                        height: 12.0,
                        thickness: 1.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    viewDetailsButton(),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    else
      return SizedBox(
        height: 0,
      );
  }

/////////////////////////////
  /// Main Widgets in class
////////////////////////////

  ///
  /// widget shows title of event
  ///
  Widget eventTitle() {
    return Text(
      widget.event.title,
      style: TextStyle(
        letterSpacing: 0.4,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: textsCol,
      ),
    );
  }

  ///
  /// widget shows start date
  ///
  Widget showDate(DateTime dateStart, IconData ico) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 5.0, top: 5.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          Icon(
            ico,
            color: textsCol2,
            size: 18.0,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            DateFormat('dd.MM.yyyy').format(dateStart),
            style: TextStyle(
              color: textsCol,
              fontSize: 15.5,
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// Dash between data
  ///
  Widget dashBetweenData() {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0, left: 7.0, right: 7.0),
      child: SizedBox(
        width: 7,
        height: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: textsCol,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// widget shows start event  time
  ///
  Widget showTime(DateTime dateStart) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 10.0, top: 0.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          Icon(
            IconsInApp.clockIcon,
            color: textsCol2,
            size: 18.0,
          ),
          const SizedBox(
            width: 1,
          ),
          Text(
            DateFormat('Hm').format(dateStart),
            style: TextStyle(
              fontSize: 13.0,
              color: textsCol,
            ),
          ),
        ],
      ),
    );
  }

  Widget showPlaceCordinates() {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 5.0, top: 0.0, left: 10.0, right: 10.0),
      child: Column(
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: FutureBuilder<String>(
                  future: getAddress(widget.event.latitude,
                      widget.event.longitude), // async work
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Container(
                            height: 90,
                            child: Column(
                              children: [
                                Divider(
                                  color: PageColor.divider,
                                  height: 12.0,
                                  thickness: 1.0,
                                ),
                                Icon(
                                  IconsInApp.placeIcon,
                                  size: 18.0,
                                  color: textsCol2,
                                ),
                                Expanded(
                                    child: Center(
                                        child: const Text('Loading....'))),
                              ],
                            ));
                      default:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else if (snapshot.data != "")
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Divider(
                                  color: PageColor.divider,
                                  height: 12.0,
                                  thickness: 1.0,
                                ),
                              ),
                              Icon(
                                IconsInApp.placeIcon,
                                size: 18.0,
                                color: textsCol2,
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              Text(
                                snapshot.data!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: PageColor.texts,
                                  fontSize: 14.5,
                                ),
                              ),
                            ],
                          );
                        else
                          return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// widget for button to view details about event
  ///
  Widget viewDetailsButton() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        alignment: Alignment.center,
        child: SizedBox(
          width: 300.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PageColor.appBar,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InspectionScreen(
                          widget.jsonEvet, widget.sharedPref))).then((value) {
                if (value != null && value == true) {
                  setState(() {
                    canceled = true;
                    //troche glupio tak? idk
                  });
                }
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.qr_code_2,
                  size: 30,
                ),
                const Text(
                  ' Inspection',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MyFont1',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getAddress(String latitude, String longitude) async {
    try {
      http.Response res = await http.get(Uri.parse(
          "https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latitude&lon=$longitude"));

      Map<String, dynamic> json = jsonDecode(res.body);
      return json.containsKey("error") ? "" : json["display_name"];
    } catch (e) {
      return "";
    }
  }
}
