import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../api/api_provider.dart';

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
  bool isReservationAccepted = false;
  bool _showFreePlaces = false;
  String? _selectedItem = null;

  Future<Response<EventWithPlaces>> freePlaces() async {
    return context
        .read<APIProvider>()
        .api
        .getEventApi()
        .getEventById(id: widget.event.id);
  }

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
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.qr_code_2_rounded,
              size: 37,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10),
        child: Column(
          children: [
            viewTitle(widget.event.title),
            Container(
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
            ),
            Container(
              width: 400,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Row(
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
                        Text(
                          'Choose place',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: PageColor.texts,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _showFreePlaces
                      ? FutureBuilder<Response<EventWithPlaces>>(
                          future: freePlaces(),
                          builder: (context, response) {
                            if (response.hasData &&
                                response.data != null &&
                                response.data!.data != null) {
                              return whenPlaceToSelect(response);
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
            Visibility(
              visible: isReservationAccepted,
              child: Text(
                'Reservation Accepted',
                style: TextStyle(fontSize: 20, color: PageColor.logo2),
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isReservationAccepted
                      ? PageColor.ticket
                      : PageColor.doneCanceled,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                  ),
                ),
                onPressed: () {
//TO DO - how to write data to server - write??

                  setState(() {
                    isReservationAccepted = true;
                  });
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
          width: 200,
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
          _selectedItem = value!;
        });
      },
      items: response.data!.data!.places.map((item) {
        if (item.free) {
          return DropdownMenuItem<String>(
            value: "$item",
            child: Text("Place $item"),
          );
        } else {
          return const DropdownMenuItem<String>(
            value: null,
            child: Text("Place notFreexd"), //TO CHANGE
          );
        }
      }).toList(),
    );
  }
}
