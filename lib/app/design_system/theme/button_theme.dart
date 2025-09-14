import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/export_theme.dart';

final buttonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: TColors.primary,
    foregroundColor: TColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
);
