import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:breathe_app/feature/chronometer/chronometer_view_model.dart';
import 'package:flutter/material.dart';

import '../../../model/session.dart';

class ChronometerFactory {
  static const String route = '/chronometer';

  static StatefulWidget chronometer(Session session) {
    final viewModel = ChronometerViewModel(session: session);

    return ChronometerController(viewModel: viewModel);
  }
}

