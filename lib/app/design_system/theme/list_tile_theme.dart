import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/export_theme.dart';

final listTileTheme = ListTileThemeData(
  tileColor: TColors.white,
  titleTextStyle: textTheme.bodyLarge,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
);
