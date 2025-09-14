import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/home/presentation/widgets/list_item.dart';

class CharactersListWidget extends StatefulWidget {
  final List characters;
  final ScrollController scrollController;
  final Function(Character) onTapDetails;

  const CharactersListWidget({required this.characters, required this.scrollController, required this.onTapDetails, super.key});

  @override
  State<CharactersListWidget> createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('homeListView'),
      controller: widget.scrollController,
      itemCount: widget.characters.length,
      itemBuilder: (context, index) {
        return ListItem(character: widget.characters[index], onTap: widget.onTapDetails);
      },
    );
  }
}
