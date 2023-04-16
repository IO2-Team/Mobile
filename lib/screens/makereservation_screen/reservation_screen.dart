// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../../additional_widgets/saveanddelete_reservation.dart';
import '../../api/api_provider.dart';

///////////////////////////////////////////////////////////////
/// Widget which shows screen to make reservation
///////////////////////////////////////////////////////////////

class MakeReservationWidget extends StatefulWidget {
  final Event event;
  final SaveAndDeleteReservation sharedPref;

  const MakeReservationWidget(this.event,
      {super.key, required this.sharedPref});
  @override
  State<MakeReservationWidget> createState() => _MakeReservationWidget();
}

class _MakeReservationWidget extends State<MakeReservationWidget> {
  bool isReservationAccepted = false;
  bool _showFreePlaces = false;
  String? _selectedItem;
  Future<Response<EventWithPlaces>> freePlaces() async {
    return context
        .read<APIProvider>()
        .api
        .getEventApi()
        .getEventById(id: widget.event.id);
  }

  void placeBooked(int eventId, String? placeId) async {
    Future<Response<ReservationDTO>> dataToSharedPref;
    if (placeId == null || placeId.contains('f'))
      dataToSharedPref = context
          .read<APIProvider>()
          .api
          .getReservationApi()
          .makeReservation(eventId: eventId);
    else
      dataToSharedPref = context
          .read<APIProvider>()
          .api
          .getReservationApi()
          .makeReservation(eventId: eventId, placeID: int.parse(placeId));

    dataToSharedPref.then((response) {
      // response.statusCode == 200 means all worked properly
      if (response.data != null) {
        // Successful response
        ReservationDTO jsonEvent = response.data!;
        widget.sharedPref.saveRes(JsonEvent(
            eventId: jsonEvent.eventId,
            placeId: jsonEvent.placeId,
            reservationToken: jsonEvent.reservationToken));
        return true;
      } else {
        // Error handling for unsuccessful response
        return false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context, true);
              },
              child: Icon(
                IconsInApp.arrowBack,
                color: Colors.white,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10),
        child: Column(
          children: [
            viewTitle(widget.event.title),
            Row(
              children: const [
                Text(
                  textAlign: TextAlign.left,
                  "Places schema:",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.4,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
              height: 12.0,
              thickness: 1.0,
            ),
            showSchema(),
            Container(
              width: 400,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _showFreePlaces,
                        checkColor: PageColor.logo1,
                        activeColor: PageColor.appBar,
                        onChanged: (value) {
                          setState(() {
                            _showFreePlaces = value!;
                          });
                        },
                      ),
                      const Text(
                        'Choose place',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Divider(
                      color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
                      height: 1.0,
                      thickness: 1.0,
                    ),
                  ),
                  _showFreePlaces
                      ? FutureBuilder<Response<EventWithPlaces>>(
                          future: freePlaces(),
                          builder: (context, response) {
                            if (response.hasData &&
                                response.data != null &&
                                response.data!.data != null &&
                                isReservationAccepted == false) {
                              return Column(
                                children: [
                                  whenPlaceToSelect(response),
                                ],
                              );
                            } else {
                              return whileNoPlaceSelected();
                            }
                          })
                      : whileNoPlaceSelected(),
                ],
              ),
            ),
            bookPlaceButton(),
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
            color: PageColor.texts,
          ),
        ),
      ),
    );
  }

  ///
  /// widget for button to accept a reservation and chosen place
  ///
  Widget bookPlaceButton() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 40.0, right: 0.0, left: 0.0),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_selectedItem != null && _selectedItem!.contains('f'))
              const Text(
                "Place not available!",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
            Visibility(
              visible: isReservationAccepted,
              child: Text(
                'Reservation Accepted',
                style: TextStyle(fontSize: 20, color: PageColor.appBar),
              ),
            ),
            Visibility(
              visible: !isReservationAccepted,
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !isReservationAccepted &&
                            !(_selectedItem != null &&
                                _selectedItem!.contains('f'))
                        ? PageColor.ticket
                        : PageColor.doneCanceled,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    ),
                  ),
                  onPressed: () {
                    if (!isReservationAccepted &&
                        !(_selectedItem != null &&
                            _selectedItem!.contains('f'))) {
                      // save to SharedPreferences
                      // SaveAndDeleteReservation.

                      // shot to Api
                      if (_showFreePlaces && _selectedItem != null)
                        placeBooked(widget.event.id, _selectedItem!);
                      else
                        placeBooked(widget.event.id, null);
                      setState(() {
                        isReservationAccepted = true;
                      });
                    }
                  },
                  child: const Text(
                    'Accept',
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
      ),
    );
  }

  ///
  /// widget when choosePlace checkbox is not checked and when loading a data
  ///
  Widget whileNoPlaceSelected() {
    return DropdownButton2<String>(
      buttonStyleData: ButtonStyleData(
        height: 50,
        width: 400,
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: PageColor.singleEvent,
          ),
          color: PageColor.singleEvent,
        ),
        elevation: 0,
      ),
      onChanged: (value) {},
      items: null,
    );
  }

  ///
  /// widget when choosePlace checkbox is checked
  ///
  Widget whenPlaceToSelect(AsyncSnapshot<Response<EventWithPlaces>> response) {
    return DropdownButton2<String>(
      buttonStyleData: ButtonStyleData(
        height: 50,
        width: 400,
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: PageColor.singleEvent,
          ),
          color: PageColor.singleEvent,
        ),
        elevation: 1,
      ),
      dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 390,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: PageColor.singleEvent,
          ),
          elevation: 1,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(1),
            thumbVisibility: MaterialStateProperty.all(true),
          )),
      value: _selectedItem,
      onChanged: (value) {
        setState(() {
          if (value != null) _selectedItem = value;
        });
      },
      items: response.data!.data!.places.map((item) {
        if (item.free) {
          return DropdownMenuItem<String>(
            value: "${item.id}",
            child: Text("Place ${item.id}"),
          );
        } else {
          return DropdownMenuItem<String>(
            value: " ${item.id}f",
            child: Text(
              "Place ${item.id}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          );
        }
      }).toList(),
    );
  }

  Widget showSchema() {
    try {
      if (widget.event.placeSchema != null && widget.event.placeSchema != "") {
        Widget w = Container(
          // Set the height of the container
          child: Image.memory(base64.decode(widget.event.placeSchema!)),
        );
        return w;
      } else {
        throw Exception();
      }
    } catch (e) {
      return Container(
        width: 200, // Set the width of the container
        height: 200, // Set the height of the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              10), // Set the border radius of the container
          image: const DecorationImage(
            image: AssetImage(
                "images/place_schema.png"), // Use NetworkImage for loading image from URL
            fit: BoxFit
                .cover, // Set the fit property to cover to fill the container with the image
          ),
        ),
      );
    }
  }
}
