import 'package:flutter/cupertino.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          columnWithInfoDates(IconsInApp.dateIcon0, dateStart,
              IconsInApp.clockIcon, "Start date"),
          columnWithInfoDates(IconsInApp.dateIcon1, dateFinish,
              IconsInApp.clockIcon, "End date"),
          columnWithInfoLocation(IconsInApp.placeIcon, "Location"),
        ],
      ),
    );
  }
/////////////////////////////
  /// Main Widgets in class
////////////////////////////

  Widget columnWithInfoDates(
      IconData dateico, DateTime dateStart, IconData timeico, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 30),
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
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      dateico,
                      size: 18.0,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    if (widget.event.startTime != null)
                      Text(
                        DateFormat('dd.MM.yyyy').format(dateStart),
                        style: const TextStyle(
                          fontSize: 15.5,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            timeico,
                            size: 18.0,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          if (widget.event.startTime != null)
                            Text(
                              DateFormat('Hm').format(dateStart),
                              style: const TextStyle(
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
        ],
      ),
    );
  }

  Widget columnWithInfoLocation(IconData dateico, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 30),
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
          if (widget.event.longitude != null)
            Row(
              children: [
                Icon(
                  dateico,
                  size: 18.0,
                ),
                const SizedBox(
                  width: 2,
                ),
                if (widget.event.latitude != null &&
                    widget.event.longitude != null)
                  Text(
                    "(${widget.event.latitude}, ${widget.event.longitude})",
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
