import 'dart:convert';
import 'dart:html' as html;

import 'package:chutils/templates/cdn.dart';
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

class AwsCdnHome extends StatelessWidget {
  static final String route = '/aws-cdn';
  static final String title = 'AWS CDN';
  static final String description = 'create a cloudformation template';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate a Cloudformation template")),
      body: Column(
        children: [
          Row(
            children: [
              Text("foo"),
              FlatButton.icon(
                icon: Icon(Icons.file_download),
                label: Text('download'),
                onPressed: () {
                  download(
                    CDN('foo').templateString.codeUnits,
                    downloadName: 'test.yml',
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
