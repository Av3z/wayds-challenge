import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';

class CharacterSearchDelegate extends SearchDelegate<Character?> {
  final List<Character> characters;
  CharacterSearchDelegate(this.characters);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
      appBarTheme: theme.appBarTheme,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = characters.where((c) => c.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final character = results[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
          title: Text(character.name),
          subtitle: Text(character.status),
          onTap: () => close(context, character),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = characters.where((c) => c.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final character = suggestions[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
          title: Text(character.name),
          subtitle: Text(character.status),
          onTap: () => close(context, character),
        );
      },
    );
  }
}
