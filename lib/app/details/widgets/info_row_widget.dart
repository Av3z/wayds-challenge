import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/export_theme.dart';

class InfoRowWidget extends StatelessWidget {
  final String label;
  final String value;

  const InfoRowWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$label: ', style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
        Flexible(child: Text(value, style: textTheme.bodyMedium)),
      ],
    );
  }
}
