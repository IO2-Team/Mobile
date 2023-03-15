import 'package:flutter/material.dart';

class PageColor {
  static final background1 = Color.fromARGB(255, 125, 112, 177);
  static final background2 = Color.fromARGB(255, 91, 70, 175);
  static final background3 = Color.fromARGB(255, 65, 40, 165);
}

class ButtonStyles {
  static final raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 84, 84, 238),
    minimumSize: const Size(68, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}
