import 'package:eventapp_mobile/additional_widgets/api_change.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/license.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/additional_widgets/support.dart';
import 'package:flutter/material.dart';

class DrawerBurger extends StatelessWidget {
  const DrawerBurger({required this.sharedPref, Key? key}) : super(key: key);
  final SaveAndDeleteReservation sharedPref;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      backgroundColor: PageColor.burger,
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
                      children: const [
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Center(
                              child: Text(
                            overflow: TextOverflow.clip,
                            "License & support",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MyFont1',
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.picture_as_pdf_outlined,
                    color: PageColor.texts,
                  ),
                  title: Text(
                    'License',
                    style: TextStyle(fontSize: 18, color: PageColor.texts),
                  ),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LicenseWebView(),
                    ));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.contact_support,
                    color: PageColor.texts,
                  ),
                  title: Text(
                    'Support',
                    style: TextStyle(color: PageColor.texts, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                              extendBodyBehindAppBar: true,
                              appBar: AppBar(
                                backgroundColor: Colors.transparent,
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
                              ),
                              body: SupportScreen(),
                            )));
                  },
                ),
                ChangeApi().changeApi(sharedPref)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
