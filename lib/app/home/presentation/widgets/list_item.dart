import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/design_system/utils/color_status.dart';
import 'package:wayds_challenge/app/design_system/utils/image_provider.dart';

class ListItem extends StatefulWidget {
  final Character character;
  final Function(Character) onTap;

  const ListItem({required this.character, required this.onTap, super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    final statusColor = ColorStatus.get(widget.character.status);

    return ListTile(
      leading: CircleAvatar(backgroundImage: TImageProvider.get(widget.character.image)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(widget.character.name, overflow: TextOverflow.ellipsis)),
          const SizedBox(width: 8),
          Chip(label: Text(widget.character.status), backgroundColor: statusColor),
        ],
      ),

      onTap: () => widget.onTap(widget.character),
    );
  }
}
