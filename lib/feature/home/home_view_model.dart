import 'package:breathe_app/feature/home/components/session_item/default_session_item.dart';
import 'package:breathe_app/feature/home/components/session_item/default_session_item_view_model.dart';
import 'package:breathe_app/feature/home/home_controller.dart';
import 'package:breathe_app/feature/home/use_cases/get_sessions_use_case.dart';
import 'package:breathe_app/model/session.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class HomeViewModel extends HomeViewProtocol {
  GetSessionsUseCaseProtocol getSessionsUseCase;
  final Localization l10n;
  List<Session> _sessions = [];

  HomeViewModel({required this.getSessionsUseCase, required this.l10n});

  @override
  int get itemCount => _sessions.length;

  @override
  List<DefaultSessionItemViewModelProtocol> get sessions {
    return _sessions.map((session) {
      return DefaultSessionItemViewModel(session: session);
    }).toList();
  } 

  @override
  void getSessions() {
    getSessionsUseCase.execute(
      success: (results) {
        _sessions = results;
        notifyListeners();
      }, 
      failure: (errorMsg) {
        notifyListeners();
      }
    );
  }
}
