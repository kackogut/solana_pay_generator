import 'package:flutter/material.dart';
import 'package:sol_pay_gen/di/blocs_providers.dart';
import 'package:sol_pay_gen/di/repositories_providers.dart';

import 'feature/input/parameters_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solana Pay QR Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getRepositoryProviders(
        blocProviders: getBlocProviders(
          child: const ParametersInputScreen(),
        ),
      ),
    );
  }
}
