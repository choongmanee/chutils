import 'package:chutils/screens/aws_cdn/home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static final String route = '/';
  final List<Type> mainScreens = [AwsCdnHome];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chutils'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          FlatButton(
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AwsCdnHome.title),
                    Text(AwsCdnHome.description),
                  ],
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AwsCdnHome.route);
            },
          )
        ],
      ),
    );
  }
}
