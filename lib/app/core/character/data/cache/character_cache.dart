import 'dart:convert';
import 'package:wayds_challenge/app/core/character/domain/models/cache_entry_model.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/localstorage/domain/local_storage.dart';

class CharacterCache {
  final LocalStorage localStorage;
  static const expirationMinutes = 5;

  CharacterCache(this.localStorage);

  Future<List<Character>?> getCharacters(int page) async {
    final url = 'https://rickandmortyapi.com/api/character?page=$page';
    final jsonStr = await localStorage.getData(url);

    if (jsonStr == null) return null;
    final map = jsonDecode(jsonStr);
    final entry = CacheEntryModel.fromMap(map);
    final now = DateTime.now().millisecondsSinceEpoch;
    final expired = now - entry.timestamp > expirationMinutes * 60 * 1000;

    if (expired) {
      await localStorage.deleteData(url);
      return null;
    }

    return (entry.data as List<dynamic>?)?.map((e) => Character.fromJson(e)).toList();
  }

  Future<void> setCharacters(int page, List<Character> characters) async {
    final url = 'https://rickandmortyapi.com/api/character?page=$page';
    final now = DateTime.now().millisecondsSinceEpoch;
    final entry = CacheEntryModel(timestamp: now, data: characters.map((e) => e.toMap()).toList());
    await localStorage.saveData(url, jsonEncode(entry.toMap()));
  }
}
