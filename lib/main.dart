import 'package:breathe_app/router/mobile_router.dart';
import 'package:flutter/material.dart';
import 'support/utils/localize.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
      initialRoute: MobileRouter.initialRoute,
      routes: MobileRouter.routes,
    );
  }
}