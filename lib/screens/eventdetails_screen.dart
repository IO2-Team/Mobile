import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:intl/intl.dart';

///////////////////////////////////////////////////////////////
/// Widget which shows chosen event
///////////////////////////////////////////////////////////////

class EventDetails extends StatefulWidget {
  final Event event;
  const EventDetails(this.event, {Key? key}) : super(key: key);
  @override
  State<EventDetails> createState() => _EventDetails();
}

class _EventDetails extends State<EventDetails> {
  final Color textscol = PageColor.texts;
  final Color textscol2 = PageColor.textsLight;

  @override
  Widget build(BuildContext context) {
    final DateTime dateStart = DateTime.fromMillisecondsSinceEpoch(
        widget.event.startTime != null ? widget.event.startTime! * 1000 : 0);
    final DateTime dateFinish = DateTime.fromMillisecondsSinceEpoch(
        widget.event.endTime != null ? widget.event.endTime! * 1000 : 0);
    return Scaffold(
      backgroundColor: PageColor.eventSearch,
      appBar: AppBar(
        backgroundColor: PageColor.appBar,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "A mobile event App",
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
        actions: const <Widget>[
          SizedBox(
            width: 60,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (widget.event.title != null) viewTitle(widget.event.title!),
            if (widget.event.startTime != null)
              columnWithInfoDates(IconsInApp.dateIcon0, dateStart,
                  IconsInApp.clockIcon, "Start date"),
            if (widget.event.endTime != null)
              columnWithInfoDates(IconsInApp.dateIcon1, dateFinish,
                  IconsInApp.clockIcon, "End date"),
            if (widget.event.longitude != null && widget.event.latitude != null)
              columnWithInfoLocation(IconsInApp.placeIcon, "Location"),
            if (widget.event.name != null) description(widget.event.name!),
            palcesLeftAndStatus(widget.event.freePlace, widget.event.status),
            bookPlaceButton(widget.event.status),
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
      padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Event",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.4,
              fontSize: 15.0,
            ),
          ),
          Text(
            eventTitle,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 25.0,
              color: textscol,
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
    return Padding(
      padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
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
          Column(
            children: [
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
                      fontSize: 15.5,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  children: [
                    Icon(
                      timeico,
                      color: textscol2,
                      size: 18.0,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    if (widget.event.startTime != null)
                      Text(
                        DateFormat('Hm').format(dateStart),
                        style: TextStyle(
                          color: textscol,
                          fontSize: 13.0,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///
  /// widget shows info about location of event
  ///
  Widget columnWithInfoLocation(IconData dateico, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
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
          if (widget.event.longitude != null)
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
                  "(${widget.event.latitude}, ${widget.event.longitude})",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: textscol,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  ///
  /// widget shows long description of event
  ///
  Widget description(String descript) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 35.0, right: 35.0, top: 35.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Details",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0.4,
                  fontSize: 15.0,
                ),
              ),
            ),
            Container(
              width: 900,
              height: 200, //delete it !!!!!
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: PageColor.singleEvent,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: PageColor.eventSearch,
                  width: 0.1,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    " $descript  - lets assume this event description will be much longer than it is now, right?",
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 16.5,
                      color: textscol,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// widget shows how many places are left
  ///
  Widget palcesLeftAndStatus(int? places, EventStatus? eventStat) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 4.0),
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: PageColor.singleEvent,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: PageColor.eventSearch,
                  width: 0.1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Free places",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.4,
                      fontSize: 15.0,
                    ),
                  ),
                  const Divider(
                    color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
                    height: 12.0,
                    thickness: 1.0,
                  ),
                  Row(
                    children: [
                      Icon(IconsInApp.freePlacesIcon2,
                          size: 15, color: textscol2),
                      if (places != null)
                        Text(
                          "$places places left",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 15,
                            color: textscol,
                          ),
                        )
                      else
                        Text(
                          "unlimited",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 15,
                            color: textscol,
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 35.0, left: 4.0),
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: PageColor.singleEvent,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: PageColor.eventSearch,
                  width: 0.1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Event status",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.4,
                      fontSize: 15.0,
                    ),
                  ),
                  const Divider(
                    color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
                    height: 12.0,
                    thickness: 1.0,
                  ),
                  if (eventStat != null)
                    Text(
                      eventStat.name,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 15,
                        color: textscol,
                      ),
                    )
                  else
                    Text(
                      "-",
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 15,
                        color: textscol,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///
  /// widget for button to book place on event
  ///
  Widget bookPlaceButton(EventStatus? eventStat) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Intrested in?",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.4,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eventStat == EventStatus.inFuture ||
                              eventStat == EventStatus.pending
                          ? PageColor.ticket
                          : PageColor.doneCanceled,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                      ),
                    ),
                    onPressed: () {
                      //  if(eventStat) ...
                    },
                    child: const Text(
                      'Reserv',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MyFont1',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
