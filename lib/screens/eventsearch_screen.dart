// ignore_for_file: curly_braces_in_flow_control_structures, unnecessary_new, prefer_collection_literals

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

///////////////////////////////////////////////////////////////
/// Widget which shows events list
///////////////////////////////////////////////////////////////

class EventSearchWidget extends StatefulWidget {
  const EventSearchWidget({super.key, required this.title});
  final String title;
  // final APIProvider apiProvider;
  @override
  State<EventSearchWidget> createState() => _EventSearchWidget();
}

class _EventSearchWidget extends State<EventSearchWidget> {
  // list for events for summary
  bool isFiltersChecked = true;
  bool isRest = true;
  List<Event> eventsList = new List.empty(growable: true);
  late Map<int, List<Event>> eventsListsbyCategories = new Map();
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
      isRest = true;
      id = -1;
    });
  }

  Future<Response<BuiltList<Event>>> eventsWithApi() async {
    if (id == -1 || id == -2)
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
        title: const Center(
          child: Logo(),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.qr_code_2_rounded,
              size: 37,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const DrawerBurger(),
      body: FutureBuilder<Response<BuiltList<Event>>>(
          future: eventsWithApi(),
          builder: (context, response) {
            if (response.hasData) {
              if (response.data!.data!.isNotEmpty) {
                if (!isNewData)
                  isNewData = true; //wpp za malo czasu
                else {
                  isNewData = false;
                  eventsList.clear();

                  if (id == -1) {
                    // if no category has been chosen
                    if (eventsList.isEmpty)
                      for (var el in response.data!.data!) eventsList.add(el);
                  } else {
                    if (id !=
                        -2) // adding events from selected category, -2 when category unchecked - then no data added
                      for (var el in response.data!.data!)
                        if (!eventsListsbyCategories[id]!.contains(el)) {
                          eventsListsbyCategories[id]!.add(el);
                          eventsList.add(el);
                        }
                    // adding categories if any more checked
                    for (var eKey in categoryIndex.keys)
                      if (categoryIndex[eKey] == true)
                        for (var el in eventsListsbyCategories[eKey]!)
                          if (!eventsList.contains(el)) eventsList.add(el);
                    // if no category has been chosen
                    if (eventsList.isEmpty)
                      for (var el in response.data!.data!) eventsList.add(el);
                  }
                  // sort by date
                  if (eventsList.isNotEmpty)
                    eventsList.sort(
                        ((a, b) => (a.startTime!).compareTo(b.startTime!)));
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
                        maxHeight: 430,
                        panel: Center(child: filter()),
                        minHeight: 60.0,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        collapsed: Container(
                          decoration: BoxDecoration(
                            color: PageColor.appBar,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
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
                              if (eventsList.isNotEmpty)
                                for (var el in eventsList)
                                  if ((statusIndex["inFuture"] == false &&
                                          statusIndex["pending"] == false &&
                                          statusIndex["done"] == false &&
                                          statusIndex["cancelled"] == false &&
                                          el.status!.name == "inFuture") ||
                                      (el.status!.name == "inFuture" &&
                                          statusIndex["inFuture"] == true) ||
                                      (el.status!.name == "pending" &&
                                          statusIndex["pending"] == true) ||
                                      (el.status!.name == "done" &&
                                          statusIndex["done"] == true) ||
                                      (el.status!.name == "cancelled" &&
                                          statusIndex["cancelled"] == true))
                                    SingleEvent(el),
                              // if ((id == -1 ||
                              //         id != -1 && eventsList.isEmpty) &&
                              //     response.data!.data!.isNotEmpty)
                              //   for (var el in response.data!.data!)
                              //     if ((statusIndex["inFuture"] == false &&
                              //             statusIndex["pending"] == false &&
                              //             statusIndex["done"] == false &&
                              //             statusIndex["cancelled"] == false &&
                              //             el.status!.name == "inFuture") ||
                              //         (el.status!.name == "inFuture" &&
                              //             statusIndex["inFuture"] == true) ||
                              //         (el.status!.name == "pending" &&
                              //             statusIndex["pending"] == true) ||
                              //         (el.status!.name == "done" &&
                              //             statusIndex["done"] == true) ||
                              //         (el.status!.name == "cancelled" &&
                              //             statusIndex["cancelled"] == true))
                              //       SingleEvent(el),
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
          padding: const EdgeInsets.only(top: 8.0, left: 7.0, right: 7.0),
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
        Row(
          children: [
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFiltersChecked = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      backgroundColor: isFiltersChecked
                          ? PageColor.divider
                          : PageColor.appBar,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      )),
                  child: Container(
                    padding: EdgeInsets.only(left: 45, right: 45),
                    child: const Text(
                      "Filters",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFiltersChecked = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      backgroundColor: !isFiltersChecked
                          ? PageColor.divider
                          : PageColor.appBar,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      )),
                  child: Container(
                    padding: EdgeInsets.only(left: 45, right: 45),
                    child: const Text(
                      "SortBy",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
      decoration: BoxDecoration(
        color: PageColor.appBar,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(children: <Widget>[
        slide(),
        Divider(
          color: PageColor.eventSearch, //Color.fromARGB(255, 149, 149, 254),
          height: 0.0,
          thickness: 1.0,
        ),
        if (isFiltersChecked)
          Expanded(
            child: Container(
              width: 1000,
              color: PageColor.divider,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const Text(
                      "Categories",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  FutureBuilder<Response<BuiltList<Category>>>(
                      future: categoriesWithApi(),
                      builder: (context, response) {
                        if (response.hasData) {
                          if (response.data != null &&
                              response.data!.data != null) {
                            countCategories = response.data!.data!.length;
                            if (id == -1 && isRest == true) {
                              // only on start and when resstart button it check if element is new
                              isRest = false;
                              categoryIndex.clear();
                              eventsListsbyCategories.clear();
                              for (var el in response.data!.data!) {
                                categoryIndex.addAll({el.id!: false});
                                eventsListsbyCategories.addAll({
                                  el.id!: new List.empty(growable: true)
                                }); // new empty lists added
                              } // only when new category, map is updated
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
          ),
        if (isFiltersChecked)
          Container(
            width: 1000,
            color: PageColor.divider,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Divider(
                    color: PageColor
                        .eventSearch, //Color.fromARGB(255, 149, 149, 254),
                    height: 20.0,
                    thickness: 1.0,
                  ),
                ),
                const Text(
                  "Status",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: showStatus(),
                  ),
                ),
              ],
            ),
          ),
        if (!isFiltersChecked)
          Expanded(
              child: Container(
                  width: 1000,
                  color: PageColor.divider,
                  child: Center(
                      child: Text(
                    "so far only by date available",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )))),
        Container(width: 1000, color: PageColor.divider, child: resetButton()),
      ]),
    );
  }

  ///
  ///widget shows list with available categories
  ///
  Widget showCategories(AsyncSnapshot<Response<BuiltList<Category>>> response) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            if (response.data!.data!.isNotEmpty)
              for (int i = 0; i <= countCategories ~/ 3; i++)
                categoryButton(response, i),
          ],
        ),
        Row(
          children: [
            if (response.data!.data!.isNotEmpty)
              for (int i = countCategories ~/ 3 + 1;
                  i <= countCategories * 2 ~/ 3;
                  i++)
                categoryButton(response, i),
          ],
        ),
        Row(
          children: [
            if (response.data!.data!.isNotEmpty)
              for (int i = countCategories * 2 ~/ 3 + 1;
                  i < countCategories;
                  i++)
                categoryButton(response, i),
          ],
        ),
      ],
    );
  }

  ///
  /// Widget which shows single category
  ///
  Widget categoryButton(
      AsyncSnapshot<Response<BuiltList<Category>>> response, int i) {
    return MaterialButton(
        onPressed: () {
          if (response.data!.data![i].id != null) {
            if (categoryIndex[response.data!.data![i].id] != true) {
              setState(() {
                id = response.data!.data![i].id!;
                categoryIndex[id] = true;
              });
            } else {
              setState(() {
                id = -2;
                eventsListsbyCategories[response.data!.data![i].id!]!.clear();
                categoryIndex[response.data!.data![i].id!] = false;
              });
            }
          }
        },
        child: Text(
          response.data!.data![i].name!,
          style: TextStyle(
            fontSize: 18.0,
            color: categoryIndex[response.data!.data![i].id!] == true
                ? PageColor.logo1
                : PageColor.category,
          ),
        ));
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
                } else {
                  setState(() {
                    statusIndex[el] = false;
                  });
                }
              },
              child: Text(
                el,
                style: TextStyle(
                  fontSize: 18.0,
                  color: statusIndex[el] == true
                      ? PageColor.logo1
                      : PageColor.category,
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
              isRest = true;
              id = -1;
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
