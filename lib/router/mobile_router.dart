import 'package:flutter/material.dart';

import '../feature/cronometer/di/cronometer_factory.dart';

class MobileRouter {
  static String get initialRoute {
    return CronometerFactory.route;
  }

  static final Map<String, WidgetBuilder> routes = {
    CronometerFactory.route: (_) => CronometerFactory.cronometer(),
  };
}