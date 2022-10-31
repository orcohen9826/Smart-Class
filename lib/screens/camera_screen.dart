import 'dart:io';

import 'package:afekaton_project/class_room.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class CameraSCreen extends StatefulWidget {
  @override
  _CameraSCreenState createState() => _CameraSCreenState();
}

class _CameraSCreenState extends State<CameraSCreen> {
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Board Camera"),
        ),
        body: Column(children: [
          AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('images/baord.jpeg'),
                          fit: BoxFit.cover)))),
          /*child: WebView(
                debuggingEnabled: true,
                initialUrl: 'http://192.168.231.184',
              )),*/
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan[100],
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Icon(
                    Icons.crop_sharp,
                    size: 50,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan[100],
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Icon(
                    Icons.aspect_ratio_sharp,
                    size: 50,
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
