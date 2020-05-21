import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';

void download(
  List<int> bytes, {
  String downloadName,
}) {
  // Encode our file in base64
  final _base64 = base64Encode(bytes);
  // Create the link with the file
  final anchor =
      html.AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
        ..target = 'blank';
  // add the name
  if (downloadName != null) {
    anchor.download = downloadName;
  }
  // trigger download
  html.document.body.append(anchor);
  anchor.click();
  anchor.remove();
  return;
}

class CDNCloudformationPage extends StatelessWidget {
  static final String route = '/aws-cdn';
  static final String title = 'AWS CDN';
  static final String description = 'create a cloudformation template';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Generate a Cloudformation template",
      )),
      body: Center(
        child: Container(
          width: 992.0,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Text('Bucket Name')),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          hintText: 'Enter City Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Text('Default Root Object')),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          hintText: 'Default Root Object',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
