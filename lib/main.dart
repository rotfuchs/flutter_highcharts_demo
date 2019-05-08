import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

Future main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Highcharts Demo'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              (progress != 1.0) ? LinearProgressIndicator(value: progress) : null,
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: InAppWebView(
//                    initialUrl: "",
                    initialHeaders: {

                    },
                    initialOptions: {
                      "useWideViewPort": true,
                      "clearCache": true
                    },
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                      webView.loadFile("assets/basic.html");
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {

                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress/100;
                      });
                    },
                  ),
                ),
              ),
//              ButtonBar(
//                alignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  RaisedButton(
//                    child: Icon(Icons.refresh),
//                    onPressed: () {
//                      if (webView != null) {
//                        webView.reload();
//                      }
//                    },
//                  ),
//                ],
//              ),
            ].where((Object o) => o != null).toList(),
          ),
        ),
      ),
    );
  }
}