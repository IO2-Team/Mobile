// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/screens/makereservation_screen/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:intl/intl.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

///////////////////////////////////////////////////////////////
/// Widget which shows chosen event
///////////////////////////////////////////////////////////////

class EventDetails extends StatefulWidget {
  final Event event;
  final SaveAndDeleteReservation sharedPref;

  const EventDetails(this.event, {Key? key, required this.sharedPref})
      : super(key: key);
  @override
  State<EventDetails> createState() => _EventDetails();
}

class _EventDetails extends State<EventDetails> {
  final Color textscol = PageColor.texts;
  final Color textscol2 = PageColor.textsLight;
  @override
  Widget build(BuildContext context) {
    final DateTime dateStart =
        DateTime.fromMillisecondsSinceEpoch(widget.event.startTime * 1000);
    final DateTime dateFinish =
        DateTime.fromMillisecondsSinceEpoch(widget.event.endTime * 1000);
    return Scaffold(
      backgroundColor: PageColor.eventSearch,
      appBar: AppBar(
        backgroundColor: PageColor.appBar,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 38.0),
            child: Logo(),
          ),
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (widget.event.status.name == "inFuture" &&
              widget.event.freePlace != 0 &&
              !widget.sharedPref.getAllKeys().contains("${widget.event.id}"))
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MakeReservationWidget(widget.event,
                        sharedPref: widget.sharedPref))).then((value) {
              if (value != null) {
                Navigator.pop(context, value);
              }
            });
        },
        label: const Text(
          'Reservate',
          style: TextStyle(fontSize: 20),
        ),
        icon: const Icon(
          Icons.book_online,
          size: 30,
        ),
        backgroundColor: widget.event.status.name == "inFuture" &&
                widget.event.freePlace != 0 &&
                !widget.sharedPref.getAllKeys().contains("${widget.event.id}")
            ? PageColor.ticket
            : PageColor.doneCanceled,
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            viewTitle(widget.event.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                columnWithInfoDates(IconsInApp.dateIcon0, dateStart,
                    IconsInApp.clockIcon, "Start date"),
                freePlace(widget.event.freePlace),
                columnWithInfoDates(IconsInApp.dateIcon1, dateFinish,
                    IconsInApp.clockIcon, "End date"),
              ],
            ),
            columnWithInfoLocation(IconsInApp.placeIcon,
                getAddress(widget.event.latitude, widget.event.longitude)),
            description(widget.event.name),
          ],
        ),
      ),
    );
  }

/////////////////////////////
  /// Main Widgets in class
////////////////////////////
  ///
  /// widget shows info about title of event
  ///
  Widget viewTitle(String eventTitle) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 20),
      child: Center(
        child: Text(
          eventTitle,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 30.0,
            color: textscol,
          ),
        ),
      ),
    );
  }

  ///
  /// widget shows info about start and end of event
  ///
  Widget columnWithInfoDates(
      IconData dateico, DateTime dateStart, IconData timeico, String text) {
    return Container(
      decoration: BoxDecoration(
        color: PageColor.singleEvent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: PageColor.eventSearch,
          width: 0.1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Row(
                children: [
                  Icon(
                    timeico,
                    color: textscol2,
                    size: 22.0,
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  if (widget.event.startTime != null)
                    Text(
                      DateFormat('Hm').format(dateStart),
                      style: TextStyle(
                        color: textscol,
                        fontSize: 22.0,
                      ),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  dateico,
                  size: 18.0,
                  color: textscol2,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  DateFormat('dd MMMM yyyy').format(dateStart),
                  style: TextStyle(
                    color: textscol,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// widget shows info about location of event
  ///
  Widget columnWithInfoLocation(IconData dateico, Future<String> address) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Location:",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.4,
              fontSize: 22.0,
            ),
          ),
          const Divider(
            color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
            height: 12.0,
            thickness: 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: PageColor.singleEvent,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: PageColor.eventSearch,
                width: 0.1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<String>(
                future: address, // async work
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Text('Loading....');
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else
                        return Text(
                          snapshot.data!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textscol,
                            fontSize: 16.5,
                          ),
                        );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// widget shows long description of event
  ///
  Widget description(String descript) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 35.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Description:",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.4,
                    fontSize: 22.0,
                  ),
                ),
                const Divider(
                  color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
                  height: 12.0,
                  thickness: 1.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: PageColor.singleEvent,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: PageColor.eventSearch,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      descript,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 16.5,
                        color: textscol,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 70,
        )
      ],
    );
  }

  Widget freePlace(int? places) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: PageColor.singleEvent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: PageColor.eventSearch,
          width: 0.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$places",
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: 20,
                  color: textscol,
                ),
              ),
              Icon(IconsInApp.freePlacesIcon2, size: 15, color: textscol2),
            ],
          ),
          Text(
            "left",
            style: TextStyle(
              color: textscol,
              fontSize: 15,
            ),
          ),
        ],
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
