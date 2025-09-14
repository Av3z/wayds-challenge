import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/export_theme.dart';

class InformationTitleWidget extends StatelessWidget {
  final String title;
  const InformationTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90),
      child: Text(title, style: textTheme.titleMedium),
    );
  }
}
