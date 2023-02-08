import 'package:breathe_app/feature/home/components/session_item/default_session_item.dart';
import 'package:breathe_app/model/duration_utils.dart';

import '../../../../model/session.dart';

abstract class DefaultSessionItemViewModelDelegate {
  void didLongTapSession({required int sessionId});
  void didTapSession({required Session session});
}

class DefaultSessionItemViewModel extends DefaultSessionItemViewModelProtocol {

  final Session session;
  final DefaultSessionItemViewModelDelegate delegate;

  DefaultSessionItemViewModel({required this.delegate, required this.session});

  @override
  void didTapSession() {
    delegate.didTapSession(session: session);
  }

  @override
  void didLongTapSession(int sessionId) {
    delegate.didLongTapSession(sessionId: sessionId);
  }

  @override
  String get sessionDuration => DurationUtils.formatDurationOutput(session.duration);

  @override
  int get sessionId => session.id;

  @override
  String get sessionName => session.name;
}