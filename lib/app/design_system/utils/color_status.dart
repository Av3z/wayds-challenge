import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/colors_theme.dart';

abstract class ColorStatus {
  static Color get(String status) {
    switch (status) {
      case 'Alive':
        return TColors.light().success;
      case 'Dead':
        return TColors.light().error;
      default:
        return TColors.light().mediumGrey400;
    }
  }
}
