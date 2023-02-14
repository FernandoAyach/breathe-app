import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:breathe_app/feature/chronometer/chronometer_view_model.dart';
import 'package:flutter/material.dart';

import '../../../model/session.dart';
import '../../../support/utils/localize.dart';

class ChronometerFactory {
  static const String route = '/chronometer';

  static StatefulWidget chronometer(Session session) {
    final l10n = Localize.instance.l10n;
    final viewModel = ChronometerViewModel(session: session, l10n: l10n);

    return ChronometerController(viewModel: viewModel);
  }
}

