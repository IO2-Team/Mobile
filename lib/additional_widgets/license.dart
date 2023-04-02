import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';
import 'package:eventapp_mobile/additional_widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//import 'dart:html' as html;

class LicenseWebView extends StatelessWidget {
  const LicenseWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fileUrl = 'https://xevix.tplinkdns.com/regulamin.pdf';
    var url = 'https://docs.google.com/gview?embedded=true&url=$fileUrl';
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(url),
      );
    return Scaffold(
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
      body: WebViewWidget(controller: controller),
    );
  }
}
