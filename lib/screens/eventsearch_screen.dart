// ignore_for_file: curly_braces_in_flow_control_structures, unnecessary_new, prefer_collection_literals

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
  // list for events for summary
  List<Event> eventsListbyCategory = new List.empty(growable: true);
  int countCategories = 0; // categories, probably useless in future
  // Map with categories, is it checked or note
  late Map<int, bool> categoryIndex = new Map();
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
                width: 48,
              )
            ],
          ),
        ),
        //actions: <Widget>[], //add actions
      ),
      drawer: drawerBurger(),
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
                        panel: Center(child: listOfCategories()),
                        minHeight: 50.0,
                        collapsed: Container(
                          decoration: BoxDecoration(
                            color: PageColor.appBar,
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
          "Categories",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ],
    );
  }

  ///
  ///widget shows list with available categories
  ///
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

              return Column(children: <Widget>[
                Column(
                  children: [
                    slide(),
                  ],
                ),
                const Divider(
                  color: Colors.white, //Color.fromARGB(255, 149, 149, 254),
                  height: 20.0,
                  thickness: 1.0,
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
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
                  ),
                ),
                resetButton(),
              ]);
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
  ///Button to reset checked categories and load all events
  ///
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

  Widget drawerBurger() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(children: <Widget>[
        Expanded(
          child: SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: 64,
                  child: DrawerHeader(
                    decoration: BoxDecoration(color: PageColor.appBar),
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Center(
                              child: Text(
                            "License & support",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.picture_as_pdf_outlined),
                  title: const Text('License'),
                  onTap: () {
                    //    Navigator.of(context)
                    //      .popUntil((route) => route.isFirst);
                    ///   Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScaffold(const LicenseWebView(),false,user: widget.user,backgroundColor: widget.backgroundColor),));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_support),
                  title: const Text('Support'),
                  onTap: () {
                    //  Navigator.of(context)
                    //      .popUntil((route) => route.isFirst);
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScaffold(SupportScreen(cloudUser: widget.user!,backgroundColor: widget.backgroundColor),false,user: widget.user,backgroundColor: widget.backgroundColor),));
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
