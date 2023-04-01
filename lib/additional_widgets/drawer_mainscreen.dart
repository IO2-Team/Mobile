import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:flutter/material.dart';

class DrawerBurger extends StatelessWidget {
  const DrawerBurger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
