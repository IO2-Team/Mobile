// ignore_for_file: prefer_const_constructors

import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';

import '../screens/reservatedevents_screens/reservatedeventslist_screen.dart';

class PageColor {
  static final burger = Color.fromARGB(232, 255, 255, 255);
  static final asActiveEvent = Color.fromARGB(232, 255, 255, 255);
  static final categories =
      Color.fromARGB(45, 246, 197, 148); // Color.fromARGB(98, 34, 34, 34);
  static final categoriesAndStatus =
      Color.fromARGB(59, 241, 180, 119); // Color.fromARGB(86, 0, 0, 0);
  static final category = Color.fromARGB(255, 211, 211, 255);

  static final appBar =
      Color.fromARGB(255, 0, 68, 123); // Color.fromARGB(255, 97, 97, 233);
  static final texts = Color.fromARGB(255, 22, 22, 100);
  static final textsLight = Color.fromARGB(255, 35, 80, 131);
  static final ticket = Color.fromARGB(197, 95, 227,
      148); //  Color.fromARGB(255, 209, 83, 167);  Color.fromARGB(255, 254, 193, 4);
  static final logo1 = Color.fromARGB(255, 243, 190, 137);
  static final logo2 = Color.fromARGB(255, 50, 250, 50);
  static final singleEventActive =
      Color.fromARGB(244, 255, 255, 255); // Color.fromARGB(255, 189, 249, 180);

  static final singleEventDeleted = Color.fromARGB(247, 255, 91, 91);
  static final singleEventPending = Color.fromARGB(243, 247, 193, 140);
  static final singleEventDone = Color.fromARGB(247, 197, 197, 197);

  static final divider = Color.fromARGB(255, 0, 68, 123);
  static final filters = Color.fromARGB(194, 241, 180, 119);
  //  Color.fromARGB(255, 120, 51, 79); //Color.fromARGB(255, 149, 149, 254);
  static final doneCanceled = Color.fromARGB(255, 176, 176, 198);
}

class IconsInApp {
  static IconData dateIcon1 =
      const IconData(0xf06c8, fontFamily: 'MaterialIcons');
  static IconData dateIcon0 =
      const IconData(0xe1b6, fontFamily: 'MaterialIcons');
  static IconData clockIcon =
      const IconData(0xe03a, fontFamily: 'MaterialIcons');
  static IconData freePlacesIcon2 =
      const IconData(0xf06ca, fontFamily: 'MaterialIcons');
  static IconData placeIcon =
      const IconData(0xf193, fontFamily: 'MaterialIcons');
  static IconData arrowBack =
      const IconData(0xf572, fontFamily: 'MaterialIcons');
  static IconData arrowFront =
      const IconData(0xf57a, fontFamily: 'MaterialIcons');
  static IconData burgerMhm =
      const IconData(0xf0023, fontFamily: 'MaterialIcons');
}

class Buttonss {
  static Widget QrButton(
      BuildContext context, SaveAndDeleteReservation sharedPref) {
    return SizedBox(
      width: 65,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReservatedListEventsWidget(sharedPref: sharedPref)))
              .then((value) {
            if (value != null) {
              Navigator.pop(context, value);
            }
          });
        },
        child: const Icon(
          Icons.qr_code_2_rounded,
          size: 37,
          color: Colors.white,
        ),
      ),
    );
  }
}
