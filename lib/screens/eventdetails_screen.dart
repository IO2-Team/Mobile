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
            viewTitle(widget.event.title),
            columnWithInfoDates(IconsInApp.dateIcon0, dateStart,
                IconsInApp.clockIcon, "Start date"),
            columnWithInfoDates(IconsInApp.dateIcon1, dateFinish,
                IconsInApp.clockIcon, "End date"),
            columnWithInfoLocation(IconsInApp.placeIcon, "Location"),
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
  Widget viewTitle(String? eventTitle) {
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
          if (widget.event.title != null)
            Row(
              children: [
                Flexible(
                  child: Text(
                    eventTitle!,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: textscol2,
                    ),
                  ),
                ),
              ],
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
          if (widget.event.startTime != null)
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
                    if (widget.event.startTime != null)
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
                if (widget.event.latitude != null &&
                    widget.event.longitude != null)
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

  Widget description(String? descript) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Container(
          width: 900,
          //height: 200,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: PageColor.singleEvent,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: PageColor.eventSearch,
              width: 0.1,
            ),
          ),
          child: Flexible(
              child: Text(descript! +
                  " - lets assume this event description will be much longer than it is now, right?")),
        ),
      ),
    );
  }
}
