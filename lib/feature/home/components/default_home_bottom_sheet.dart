import 'package:breathe_app/feature/home/home_view_model.dart';
import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../support/utils/localize.dart';

abstract class DefaultHomeBottomSheetDelegate {
  void didTapDelete();
}

class DefaultHomeBottomSheet extends StatelessWidget {
  final HomeViewModel viewModel;

  const DefaultHomeBottomSheet({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;
    
    return Column(
      children: [
        InkWell(
          onTap: () => viewModel.didTapDelete(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.close, color: AppColors.red,),
              title: Text(
                l10n.buttonDeleteHomeBottomSheet,
                style: AppFonts.interRegular(16, AppColors.red),
              ),
            ),
          ),
        ),
        const Divider(thickness: 1.0),
      ],
    );
  }
}

