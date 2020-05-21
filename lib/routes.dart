import 'package:chutils/screens/HomePage.dart';
import 'package:flutter/material.dart';

import 'screens/CDNCloudformationPage.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.route: (context) => HomePage(),
  CDNCloudformationPage.route: (context) => CDNCloudformationPage(),
};
