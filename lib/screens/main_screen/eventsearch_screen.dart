// ignore_for_file: curly_braces_in_flow_control_structures, unnecessary_new, prefer_collection_literals

import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/drawer_mainscreen.dart';
import 'package:eventapp_mobile/additional_widgets/localization.dart';
import 'package:eventapp_mobile/screens/reservatedevents_screens/reservatedeventslist_screen.dart';
import 'package:flutter/material.dart';
import 'package:eventapp_mobile/api/api_provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/screens/main_screen/eventsearch_single.dart';
import 'package:provider/provider.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../additional_widgets/saveanddelete_reservation.dart';
import '../../api/blob.dart';

///////////////////////////////////////////////////////////////
/// Widget which shows events list
///////////////////////////////////////////////////////////////

class EventSearchWidget extends StatefulWidget {
  const EventSearchWidget(
      {super.key, required this.title,  required this.blob, required this.sharedPref});
  final String title;
  final SaveAndDeleteReservation sharedPref;
   final Blob blob;
  // final APIProvider apiProvider;
  @override
  State<EventSearchWidget> createState() => _EventSearchWidget();
}

class _EventSearchWidget extends State<EventSearchWidget> {
  TextEditingController textarea = TextEditingController();
  // list for events for summary
  bool isFiltersChecked = true;
  // to add categories when isReset == true
  bool isRest = true;
  // list with events to show
  List<Event> eventsList = new List.empty(growable: true);
  // list with categories to show, only when screen is refreshed
  List<Category> categoriesList = new List.empty(growable: true);
  // lists with different categories
  late Map<int, List<Event>> eventsListsbyCategories = new Map();
  // categories, probably useless in future
  int countCategories = 0;
  // Map with categories, is it checked or note
  late Map<int, bool> categoryIndex = new Map();
  // id used for chosen category
  int id = -1;
  // used for waiting for new data
  bool isNewData = false;
  // radius for sliding up pannel
  final double _radius = 60;
  // for sorting
  final Map<String, bool> sortIndex = {
    "distance": false,
    "dateoldest": false,
    "daterecent": true,
  };

  final Map<String, bool> statusIndex = {
    "inFuture": false,
    "pending": false,
    "done": false,
    "cancelled": false
  };
  final Set<String> statusArray = {"inFuture", "pending", "done", "cancelled"};

// to refresh the screen
  Future refresh() async {
    setState(() {
      isRest = true;
      id = -1;
    });
  }

