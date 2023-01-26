import 'package:breathe_app/feature/cronometer/cronometer_controller.dart';
import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../support/utils/localize.dart';

abstract class CronometerViewModelProtocol with ChangeNotifier {}

class CronometerView extends StatelessWidget {
  final CronometerViewProtocol viewModel;

  const CronometerView({super.key, required this.viewModel });
  
  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Expanded(
              flex: 5,
              child:  Center(
                child: Text(
                  l10n.cronometerDefaultCount,
                  style: AppFonts.interRegular(40, AppColors.black)
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.black,
                    child: const Icon(Icons.close),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
