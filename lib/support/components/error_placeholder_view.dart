import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

class ErrorPlaceHolderView extends StatelessWidget {
  final String errorDescription;

  const ErrorPlaceHolderView({super.key, required this.errorDescription});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.error, size: 40,),
              ),
              Text(
                errorDescription,
                style: AppFonts.interMedium(16, AppColors.red),
              ),
            ],
          ),
        ),
      );
  }
}
