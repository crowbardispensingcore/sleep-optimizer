import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleep_optimizer/shared/routes/routes.dart';
import 'package:sleep_optimizer/shared/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  

  runApp(
    const ProviderScope(
      child: SleepOptimizer(),
    ),
  );
}

class SleepOptimizer extends StatelessWidget {
  const SleepOptimizer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: appTheme,
    );
  }
}
