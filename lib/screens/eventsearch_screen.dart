import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:flutter/material.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/eventsearch_single.dart';
import 'package:provider/provider.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class EventSearchWidget extends StatefulWidget {
  const EventSearchWidget({super.key, required this.title});
  final String title;
  // final APIProvider apiProvider;
  @override
  State<EventSearchWidget> createState() => _EventSearchWidget();
}

class _EventSearchWidget extends State<EventSearchWidget> {
  // list for events
  List<Event> eventsListbyCategory = new List.empty(growable: true);
  int countCategories = 0;
  late Map<int, bool> categoryIndex = new Map();
  int indexInList = -1;
  int id = -1;
  bool isNewData = false;
  Future<Response<BuiltList<Event>>> eventsWithApi() async {
    if (id == -1)
      return context
          .read<APIProvider>()
          .api
          .getEventApi()
          .getEvents(); // widget.apiProvider.api.getEventApi().getEvents();
    else
      return context
          .read<APIProvider>()
          .api
          .getEventApi()
          .getByCategory(categoryId: id);
  }

  Future<Response<BuiltList<Category>>> categoriesWithApi() async {
    return context
        .read<APIProvider>()
        .api
        .getCategoriesApi()
        .getCategories(); // widget.apiProvider.api.getEventApi().getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColor.eventSearch,
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () {},
          child: Icon(
            IconsInApp.burgerMhm,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: const [
          SizedBox(
            width: 40,
          )
        ],
        backgroundColor: PageColor.appBar,
        automaticallyImplyLeading: false,
        title: Center(
          child: Logo(),
        ),
        //actions: <Widget>[], //add actions
      ),
      body: FutureBuilder<Response<BuiltList<Event>>>(
          future: eventsWithApi(),
          builder: (context, response) {
            if (response.hasData) {
              if (id != -1 && response.data!.data!.isNotEmpty) {
                if (!isNewData)
                  isNewData = true;
                else {
                  for (var el in response.data!.data!)
                    eventsListbyCategory.add(el);
                  isNewData = false;
                }
              }
              return Stack(
                children: <Widget>[
                  SizedBox(
                    height: double.infinity,
                    child: SlidingUpPanel(
                      panel: Center(child: listOfCategories()),
                      minHeight: 50.0,
                      collapsed: Container(
                        decoration: BoxDecoration(
                          color: PageColor.appBar,
                        ),
                        // collapsed text
                        child: Center(
                          child: Column(
                            children: [
                              slide(),
                              const Text(
                                "Categories",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                      body: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 10.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 160.0),
                          child: Column(children: <Widget>[
                            if (id != -1)
                              for (var el in eventsListbyCategory)
                                SingleEvent(el),
                            if (id == -1 && response.data!.data!.isNotEmpty)
                              for (var el in response.data!.data!)
                                SingleEvent(el),
                          ]),
                        ),
                      ),
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

  Widget slide() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 7.0, right: 7.0, bottom: 8),
      child: SizedBox(
        width: 47,
        height: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget listOfCategories() {
    return Container(
      width: 500, // nieogranicz
      color: PageColor.appBar,
      child: FutureBuilder<Response<BuiltList<Category>>>(
          future: categoriesWithApi(),
          builder: (context, response) {
            if (response.hasData) {
              if (response.data != null && response.data!.data != null) {
                countCategories = response.data!.data!.length;
                if (id == -1)
                  for (var el in response.data!.data!) {
                    categoryIndex.addAll({el.id!: false});
                  }
              }

              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(children: <Widget>[
                  Column(
                    children: [
                      slide(),
                      const Text(
                        "Categories",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
                    height: 20.0,
                    thickness: 1.0,
                  ),
                  if (response.data!.data!.isNotEmpty)
                    for (var el in response.data!.data!)
                      MaterialButton(
                          onPressed: () {
                            if (el.id != null) {
                              if (categoryIndex[el.id] != true) {
                                setState(() {
                                  id = el.id!;
                                  categoryIndex[id] = true;
                                });
                              }
                            }
                          },
                          child: Text(
                            el.name!,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: categoryIndex[el.id!] == true
                                  ? PageColor.doneCanceled
                                  : Colors.white,
                            ),
                          )),
                  resetButton(),
                ]),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: PageColor.appBar,
              ));
            }
          }),
    );
  }

  Widget resetButton() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        alignment: Alignment.center,
        child: SizedBox(
          width: 300.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PageColor.divider,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
            ),
            onPressed: () {
              setState(() {
                id = -1;
                eventsListbyCategory.clear();
              });
            },
            child: const Text(
              'Reset',
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
    );
  }
}
