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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/slideup.jpg"), fit: BoxFit.cover),
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 105.0),
            child: WebViewWidget(controller: controller),
          )
        ]),
      ),
    );
  }
}
