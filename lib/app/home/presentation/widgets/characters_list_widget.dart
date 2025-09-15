import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/design_system/widgets/loading_widget.dart';
import 'package:wayds_challenge/app/home/presentation/widgets/list_item.dart';

class CharactersListWidget extends StatefulWidget {
  final ValueNotifier<List<Character>> characters;
  final ValueNotifier<bool> isLoading;
  final ValueNotifier<bool> hasError;
  final ScrollController scrollController;
  final Function(Character) onTapDetails;

  const CharactersListWidget({required this.characters, required this.isLoading, required this.hasError, required this.scrollController, required this.onTapDetails, super.key});

  @override
  State<CharactersListWidget> createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  @override
  void initState() {
    super.initState();
    widget.characters.addListener(onStateChanged);
    widget.isLoading.addListener(onStateChanged);
    widget.hasError.addListener(onStateChanged);
  }

  @override
  void dispose() {
    widget.characters.removeListener(onStateChanged);
    widget.isLoading.removeListener(onStateChanged);
    widget.hasError.removeListener(onStateChanged);
    super.dispose();
  }

  void onStateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('homeListView'),
      controller: widget.scrollController,
      itemCount: widget.characters.value.length + (widget.isLoading.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < widget.characters.value.length) {
          return ListItem(character: widget.characters.value[index], onTap: widget.onTapDetails);
        }
        return const LoadingWidget();
      },
    );
  }
}
