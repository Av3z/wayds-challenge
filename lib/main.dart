import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayds_challenge/app/app_module.dart';
import 'package:wayds_challenge/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(ModularApp(module: AppModule(prefs), child: const AppWidget()));
}
