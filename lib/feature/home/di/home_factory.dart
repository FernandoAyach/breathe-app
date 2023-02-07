import 'package:breathe_app/database/repository/session_repository.dart';
import 'package:breathe_app/feature/home/components/handle_session_dialog/handle_session_dialog_view_model.dart';
import 'package:breathe_app/feature/home/use_cases/add_session_use_case.dart';
import 'package:breathe_app/feature/home/use_cases/get_sessions_use_case.dart';
import 'package:flutter/material.dart';

import '../../../database/database.dart';
import '../../../support/utils/localize.dart';
import '../home_controller.dart';
import '../home_view_model.dart';

class HomeFactory {
  static const String route = "/home";

  static StatefulWidget home() {
    final Database database = Database();
    final l10n = Localize.instance.l10n;
    final sessionRepository = SessionRepository(database: database);
    final getSessionsUseCase = GetSessionsUseCase(sessionRepository: sessionRepository);
    final addSessionUseCase = AddSessionUseCase(sessionRepository: sessionRepository);
    final homeViewModel = HomeViewModel(
      getSessionsUseCase: getSessionsUseCase,
      l10n: l10n,
    );
    final handleSessionDialogViewModel = HandleSessionDialogViewModel(
      addSessionUseCase: addSessionUseCase,
    );
    
    return HomeController(
      homeViewModel: homeViewModel, 
      handleSessionDialogViewModel: handleSessionDialogViewModel,
    );
  }
}