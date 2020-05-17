import 'package:chutils/screens/home.dart';
import 'package:flutter/material.dart';

import 'screens/aws_cdn/home.dart';

final Map<String, WidgetBuilder> routes = {
  Home.route: (context) => Home(),
  AwsCdnHome.route: (context) => AwsCdnHome(),
};
