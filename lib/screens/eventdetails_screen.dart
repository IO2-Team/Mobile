// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/screens/makereservation_screen/reservation_screen.dart';
import 'package:eventapp_mobile/screens/withphotos_screen/gallery_screen.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
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
          actions: <Widget>[
            SizedBox(
              width: 65,
              child: MaterialButton(
                onPressed: () {},
                child: const Icon(
                  Icons.home_outlined,
                  size: 37,
                  color: Colors.transparent,
                ),
              ),
            )
          ]),
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
          'Reserve',
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
            : Color.fromARGB(146, 0, 0, 0),
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/panels.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 98.0, left: 20, right: 20),
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: PageColor.singleEvent,
                  //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //   border: Border.all(
                  //     color: PageColor.eventSearch,
                  //     width: 0.1,
                  //   ),
                  //),
                  child: Column(
                    children: [
                      viewTitle(widget.event.title),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            columnWithInfoDates(IconsInApp.dateIcon0, dateStart,
                                IconsInApp.clockIcon, "Start date"),
                            freePlace(widget.event.freePlace),
                            columnWithInfoDates(IconsInApp.dateIcon1,
                                dateFinish, IconsInApp.clockIcon, "End date"),
                          ],
                        ),
                      ),
                      columnWithInfoLocation(
                          IconsInApp.placeIcon,
                          getAddress(
                              widget.event.latitude, widget.event.longitude)),
                      description(widget.event.name),
                      gallery(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
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
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 300,
            child: Text(
              eventTitle,
              // overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
        color: PageColor.asActiveEvent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: PageColor.burger,
          width: 0.1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 7.0, right: 5.0, top: 10.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Row(
                children: [
                  Icon(
                    timeico,
                    color: textscol2,
                    size: 21.0,
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
                  size: 21.0,
                  color: textscol2,
                ),
                const SizedBox(
                  width: 2,
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    DateFormat('dd.MM.yyyy').format(dateStart),
                    style: TextStyle(
                      color: textscol,
                      fontSize: 15,
                    ),
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
              color: PageColor.asActiveEvent,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: PageColor.appBar,
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
                left: 15.0, right: 15.0, top: 35.0, bottom: 0.0),
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
                    color: PageColor.asActiveEvent,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: PageColor.appBar,
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
          height: 20,
        )
      ],
    );
  }

  Widget gallery() {
    return Column(children: [
      Center(
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Photos:",
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PageColor.divider,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GalleryPage(widget.event)));
                      },
                      child: const Text(
                        'Show more',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MyFont1',
                        ),
                      ),
                    ),
                  ])))
    ]);
  }

  Widget freePlace(int? places) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: PageColor.asActiveEvent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: PageColor.burger,
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
              Icon(IconsInApp.freePlacesIcon2, size: 19, color: textscol2),
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
