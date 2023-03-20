import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:intl/intl.dart';

///////////////////////////////////////////////////////////////
/// Widget which shows single event (in event search screen)
///////////////////////////////////////////////////////////////
class SingleEvent extends StatelessWidget {
  final Event event;
  const SingleEvent(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    // conversion - start and end time of event
    final DateTime dateStart = DateTime.fromMillisecondsSinceEpoch(
        event.startTime != null ? event.startTime! * 1000 : 0);
    final DateTime dateFinish = DateTime.fromMillisecondsSinceEpoch(
        event.endTime != null ? event.endTime! * 1000 : 0);

    return Column(
      children: [
        const SizedBox(height: 10.0),
        Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (event.title != null)
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
                    Divider(
                      color: PageColor.divider,
                      height: 12.0,
                      thickness: 1.0,
                    ),
                    showCountPlaces(),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
                height: 12.0,
                thickness: 1.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  viewDetailsButton(),
                  const SizedBox(
                    width: 15,
                  ),
                  bookPlaceButton(),
                ],
              ),
            ],
          ),
        ),
      ],
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
      event.title!,
      style: const TextStyle(
        letterSpacing: 0.4,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
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
            size: 18.0,
          ),
          const SizedBox(
            width: 2,
          ),
          if (event.startTime != null)
            Text(
              DateFormat('dd.MM.yyyy').format(dateStart),
              style: const TextStyle(
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
              color: const Color.fromARGB(255, 0, 0, 0),
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
      padding:
          const EdgeInsets.only(bottom: 5.0, top: 0.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          Icon(
            IconsInApp.clockIcon,
            size: 18.0,
          ),
          const SizedBox(
            width: 1,
          ),
          Text(
            DateFormat('Hm').format(dateStart),
            style: const TextStyle(
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// widget shows how many places are free
  ///
  Widget showCountPlaces() {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 5.0, top: 5.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          Icon(
            IconsInApp.freePlacesIcon2,
            size: 18.0,
          ),
          const SizedBox(
            width: 2,
          ),
          if (event.freePlace != null)
            Text(
              "${event.freePlace!} places left",
              style: const TextStyle(
                fontSize: 15.5,
              ),
            )
          else
            const Text(
              "No places limits",
              style: TextStyle(
                fontSize: 15.5,
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
            onPressed: () {},
            child: const Text(
              'Details',
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
    );
  }

  ///
  /// widget for button to book place on event
  ///
  Widget bookPlaceButton() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 0.0, right: 10.0, left: 0.0),
        alignment: Alignment.center,
        child: SizedBox(
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PageColor.ticket,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
            ),
            onPressed: () {},
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
    );
  }
}
