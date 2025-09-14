import 'package:wayds_challenge/app/core/character/data/cache/character_cache.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';
import 'package:wayds_challenge/app/core/network/domain/network_manager.dart';

class RepositoryRickAndMortyApiCache implements CharacterRepository {
  final NetworkManager networkManager;
  final CharacterCache cache;
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  RepositoryRickAndMortyApiCache(this.cache, this.networkManager);

  @override
  Future<List<Character>> fetchCharacters({int page = 1}) async {
    final cached = await cache.getCharacters(page);
    if (cached != null && cached.isNotEmpty) return cached;

    final response = await networkManager.get<dynamic>('$baseUrl/character?page=$page');

    final results = response['results'] as List<dynamic>;
    final characters = results.map((json) => Character.fromJson(json)).toList();
    await cache.setCharacters(page, characters);
    return characters;
  }
}
