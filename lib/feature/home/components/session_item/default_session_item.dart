import 'dart:ui';

import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../support/style/app_colors.dart';
import '../../../../support/utils/localize.dart';

abstract class DefaultSessionItemViewModelProtocol {
  int get sessionId;
  String get sessionName;
  String get sessionDuration;

  void didTapSession();
  void didLongTapSession(int sessionId);
}

class DefaultSessionItem extends StatelessWidget {
  final DefaultSessionItemViewModelProtocol viewModel;

  const DefaultSessionItem({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(24),
        shadowColor: AppColors.pink,
        child: InkWell(
          onLongPress: () => viewModel.didLongTapSession(viewModel.sessionId),
          onTap: () => viewModel.didTapSession(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.pink.withOpacity(0.35),
                        AppColors.white,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            viewModel.sessionName,
                            style: AppFonts.interMedium(20, AppColors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '${l10n.sessionDurationLabel} ${viewModel.sessionDuration}',
                            style: AppFonts.interRegular(20, AppColors.black.withOpacity(0.95)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
