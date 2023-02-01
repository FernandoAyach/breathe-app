import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../support/utils/localize.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {}

int itemCount = 20;

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Text(
                  l10n.homeTitle,
                  style: AppFonts.interBold(
                    20,
                    AppColors.black,
                  ),
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
                l10n.homeSubtitle,
                style: AppFonts.interBold(
                  16,
                  AppColors.black,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemCount,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return const ListTile(
                      title: Text("Item"),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.select_all),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
