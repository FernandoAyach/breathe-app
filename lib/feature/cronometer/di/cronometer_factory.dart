import 'package:breathe_app/feature/cronometer/cronometer_view.dart';
import 'package:breathe_app/feature/cronometer/cronometer_controller.dart';
import 'package:flutter/material.dart';

class CronometerFactory {
  static const String route = '/cronometer';

  static StatefulWidget cronometer() {
    return const CronometerController();
  }
}

