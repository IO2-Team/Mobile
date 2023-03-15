import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

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
        title: Text(widget.title),
      ),
      body: FutureBuilder<Response<BuiltList<Event>>>(
          future: eventsWithApi(),
          builder: (context, response) {
            if (response.hasData) {
              return Stack(children: <Widget>[
                Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(70)),
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              if (response.data!.data!.isNotEmpty)
                                for (var el in response.data!.data!)
                                  if (el.title != null) Text(el.title!),
                              const Divider(
                                height: 10.0,
                                thickness: 1.0,
                              ),
                            ],
                          ),
                        )),
                  ],
                )
              ]);
            } else {
              return (const Text('NoData'));
            }
          }),
    );
  }
}
