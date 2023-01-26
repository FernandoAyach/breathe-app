import 'package:flutter/material.dart';

import '../feature/chronometer/di/chronometer_factory.dart';

class MobileRouter {
  static String get initialRoute {
    return ChronometerFactory.route;
  }

  static final Map<String, WidgetBuilder> routes = {
    ChronometerFactory.route: (_) => ChronometerFactory.chronometer(),
  };
}