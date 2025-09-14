import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wayds_challenge/app/design_system/theme/export_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, theme: AppTheme.theme, title: 'Rick and Morty App', routerConfig: Modular.routerConfig);
  }
}
