import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventapp_mobile/additional_widgets/common.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SupportScreen extends StatelessWidget {
  TextEditingController textarea = TextEditingController();
  SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PageColor.eventSearch,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "Contact with support",
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, left: 20, top: 30.0),
                  child: TextField(
                    controller: textarea,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1000),
                    ],
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintText: "What's happen?",
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: PageColor.appBar))),
                  ),
                ),
                const Text("Limit 1000 characters!"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (textarea.text.isEmpty) {
                            Common.myShowAlert(
                                context, "Message can not be empty!");
                            return;
                          }
                          await sendMessage();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PageColor.appBar,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                          ),
                        ),
                        child: const Text(
                          "Send",
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MyFont1',
                          ),
                        )),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  sendMessage() {
    var webhook =
        'https://discord.com/api/webhooks/1092147358793465937/K-uITUP1xrPXpuwqHVCJ3znPn3w0O2yBGdQSNEVFZQ-VFvhjfYac-47OKXa1Qq2Ccc2K';
    var msg = """================================
User info:
    name: no_name
Message:
    ${textarea.text}
================================""";
    return http.post(
      Uri.parse(webhook),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'content': msg,
      }),
    );
  }
}
