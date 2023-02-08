import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class ChronometerViewModelProtocol with ChangeNotifier {
  void runChronometer();
  void stopChronometer();
  void updateChronometer();
  void restartChronometer();
  Color get getColor;
  Icon get getIcon;
  bool get isChronometerActive;
  String get getDuration;
}

class ChronometerView extends StatelessWidget {
  final ChronometerViewProtocol viewModel;

  const ChronometerView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (_, __) {
            return _chronometer();
          },
        ),
      ),
    );
  }

  Widget _chronometer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _counter(),
        _chronometerButtons(),
      ],
    );
  }

  Widget _counter() {
    return Flexible(
      flex: 5,
      child: Center(
        child: Text(
          viewModel.getDuration,
          style: AppFonts.interRegular(40, AppColors.black),
        ),
      ),
    );
  }

  Widget _chronometerButtons() {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.black,
            heroTag: "btn1",
            child: const Icon(Icons.close),
          ),
          FloatingActionButton(
            onPressed: () { viewModel.updateChronometer(); },
            backgroundColor: viewModel.getColor,
            heroTag: "btn2",
            child: viewModel.getIcon,
          ),
          FloatingActionButton(
            onPressed: () { viewModel.restartChronometer(); },
            backgroundColor: AppColors.yellow,
            heroTag: "btn3",
            child: const Icon(Icons.restart_alt),
          ),
        ],
      ),
    );
  }
}
