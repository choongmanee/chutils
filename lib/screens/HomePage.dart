import 'package:chutils/screens/CDNCloudformationPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String route = '/';
  final List<Type> mainScreens = [CDNCloudformationPage];

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
                    Text(CDNCloudformationPage.title),
                    Text(CDNCloudformationPage.description),
                  ],
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, CDNCloudformationPage.route);
            },
          )
        ],
      ),
    );
  }
}
