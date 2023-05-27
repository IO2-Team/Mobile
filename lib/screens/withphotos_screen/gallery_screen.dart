import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../../api/blob.dart';
///////////////////////////////////////////////////////////////
/// Widget which shows chosen event
///////////////////////////////////////////////////////////////

class GalleryPage extends StatefulWidget {
  final Event event;
  final Blob blob;
  const GalleryPage(
    this.event, {
    Key? key,
    required this.blob,
  }) : super(key: key);
  @override
  State<GalleryPage> createState() => _GalleryPage();
}

class _GalleryPage extends State<GalleryPage> {
  Future<Response<BuiltList<String>>> linksForBlob() async {
    return context
        .read<APIProvider>()
        .api
        .getEventApi()
        .getPhoto(id: widget.event.id);
  }

  Future<String> photoFromBlob(String link) async {
    return widget.blob.get(link); // TO CHANGE
  }

  @override
  Widget build(BuildContext context) {
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
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 105.0, bottom: 15),
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: FutureBuilder<Response<BuiltList<String>>>(
                        future: linksForBlob(),
                        builder: (context, response) {
                          if (!response.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Container(
                                child: ListView.builder(
                                    physics: ScrollPhysics(),
                                    padding: const EdgeInsets.all(8),
                                    itemCount: response.data!.data!.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FutureBuilder(
                                          future: photoFromBlob(
                                              response.data!.data![index]),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  height: 350,
                                                  width: 500,
                                                  child: Image.memory(
                                                    base64
                                                        .decode(snapshot.data!),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              );
                                            }
                                          });
                                    }));
                          }
                        })),
              ),
            ])));
  }
}
