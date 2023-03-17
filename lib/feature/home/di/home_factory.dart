import 'package:breathe_app/api/database/repository/session_repository.dart';
import 'package:breathe_app/feature/home/components/handle_session_dialog/handle_session_dialog_view_model.dart';
import 'package:breathe_app/feature/home/use_cases/add_session_use_case.dart';
import 'package:breathe_app/feature/home/use_cases/delete_session_use_case.dart';
import 'package:breathe_app/feature/home/use_cases/get_sessions_use_case.dart';
import 'package:flutter/material.dart';

import '../../../api/database/database_provider.dart';
import '../../../support/utils/localize.dart';
import '../home_controller.dart';
import '../home_view_model.dart';

class HomeFactory {
  static const String route = '/home';

  static StatefulWidget home() {
    final DatabaseProvider database = DatabaseProvider();
    final l10n = Localize.instance.l10n;
    final sessionRepository = SessionRepository(database: database);
    final getSessionsUseCase = GetSessionsUseCase(sessionRepository: sessionRepository);
    final addSessionUseCase = AddSessionUseCase(sessionRepository: sessionRepository);
    final deleteSessionUseCase = DeleteSessionUseCase(sessionRepository: sessionRepository);
    
    final homeViewModel = HomeViewModel(
      getSessionsUseCase: getSessionsUseCase,
      deleteSessionUseCase: deleteSessionUseCase,
      l10n: l10n,
    );
    final handleSessionDialogViewModel = HandleSessionDialogViewModel(
      addSessionUseCase: addSessionUseCase,
      l10n: l10n,
    );
    
    return HomeController(
      homeViewModel: homeViewModel, 
      handleSessionDialogViewModel: handleSessionDialogViewModel,
    );
  }
}