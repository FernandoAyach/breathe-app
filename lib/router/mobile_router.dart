import 'package:breathe_app/feature/home/di/home_factory.dart';
import 'package:flutter/material.dart';

import '../feature/chronometer/di/chronometer_factory.dart';
import '../model/session.dart';

class MobileRouter {
  static String get initialRoute {
    return HomeFactory.route;
  }

  static final Map<String, WidgetBuilder> routes = {
    ChronometerFactory.route: (context) {
      final session = ModalRoute.of(context)?.settings.arguments as Session;
      return ChronometerFactory.chronometer(session);
    }, 
    HomeFactory.route: (_) => HomeFactory.home(),
  };
}