import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/colors_theme.dart';

const fontFamily = 'Roboto';

final textTheme = TextTheme(
  titleLarge: TextStyle(fontFamily: fontFamily, fontSize: 27.65, fontWeight: FontWeight.w700, height: 1.2, color: TColors.light().black),
  titleMedium: TextStyle(fontFamily: fontFamily, fontSize: 23.04, fontWeight: FontWeight.w700, height: 1.2, color: TColors.light().black),
  titleSmall: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700, height: 1.5, color: TColors.light().black),
  labelLarge: TextStyle(fontFamily: fontFamily, fontSize: 19.2, fontWeight: FontWeight.w700, height: 1.2, color: TColors.light().black),
  labelMedium: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, color: TColors.light().black),
  labelSmall: TextStyle(fontFamily: fontFamily, fontSize: 13.33, fontWeight: FontWeight.w400, color: TColors.light().black),
  bodyLarge: TextStyle(fontFamily: fontFamily, fontSize: 19.2, height: 1.2, fontWeight: FontWeight.w400, color: TColors.light().black),
  bodySmall: TextStyle(fontFamily: fontFamily, fontSize: 16, height: 1.5, fontWeight: FontWeight.w600, color: TColors.light().black),
);
