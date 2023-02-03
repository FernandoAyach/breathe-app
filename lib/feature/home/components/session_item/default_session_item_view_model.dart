import 'package:breathe_app/feature/home/components/session_item/default_session_item.dart';

import '../../../../model/session.dart';

class DefaultSessionItemViewModel extends DefaultSessionItemViewModelProtocol {

  final Session session;

  DefaultSessionItemViewModel({required this.session});

  @override
  void didTapSession(int sessionId) {}

  @override
  String get sessionDuration => session.duration;

  @override
  int get sessionId => session.id;

  @override
  String get sessionName => session.name;
}