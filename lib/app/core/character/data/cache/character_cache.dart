import 'package:wayds_challenge/app/core/character/domain/models/character.dart';

class CharacterCache {
  final Map<int, List<Character>> _cache = {};

  List<Character>? getCharacters(int page) => _cache[page];

  void setCharacters(int page, List<Character> characters) => _cache[page] = characters;
}
