import 'package:flutter/material.dart';

class Common {
  static void myShowAlert(BuildContext context, String content) {
    AlertDialog alert = AlertDialog(
      title: const Text("Warning"),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  static InputDecoration myTextFieldDecoration(String? hint) {
    return InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ));
  }

  static Widget getLoading(BuildContext context, Color color) => Center(
          child: CircularProgressIndicator(
        color: color,
      ));

  static String fromDateTime(DateTime? d) {
    if (d == null) "Unknown";
    return "${d!.day.toString()}.${d.month.toString()}.${d.year.toString()}";
  }
}
