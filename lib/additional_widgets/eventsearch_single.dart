import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';

class SingleEvent extends StatelessWidget {
  final Event event;
  SingleEvent(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 0.1,
                ),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      if (event.title != null) Text(event.title!),
                      Text(event.placeSchema!),
                      const SizedBox(
                        width: 45,
                      ),
                    ],
                  ),
                  viewDetailsButton(),
                ],
              ),
            )),
      ],
    );
  }

  Widget viewDetailsButton() {
    return SizedBox(
      height: 130.0,
      width: 130.0,
      child: ElevatedButton(
        style: ButtonStyles.raisedButtonStyle,
        onPressed: () {},
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'View',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MyFont1',
                ),
              ),
              Text(
                'Details',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MyFont1',
                ),
              ),
            ]),
      ),
    );
  }
}
