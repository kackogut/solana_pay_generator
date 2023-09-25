import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sol_pay_gen/design/theme/app_theme.dart';
import 'package:sol_pay_gen/di/blocs_providers.dart';
import 'package:sol_pay_gen/di/repositories_providers.dart';

import 'feature/input/parameters_input_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const SolanaPayGeneratorApp(),
    ),
  );
}

class SolanaPayGeneratorApp extends StatelessWidget {
  const SolanaPayGeneratorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SolPay QR",
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.getThemeData(),
      home: getRepositoryProviders(
        blocProviders: getBlocProviders(
          child: const ParametersInputScreen(),
        ),
      ),
    );
  }
}
