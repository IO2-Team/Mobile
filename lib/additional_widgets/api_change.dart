import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/license.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:eventapp_mobile/additional_widgets/saveanddelete_reservation.dart';
import 'package:eventapp_mobile/additional_widgets/support.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class ChangeApi {
  Widget changeApi(SaveAndDeleteReservation sharedPref) {
    return Column(
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
                    "Data change",
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

        // changinh API

        ListTile(
          leading: Icon(
            Icons.add_alert,
            color: PageColor.texts,
          ),
          title: Text(
            'Data_1',
            style: TextStyle(fontSize: 18, color: PageColor.texts),
          ),
          onTap: () {
            sharedPref
                .apiChange('https://dionizos-backend-app.azurewebsites.net');
            Restart.restartApp();
          },
        ),
        ListTile(
          leading: Icon(
            Icons.account_balance_wallet,
            color: PageColor.texts,
          ),
          title: Text(
            'Data_2',
            style: TextStyle(fontSize: 18, color: PageColor.texts),
          ),
          onTap: () {
            sharedPref.apiChange(
                'http://io2central-env.eba-vfjwqcev.eu-north-1.elasticbeanstalk.com');
            Restart.restartApp();
          },
        ),
        ListTile(
          leading: Icon(
            Icons.adb,
            color: PageColor.texts,
          ),
          title: Text(
            'Data_3',
            style: TextStyle(fontSize: 18, color: PageColor.texts),
          ),
          onTap: () {
            //TODO when ready
          },
        ),
      ],
    );
  }
}
