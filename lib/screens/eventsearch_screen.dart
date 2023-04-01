// ignore_for_file: curly_braces_in_flow_control_structures, unnecessary_new, prefer_collection_literals

/// TO DO
/// sprawdzić czy działa nowy kod XD
/// dodać że scroll view jest trzywierszowy
/// uwzględnić filtrację na raz categorii oraz statusu eventu - pytanie jak?? czy każdy event sprawdzać? to chyba dobry pomysł
/// "burger"
/// zrobić usuwanie eventów które się odznaczy -> to mozę na koniec

import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/drawer_mainscreen.dart';
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
  // list for events for summary
  List<Event> eventsListbyCategory = new List.empty(growable: true);
  int countCategories = 0; // categories, probably useless in future
  // Map with categories, is it checked or note
  late Map<int, bool> categoryIndex = new Map();
  final Map<String, bool> statusIndex = {
    "inFuture": false,
    "pending": false,
    "done": false,
    "cancelled": false
  };
  final Set<String> statusArray = {"inFuture", "pending", "done", "cancelled"};
// id used for chosen category
  int id = -1;
  // used for waiting for new data
  bool isNewData = false;

// to refresh the screen
  Future refresh() async {
    setState(() {
      id = -1;
      eventsListbyCategory.clear();
    });
  }

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
        backgroundColor: PageColor.appBar,
        automaticallyImplyLeading: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Logo(),
              SizedBox(
                width: 55,
              )
            ],
          ),
        ),
        //actions: <Widget>[], //add actions
      ),
      drawer: const DrawerBurger(),
      body: FutureBuilder<Response<BuiltList<Event>>>(
          future: eventsWithApi(),
          builder: (context, response) {
            if (response.hasData) {
              if (id != -1 && response.data!.data!.isNotEmpty) {
                if (!isNewData)
                  isNewData = true;
                else {
                  for (var el in response.data!.data!)
                    if (!eventsListbyCategory.contains(el))
                      eventsListbyCategory.add(el);
                  isNewData = false;
                }
              }
              return Stack(
                children: <Widget>[
                  SizedBox(
                    height: double.infinity,
                    child: RefreshIndicator(
                      color: PageColor.appBar,
                      onRefresh: refresh,
                      child: SlidingUpPanel(
                        maxHeight: 400,
                        panel: Center(child: filter()),
                        minHeight: 50.0,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(144.0),
                          topRight: Radius.circular(44.0),
                        ),
                        collapsed: Container(
                          decoration: BoxDecoration(
                            color: PageColor.divider,
                          ),
                          child: Center(
                            child: slide(),
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

  ///
  ///widget shows slide_up_panel
  ///
  Widget slide() {
    return Column(
      children: [
        Padding(
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
        ),
        const Text(
          "Filter",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ],
    );
  }

  ///
  ///widget shows list with filter possibilities - categories and status
  ///
  Widget filter() {
    return Container(
      width: 1000, // nieogranicz
      color: PageColor.divider,
      child: Column(children: <Widget>[
        slide(),
        const Padding(
          padding: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Divider(
            color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
            height: 20.0,
            thickness: 1.0,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text("Categories"),
              FutureBuilder<Response<BuiltList<Category>>>(
                  future: categoriesWithApi(),
                  builder: (context, response) {
                    if (response.hasData) {
                      if (response.data != null &&
                          response.data!.data != null) {
                        countCategories = response.data!.data!.length;
                        if (id == -1)
                          for (var el in response.data!.data!) {
                            if (!categoryIndex.containsKey(el
                                .id!)) // only when new category, map is updated
                              categoryIndex.addAll({el.id!: false});
                          }
                      }

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: showCategories(response),
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: PageColor.appBar,
                      ));
                    }
                  }),
            ],
          ),
        ),
        Column(
          children: [
            Text("Status"),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                child: showStatus(),
              ),
            ),
          ],
        ),
        resetButton(),
      ]),
    );
  }

  ///
  ///widget shows list with available categories
  ///
  Widget showCategories(AsyncSnapshot<Response<BuiltList<Category>>> response) {
    int i = 0;
    return Column(
      children: [
        Row(
          children: [
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
                            ? PageColor.texts
                            : Colors.white,
                      ),
                    )),
          ],
        ),
        Row(
          children: [
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
                            ? PageColor.texts
                            : Colors.white,
                      ),
                    )),
          ],
        ),
        Row(
          children: [
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
                            ? PageColor.texts
                            : Colors.white,
                      ),
                    )),
          ],
        ),
      ],
    );
  }

  ///
  ///widget shows list with available status(es) of events
  ///

  Widget showStatus() {
    return Row(
      children: [
        for (var el in statusArray)
          MaterialButton(
              onPressed: () {
                if (statusIndex[el] != true) {
                  setState(() {
                    statusIndex[el] = true;
                  });
                }
              },
              child: Text(
                el,
                style: TextStyle(
                  fontSize: 18.0,
                  color:
                      statusIndex[el] == true ? PageColor.texts : Colors.white,
                ),
              )),
      ],
    );
  }

  ///
  ///Button to reset checked categories and load all events
  ///
  Widget resetButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0, top: 20),
      alignment: Alignment.center,
      child: SizedBox(
        width: 300.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: PageColor.eventSearch,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
          ),
          onPressed: () {
            setState(() {
              id = -1;
              eventsListbyCategory.clear();
              // categoryIndex.clear(); // UWAGA
              for (var name in statusArray) statusIndex[name] = false;
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
    );
  }
}
