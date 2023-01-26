import 'package:breathe_app/feature/chronometer/chronometer_view.dart';
import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:breathe_app/feature/chronometer_view_model.dart';
import 'package:flutter/material.dart';

class ChronometerFactory {
  static const String route = '/chronometer';

  static StatefulWidget chronometer() {
    final viewModel = ChronometerViewModel();
    return ChronometerController(viewModel: viewModel);
  }
}

