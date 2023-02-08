import 'package:breathe_app/feature/home/components/session_item/default_session_item.dart';
import 'package:breathe_app/feature/home/components/session_item/default_session_item_view_model.dart';
import 'package:breathe_app/feature/home/home_controller.dart';
import 'package:breathe_app/feature/home/use_cases/delete_session_use_case.dart';
import 'package:breathe_app/feature/home/use_cases/get_sessions_use_case.dart';
import 'package:breathe_app/model/session.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class HomeViewModel extends HomeViewProtocol implements DefaultSessionItemViewModelDelegate {
  GetSessionsUseCaseProtocol getSessionsUseCase;
  DeleteSessionUseCaseProtocol deleteSessionUseCase;
  
  final Localization l10n;
  List<Session> _sessions = [];

  HomeViewModel({
    required this.getSessionsUseCase, 
    required this.deleteSessionUseCase, 
    required this.l10n
  });

  @override
  List<DefaultSessionItemViewModelProtocol> get sessions {
    return _sessions.map((session) {
      return DefaultSessionItemViewModel(
        session: session,
        delegate: this
      );
    }).toList();
  } 

  @override
  void getSessions() {
    getSessionsUseCase.execute(
      success: (results) {
        _sessions = results;
        notifyListeners();
      }, 
      failure: (errorDescription) {
        //Implementar mensagem de erro
        notifyListeners();
      }
    );
  }
  
  @override
  void didTapFloatingActionButton() {
    onTapFloatingActionButton?.call();
  }
  
  @override
  void didLongTapSession({required int sessionId}) {
    onLongTapSession?.call(sessionId);
  }
}
