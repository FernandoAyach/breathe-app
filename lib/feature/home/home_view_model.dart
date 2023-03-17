import 'package:breathe_app/feature/home/components/default_home_bottom_sheet.dart';
import 'package:breathe_app/feature/home/components/session_item/default_session_item.dart';
import 'package:breathe_app/feature/home/components/session_item/default_session_item_view_model.dart';
import 'package:breathe_app/feature/home/home_controller.dart';
import 'package:breathe_app/feature/home/use_cases/delete_session_use_case.dart';
import 'package:breathe_app/feature/home/use_cases/get_sessions_use_case.dart';
import 'package:breathe_app/model/session.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class HomeViewModel 
  extends HomeViewProtocol 
  implements DefaultSessionItemViewModelDelegate, DefaultHomeBottomSheetDelegate {

  final GetSessionsUseCaseProtocol getSessionsUseCase;
  final DeleteSessionUseCaseProtocol deleteSessionUseCase;
  final Localization l10n;

  List<Session> _sessions = [];
  int _longPressedSessionId = 0;
  bool _isSessionsLoading = false;
  bool _isSessionsListEmpty = false;
  bool _hasSessionsError = false;
  String _sessionErrorDescription = '';


  HomeViewModel({
    required this.getSessionsUseCase, 
    required this.deleteSessionUseCase, 
    required this.l10n
  });

  @override
  bool get hasSessionsError => _hasSessionsError;
  
  @override
  bool get isSessionsListEmpty => _isSessionsListEmpty;
  
  @override
  bool get isSessionsLoading => _isSessionsLoading;
  
  @override
  String get sessionsErrorDescription => _sessionErrorDescription;

  @override
  set longPressedSessionId(int longPressedSessionId) {
    _longPressedSessionId = longPressedSessionId;
  } 

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
    _isSessionsListEmpty = false;
    setLoading(true);
    getSessionsUseCase.execute(
      success: (results) {
        _sessions = results;
        if(_sessions.isEmpty) {
          _isSessionsListEmpty = true;
        }
        setLoading(false);
        setError('', false);
      }, 
      failure: (errorDescription) {
        setError(errorDescription, true);
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

  @override
  void didTapSession({required Session session}) {
    onTapSession?.call(session);
  }
  
  @override
  void didTapDelete() {
    deleteSession();
    getSessions();
    showDeleteMessage();
    closeBottomSheet();
  }

  void showDeleteMessage() {
    onDeleteSessionBottomSheet?.call(l10n.snackBarDeleteMessage);
  }

  void closeBottomSheet() {
    onConfirmBottomSheet?.call();
  }
  
  void deleteSession() {
    setLoading(true);
    deleteSessionUseCase.execute(
      sessionId: _longPressedSessionId, 
      success: () { 
        setLoading(false);
        setError('', false);
        notifyListeners(); 
      }, 
      failure: (errorDescription) {
        setError(errorDescription, true);
        notifyListeners();
      }
    );
  }

  void setLoading(bool loading) {
    _isSessionsLoading = loading;
    notifyListeners();
  }

  void setError(String errorDescription, bool hasError) {
    _hasSessionsError = hasError;
    _sessionErrorDescription = errorDescription;
    notifyListeners();
  }
}
