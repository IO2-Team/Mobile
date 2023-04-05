import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/license.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:eventapp_mobile/additional_widgets/support.dart';
import 'package:flutter/material.dart';

class DrawerBurger extends StatelessWidget {
  const DrawerBurger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      backgroundColor: PageColor.eventSearch,
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.picture_as_pdf_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'License',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LicenseWebView(),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.contact_support,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Support',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                              appBar: AppBar(
                                backgroundColor: PageColor.appBar,
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
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
