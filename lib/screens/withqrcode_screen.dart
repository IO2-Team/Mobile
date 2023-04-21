import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../additional_widgets/logo.dart';

class InspectionScreen extends StatefulWidget {
  final JsonEvent jsonEvet;
  final SaveAndDeleteReservation sharedPref;
  const InspectionScreen(this.jsonEvet, this.sharedPref, {Key? key})
      : super(key: key);

  @override
  _InspectionScreenState createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  void deletePlaceWithApi() async {
    if (widget.jsonEvet.reservationToken != null)
      context.read<APIProvider>().api.getReservationApi().deleteReservation(
          reservationToken: widget.jsonEvet.reservationToken!);
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.1, 0.0),
      end: const Offset(4.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                onPressed: () {},
                child: const Icon(
                  Icons.home_outlined,
                  size: 37,
                  color: Colors.transparent,
                ),
              ),
            )
          ]),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/ev4.jpg"), fit: BoxFit.cover),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 115.0),
            child: Container(
              decoration: BoxDecoration(
                color: PageColor.singleEventActive,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: PageColor.burger,
                  width: 0.1,
                ),
              ),
              child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 34, horizontal: 34.0),
                    child: QrImage(
                      //TO DO: if not null -- check it!!!!
                      data: widget.jsonEvet.toJson().toString(),
                      size: 300,
                      foregroundColor: Colors.black,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: PageColor.singleEventActive,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: PageColor.burger,
                  width: 0.1,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "Ticket info",
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: PageColor.texts,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: SlideTransition(
                                position: _offsetAnimation,
                                child: Icon(
                                  IconsInApp.freePlacesIcon2,
                                  color: PageColor.appBar,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Divider(
                    color: PageColor.divider,
                    height: 12.0,
                    thickness: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 35, top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Ticket ID:",
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: 17.0,
                                color: PageColor.texts,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${widget.jsonEvet.placeId}",
                                  style: TextStyle(
                                    letterSpacing: 0.4,
                                    fontSize: 17.0,
                                    color: PageColor.texts,
                                  ),
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 35, top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Event ID:",
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: 17.0,
                                color: PageColor.texts,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${widget.jsonEvet.eventId}",
                                  style: TextStyle(
                                    letterSpacing: 0.3,
                                    fontSize: 17.0,
                                    color: PageColor.texts,
                                  ),
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: PageColor.divider,
                      height: 12.0,
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 35, top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Token:",
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: 17.0,
                                color: PageColor.texts,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.jsonEvet.reservationToken ?? "Unknown",
                                  style: TextStyle(
                                    letterSpacing: 0.3,
                                    fontSize: 17.0,
                                    color: PageColor.texts,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DeleteButton(),
        ]),
      ),
    );
  }

  Widget DeleteButton() {
    // return Padding(
    //   padding: const EdgeInsets.only(right: 8.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       MaterialButton(
    //         onPressed: () {
    //           if (widget.jsonEvet.eventId != null) {
    //             widget.sharedPref.removeRes(widget.jsonEvet.eventId!);
    //             deletePlaceWithApi();

    //             Navigator.pop(context, true);
    //           }
    //         },
    //         child: const Icon(
    //           Icons.delete_forever_rounded,
    //           size: 50,
    //           color: Colors.red,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return FloatingActionButton.extended(
      onPressed: () {
        if (widget.jsonEvet.eventId != null) {
          widget.sharedPref.removeRes(widget.jsonEvet.eventId!);
          deletePlaceWithApi();

          Navigator.pop(context, true);
        }
      },
      label: const Text(
        'Delete reservation',
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      icon: const Icon(
        Icons.delete_forever_rounded,
        size: 50,
        color: Colors.red,
      ),
      backgroundColor: Color.fromARGB(189, 0, 0, 0),
      elevation: 10,
    );
  }
}
