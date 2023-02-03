import 'package:breathe_app/feature/home/home_controller.dart';
import 'package:breathe_app/feature/home/use_cases/get_sessions_use_case.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class HomeViewModel extends HomeViewProtocol {

  GetSessionsUseCaseProtocol getSessionsUseCase;
  final Localization l10n;

  HomeViewModel({required this.getSessionsUseCase, required this.l10n});

  @override
  int get itemCount => 20;
}