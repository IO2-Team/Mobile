import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:flutter/material.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/eventsearch_single.dart';
import 'package:provider/provider.dart';

class EventSearchWidget extends StatefulWidget {
  const EventSearchWidget({super.key, required this.title});
  final String title;
  // final APIProvider apiProvider;
  @override
  State<EventSearchWidget> createState() => _EventSearchWidget();
}

class _EventSearchWidget extends State<EventSearchWidget> {
  Future<Response<BuiltList<Event>>> eventsWithApi() async {
    return context
        .read<APIProvider>()
        .api
        .getEventApi()
        .getEvents(); // widget.apiProvider.api.getEventApi().getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColor.eventSearch,
      appBar: AppBar(
        backgroundColor: PageColor.appBar,
        automaticallyImplyLeading: false,
        title: Center(
          child: GradientText(
            'Dionizos',
            style: TextStyle(fontSize: 35),
            gradient: LinearGradient(
              colors: [PageColor.logo1, PageColor.logo2],
            ),
          ),
        ),
        //actions: <Widget>[], //add actions
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
              return Center(
                  child: CircularProgressIndicator(
                color: PageColor.appBar,
              ));
            }
          }),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