  Future<Position> getDist() async {
    return MyLocalization.getCurrentLocation();
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
      key: Key('Appbarr'),
      extendBodyBehindAppBar: true,
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservatedListEventsWidget(
                            sharedPref: widget.sharedPref))).then((value) {
                  refresh();
                });
              },
              child: const Icon(
                Icons.qr_code_2_rounded,
                size: 37,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      drawer: DrawerBurger(sharedPref: widget.sharedPref),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/mainscreen.jpg"), fit: BoxFit.cover),
        ),
        child: FutureBuilder(
            future: Future.wait([eventsWithApi(), getDist()]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              //  future: eventsWithApi(),
              //builder: (context, response) {
              if (snapshot.data != null) {
                if (id != -1 && snapshot.data![0].data!.isNotEmpty) {
                  // if any category
                  if (!isNewData)
                    isNewData = true; //wpp za malo czasu
                  else {
                    isNewData = false;
                    eventsList.clear();

                    if (id !=
                        -2) // adding events from selected category, -2 when category unchecked - then no data added
                      for (var el in snapshot.data![0].data!)
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
                      for (var el in snapshot.data![0].data!)
                        eventsList.add(el);

                    // sort by date
                    if (eventsList.isNotEmpty)
                      eventsList.sort(
                          ((a, b) => (a.startTime).compareTo(b.startTime)));
                  }
                } else if (snapshot.data![0].data!.isNotEmpty) {
                  eventsList.clear();
                  for (var el in snapshot.data![0].data!) eventsList.add(el);

                  // sort by date
                  if (eventsList.isNotEmpty) {
                    if (sortIndex['daterecent'] == true) {
                      eventsList.sort(
                          ((a, b) => (a.startTime).compareTo(b.startTime)));
                    } else if (sortIndex['dateoldest'] == true) {
                      eventsList.sort(
                          ((a, b) => (b.startTime).compareTo(a.startTime)));
                    } else if (sortIndex['distance'] == true) {
                      try {
                        // MyLocalization.getCurrentLocation().then((value) =>

                        eventsList.sort(((a,
                                b) => // (b.startTime).compareTo(a.startTime)));

                            ((((double.parse(a.longitude) * 10000 -
                                                snapshot.data![1].longitude *
                                                    10000) *
                                            (double.parse(a.longitude) * 10000 -
                                                snapshot.data![1].longitude *
                                                    10000) +
                                        (double.parse(a.latitude) * 10000 -
                                                snapshot.data![1].latitude *
                                                    10000) *
                                            (double.parse(a.latitude) * 10000 -
                                                snapshot.data![1].latitude * 10000)))
                                    .toInt())
                                .compareTo((((double.parse(b.longitude) * 10000 - snapshot.data![1].longitude * 10000) * (double.parse(b.longitude) * 10000 - snapshot.data![1].longitude * 10000) + (double.parse(b.latitude) * 10000 - snapshot.data![1].latitude * 10000) * (double.parse(b.latitude) * 10000 - snapshot.data![1].latitude * 10000))).toInt())));
                      } catch (e) {
                        // TODO so far nothing, just not working localizayion
                      }
                    }
                  }
                }
                return Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 105.0),
                      child: SizedBox(
                        height: double.infinity,
                        child: RefreshIndicator(
                          key: const Key("mainScreenIndicator"),
                          color: PageColor.appBar,
                          onRefresh: refresh,
                          child: SlidingUpPanel(
                            key: const Key('slidingup_panel'),
                            maxHeight: 430,
                            panel: Center(
                                child: Container(
                                    constraints: BoxConstraints.expand(),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("images/slideup.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                    child: filter())),
                            minHeight: 60.0,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(_radius),
                              topRight: Radius.circular(_radius),
                            ),
                            collapsed: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(_radius),
                                  topRight: Radius.circular(_radius),
                                ),
                              ),
                              child: Center(
                                child: slide(),
                              ),
                            ),
                            body: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 160.0),
                                child: Column(children: <Widget>[
                                  if (eventsList.isNotEmpty)
                                    for (var el in eventsList)
                                      if (((statusIndex["inFuture"] == false &&
                                                  statusIndex["pending"] ==
                                                      false &&
                                                  statusIndex["done"] ==
                                                      false &&
                                                  statusIndex["cancelled"] ==
                                                      false &&
                                                  el.status.name ==
                                                      "inFuture") ||
                                              (el.status.name == "inFuture" &&
                                                  statusIndex["inFuture"] ==
                                                      true) ||
                                              (el.status.name == "pending" &&
                                                  statusIndex["pending"] ==
                                                      true) ||
                                              (el.status.name == "done" &&
                                                  statusIndex["done"] ==
                                                      true) ||
                                              (el.status.name == "cancelled" &&
                                                  statusIndex["cancelled"] ==
                                                      true)) &&
                                          (textarea.text.isEmpty ||
                                              el.title.toLowerCase().contains(
                                                  textarea.text.toLowerCase())))
                                        SingleEvent(el,
                                            sharedPref: widget.sharedPref,
                                            blob:widget.blob),
                                ]),
                              ),
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
                  color: Colors.white,
                ));
              }
            }),
      ),
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
                          ? PageColor.filters
                          : Color.fromARGB(134, 15, 50, 90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_radius),
                            topRight: Radius.circular(_radius)),
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
                          ? PageColor.filters
                          : Color.fromARGB(134, 15, 50, 90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_radius),
                            topRight: Radius.circular(_radius)),
                      )),
                  child: Container(
                    padding: const EdgeInsets.only(left: 17, right: 17),
                    child: const Text(
                      "SortBy&Search",
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
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_radius),
          topRight: Radius.circular(_radius),
        ),
      ),
      child: Column(children: <Widget>[
        slide(),
        Divider(
          color: PageColor.filters, //Color.fromARGB(255, 149, 149, 254),
          height: 3.0,
          thickness: 1.0,
        ),
        if (isFiltersChecked)
          Expanded(
            child: Container(
              width: 1000,
              color: Colors.transparent,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(color: PageColor.filters, fontSize: 17),
                    ),
                  ),
                  isRest
                      ? FutureBuilder<Response<BuiltList<Category>>>(
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
                                  categoriesList.clear();

                                  // adding new categories to categoriesList
                                  for (var el in response.data!.data!) {
                                    categoryIndex.addAll({el.id: false});
                                    eventsListsbyCategories.addAll({
                                      el.id: new List.empty(growable: true)
                                    }); // new empty lists added
                                    categoriesList.add(el);
                                  } // only when new category, map is updated
                                }
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: showCategories(),
                              );
                            } else {
                              return const Center();
                            }
                          })
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: showCategories(),
                        ),
                ],
              ),
            ),
          ),
        if (isFiltersChecked)
          Container(
            width: 1000,
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Divider(
                    color:
                        PageColor.filters, //Color.fromARGB(255, 149, 149, 254),
                    height: 20.0,
                    thickness: 1.0,
                  ),
                ),
                Text(
                  "Status",
                  style: TextStyle(color: PageColor.filters, fontSize: 17),
                ),
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: showStatus(),
                  ),
                ),
                Container(
                    width: 1000,
                    color: Colors.transparent,
                    child: resetButton()),
              ],
            ),
          ),
        if (!isFiltersChecked)
          Expanded(
              child: Container(
                  width: 1000,
                  color: Colors.transparent,
                  child: Center(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Search by name",
                            style: TextStyle(
                                color: PageColor.filters, fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: SizedBox(
                            width: 300,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors
                                    .white, // Set the desired background color here
                                borderRadius: BorderRadius.circular(
                                    30.0), // Set the desired border radius here
                              ),
                              child: TextField(
                                cursorColor: PageColor.logo1,
                                controller: textarea,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(200),
                                ],
                                keyboardType: TextInputType.name,
                                minLines: 1,
                                //maxLines: 2,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.search,
                                      color: PageColor.appBar,
                                      size: 35,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30.0)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: PageColor.asActiveEvent))),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 1000,
                            color: Colors.transparent,
                            child: searchButton()),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 18.0, left: 18, top: 30),
                          child: Divider(
                            color: PageColor
                                .filters, //Color.fromARGB(255, 149, 149, 254),
                            height: 20.0,
                            thickness: 1.0,
                          ),
                        ),
                        Text(
                          "Sort by",
                          style:
                              TextStyle(color: PageColor.filters, fontSize: 17),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: SizedBox(
                            width: 280,
                            child: MaterialButton(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 45.0, right: 45),
                                elevation: 0,
                                color: PageColor.categoriesAndStatus,
                                onPressed: () {
                                  if (sortIndex['daterecent'] != true) {
                                    setState(() {
                                      sortIndex['daterecent'] = true;
                                      sortIndex['distance'] = false;
                                      sortIndex['dateoldest'] = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "BY DATE (most recent)",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: sortIndex['daterecent'] == true
                                        ? PageColor.logo1
                                        : Colors.white,
                                    fontFamily: 'MyFont1',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: SizedBox(
                            width: 280,
                            child: MaterialButton(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 45.0, right: 45),
                                elevation: 0,
                                color: PageColor.categoriesAndStatus,
                                onPressed: () {
                                  if (sortIndex['dateoldest'] != true) {
                                    setState(() {
                                      sortIndex['daterecent'] = false;
                                      sortIndex['distance'] = false;
                                      sortIndex['dateoldest'] = true;
                                    });
                                  }
                                },
                                child: Text(
                                  "BY DATE (oldest)",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: sortIndex['dateoldest'] == true
                                        ? PageColor.logo1
                                        : Colors.white,
                                    fontFamily: 'MyFont1',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2),
                          child: SizedBox(
                            width: 280,
                            child: MaterialButton(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30),
                                elevation: 0,
                                color: PageColor.categoriesAndStatus,
                                onPressed: () {
                                  if (sortIndex['distance'] != true) {
                                    setState(() {
                                      sortIndex['daterecent'] = false;
                                      sortIndex['distance'] = true;
                                      sortIndex['dateoldest'] = false;
                                    });
                                  }
                                },
                                child: Text(
                                  'BY DISTANCE',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: sortIndex['distance'] == true
                                        ? PageColor.logo1
                                        : Colors.white,
                                    fontFamily: 'MyFont1',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ))),
      ]),
    );
  }

  ///
  ///widget shows list with available categories
  ///
  Widget showCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            for (int i = 0; i <= countCategories ~/ 3; i++)
              categoryButton(categoriesList, i),
          ],
        ),
        Row(
          children: [
            for (int i = countCategories ~/ 3 + 1;
                i <= countCategories * 2 ~/ 3;
                i++)
              categoryButton(categoriesList, i),
          ],
        ),
        Row(
          children: [
            for (int i = countCategories * 2 ~/ 3 + 1; i < countCategories; i++)
              categoryButton(categoriesList, i),
          ],
        ),
      ],
    );
  }

  ///
  /// Widget which shows single category
  ///
  Widget categoryButton(List<Category> categoriesList, int i) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2),
      child: MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          padding: const EdgeInsets.only(left: 4.0, right: 4),
          elevation: 0,
          onPressed: () {
            if (categoryIndex[categoriesList[i].id] != true) {
              setState(() {
                id = categoriesList[i].id;
                categoryIndex[id] = true;
              });
            } else {
              setState(() {
                id = -2;
                eventsListsbyCategories[categoriesList[i].id]!.clear();
                categoryIndex[categoriesList[i].id] = false;
              });
            }
          },
          color: PageColor.categories, //change
          child: Text(
            categoriesList[i].name.toUpperCase(),
            style: TextStyle(
              fontSize: 15.0,
              color: categoryIndex[categoriesList[i].id] == true
                  ? PageColor.logo1
                  : Colors.white,
              fontFamily: 'MyFont1',
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  ///
  ///widget shows list with available status(es) of events
  ///

  Widget showStatus() {
    return Row(
      children: [
        for (var el in statusArray)
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2),
            child: MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                padding: const EdgeInsets.only(left: 3.0, right: 3),
                elevation: 0,
                color: PageColor.categoriesAndStatus,
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
                  el.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: statusIndex[el] == true
                        ? PageColor.logo1
                        : Colors.white,
                    fontFamily: 'MyFont1',
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
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
            backgroundColor: PageColor.filters,
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

  ///
  ///Button to search
  ///
  Widget searchButton() {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: PageColor.filters,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
          ),
          onPressed: () {
            setState(() {});
          },
          child: const Text(
            'Search',
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
