import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class ChronometerViewModelProtocol with ChangeNotifier {
  void initChronometer();
  String get getDuration;
}

class ChronometerView extends StatelessWidget {
  final ChronometerViewProtocol viewModel;

  const ChronometerView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: viewModel,
              builder: (_, __) {
                return _chronometer();
              },
            ),
            _chronometerButtons(),
          ],
        ),
      ),
    );
  }

  Widget _chronometer() {
    return Expanded(
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
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.black,
            child: const Icon(Icons.close),
          ),
          FloatingActionButton(
            onPressed: () { viewModel.initChronometer();},
            backgroundColor: AppColors.red,
            child: const Icon(Icons.stop),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.yellow,
            child: const Icon(Icons.restart_alt),
          ),
        ],
      ),
    );
  }
}
