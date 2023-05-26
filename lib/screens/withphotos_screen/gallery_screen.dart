import 'dart:ffi';

import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';

///////////////////////////////////////////////////////////////
/// Widget which shows chosen event
///////////////////////////////////////////////////////////////

class GalleryPage extends StatefulWidget {
  final Event event;

  const GalleryPage(this.event, {Key? key}) : super(key: key);
  @override
  State<GalleryPage> createState() => _GalleryPage();
}

class _GalleryPage extends State<GalleryPage> {
  final Color textscol = PageColor.texts;
  final Color textscol2 = PageColor.textsLight;
  @override
  Widget build(BuildContext context) {
    final DateTime dateStart =
        DateTime.fromMillisecondsSinceEpoch(widget.event.startTime * 1000);
    final DateTime dateFinish =
        DateTime.fromMillisecondsSinceEpoch(widget.event.endTime * 1000);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
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
              image: AssetImage("images/panels.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(),
        ),
      ),
    );
  }
}
