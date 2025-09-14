import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'dart:convert';
import 'package:wayds_challenge/app/core/localstorage/domain/local_storage.dart';

class CharacterCache {
  final Map<int, List<Character>> _cache = {};
  final LocalStorage localStorage;
  static const expirationMinutes = 5;

  CharacterCache(this.localStorage);

  Future<List<Character>?> getCharacters(int page) async {
    if (_cache.containsKey(page)) {
      return _cache[page];
    }

    final jsonStr = await localStorage.getData('characters_page_$page');
    final timestampStr = await localStorage.getData('characters_page_${page}_timestamp');
    final timestamp = timestampStr != null ? int.tryParse(timestampStr) : null;

    if (jsonStr != null && timestamp != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final expired = now - timestamp > expirationMinutes * 60 * 1000;

      if (!expired) {
        final List<dynamic> jsonList = jsonDecode(jsonStr);
        final characters = jsonList.map((e) => Character.fromJson(e)).toList();
        _cache[page] = characters;
        return characters;
      }

      await localStorage.deleteData('characters_page_$page');
      await localStorage.deleteData('characters_page_${page}_timestamp');
    }
    return null;
  }

  Future<void> setCharacters(int page, List<Character> characters) async {
    _cache[page] = characters;
    final jsonStr = jsonEncode(characters.map((e) => e.toMap()).toList());
    await localStorage.saveData('characters_page_$page', jsonStr);
    await localStorage.saveData('characters_page_${page}_timestamp', DateTime.now().millisecondsSinceEpoch.toString());
  }
}
