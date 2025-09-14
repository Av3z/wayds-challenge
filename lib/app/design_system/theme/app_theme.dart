import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/export_theme.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: TColors.white,
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    listTileTheme: listTileTheme,
    cardTheme: cardTheme,
    elevatedButtonTheme: buttonTheme,
    chipTheme: chipTheme,
  );
}
