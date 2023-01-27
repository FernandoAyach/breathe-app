import 'package:breathe_app/feature/home/home_view_model.dart';
import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Boa tarde, Fernando!",
                style: AppFonts.interBold(
                  20,
                  AppColors.black,
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              color: AppColors.pink,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Minhas sessões",
                style: AppFonts.interBold(
                  16,
                  AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
