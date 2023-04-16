import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:provider/provider.dart';

import 'reservatedevent_single.dart';
import '../../additional_widgets/saveanddelete_reservation.dart';
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

  Future<Response<EventWithPlaces>> freePlaces(int eventId) async {
    return context
        .read<APIProvider>()
        .api
        .getEventApi()
        .getEventById(id: eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PageColor.eventSearch,
        appBar: AppBar(
          backgroundColor: PageColor.appBar,
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
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            child: Column(
              children: [
                if (widget.sharedPref.getAllKeys().isNotEmpty)
                  for (int i = 0;
                      i < widget.sharedPref.getAllKeys().length;
                      i++)
                    FutureBuilder<Response<EventWithPlaces>>(
                        future: freePlaces(widget.sharedPref
                            .getRes(
                                widget.sharedPref.getAllKeys().elementAt(i))!
                            .eventId!),
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
        ));
  }
}