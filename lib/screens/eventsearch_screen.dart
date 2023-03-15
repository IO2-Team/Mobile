import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/eventsearch_single.dart';

class EventSearchWidget extends StatefulWidget {
  const EventSearchWidget(
      {super.key, required this.title, required this.apiProvider});
  final String title;
  final APIProvider apiProvider;
  @override
  State<EventSearchWidget> createState() => _EventSearchWidget();
}

class _EventSearchWidget extends State<EventSearchWidget> {
  Future<Response<BuiltList<Event>>> eventsWithApi() async {
    return widget.apiProvider.api.getEventApi().getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Events",
        ),
        actions: <Widget>[], //add actions
      ),
      body: FutureBuilder<Response<BuiltList<Event>>>(
          future: eventsWithApi(),
          builder: (context, response) {
            if (response.hasData) {
              return Stack(
                children: <Widget>[
                  SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                      child: Column(children: <Widget>[
                        if (response.data!.data!.isNotEmpty)
                          for (var el in response.data!.data!) SingleEvent(el),
                      ]),
                    ),
                  ),
                ],
              );
              //
            } else {
              return (const Text('NoData'));
            }
          }),
    );
  }
}