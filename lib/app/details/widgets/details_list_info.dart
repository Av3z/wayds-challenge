import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/details/widgets/info_row_widget.dart';

class DetailsListInfo extends StatelessWidget {
  final Character character;
  const DetailsListInfo({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoRowWidget(label: 'Status', value: character.status),
            SizedBox(height: 12),
            InfoRowWidget(label: 'Species', value: character.species),
            SizedBox(height: 12),
            InfoRowWidget(label: 'Gender', value: character.gender),
            SizedBox(height: 12),
            InfoRowWidget(label: 'Type', value: character.type.isEmpty ? 'Unknown' : character.type),
          ],
        ),
      ),
    );
  }
}
