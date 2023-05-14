import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:provider/provider.dart';
import 'reservatedevent_single.dart';
import '../../api/api_provider.dart';
///////////////////////////////////////////////////////////////
/// Widget which shows reservated events list
///////////////////////////////////////////////////////////////

class ReservatedListEventsWidget extends StatefulWidget {
  final SaveAndDeleteReservation sharedPref;

  const ReservatedListEventsWidget({super.key, required this.sharedPref});
  // final APIProvider apiProvider;
  @override
  State<ReservatedListEventsWidget> createState() =>
      _ReservatedListEventsWidget();
}

class _ReservatedListEventsWidget extends State<ReservatedListEventsWidget> {
  final Map<String, bool> statusIndex = {
    "inFuture": false,
    "pending": false,
    "done": false,
    "cancelled": false
  };
  final Set<String> statusArray = {"inFuture", "pending", "done", "cancelled"};

  Future<Response<EventWithPlaces>> freePlaces(JsonEvent? event) async {
    if (event == null) throw Exception("it is not even event"); // TODO
    return context
        .read<APIProvider>()
        .api
        .getEventApi()
        .getEventById(id: event.eventId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: PageColor.burger,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(125, 0, 0, 0),
          automaticallyImplyLeading: true,
          title: const Center(
            child: Logo(),
          ),
          actions: <Widget>[
            SizedBox(
              width: 65,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, true); // true when pop to home page
                },
                child: const Icon(
                  Icons.home_outlined,
                  size: 37,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/ev4.jpg"), fit: BoxFit.cover),
          ),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 105.0, bottom: 15),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 0.0, bottom: 10),
                child: Column(
                  children: [
                    if (widget.sharedPref.getAllKeys().isNotEmpty)
                      for (int i = 0;
                          i < widget.sharedPref.getAllKeys().length;
                          i++)
                        FutureBuilder<Response<EventWithPlaces>>(
                            future: freePlaces(widget.sharedPref.getRes(widget
                                    .sharedPref
                                    .getAllKeys()
                                    .elementAt(i)))
                                .catchError((e) {
                              // TODO - okienko dla usera w apce i ominiecie eventu
                              // Future completes with 42.
                            }),
                            builder: (context, response) {
                              if (response.hasData &&
                                  response.data != null &&
                                  response.data!.data != null &&
                                  response.data!.data!.status ==
                                      EventStatus.inFuture) {
                                return SingleEventReservated(
                                    response.data!.data!,
                                    widget.sharedPref.getRes(widget.sharedPref
                                        .getAllKeys()
                                        .elementAt(i))!, // if never NULL (hym)
                                    widget.sharedPref);
                              } else {
                                return const SizedBox();
                              }
                            })
                    // Text(
                    //     "${widget.sharedPref.getRes(widget.sharedPref.getAllKeys().first)!.eventId}"), //response.data!.getKeys().first
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
