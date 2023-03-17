import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';
import '../../../support/utils/localize.dart';

class EmptySessionListPlaceholderView extends StatelessWidget {
  const EmptySessionListPlaceholderView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.emptySessionListPlaceholderTitle,
              style: AppFonts.interMedium(16, AppColors.black.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}