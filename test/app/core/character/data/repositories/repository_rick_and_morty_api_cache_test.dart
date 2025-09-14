import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:wayds_challenge/app/core/character/data/cache/character_cache.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';

import '../../../../mocks/mock_characters.dart';

import 'package:wayds_challenge/app/core/network/domain/network_manager.dart';
import 'package:wayds_challenge/app/core/character/data/repositories/repository_rick_and_morty_api_cache.dart';

class MockNetworkManager extends Mock implements NetworkManager {
  @override
  Future<T> get<T>(String url, {Map<String, String>? headers}) async {
    return {'results': mockCharacters.map((c) => c.toMap()).toList()} as T;
  }
}

void main() {
  group('CharacterRepositoryCacheImpl', () {
    test('should return cached characters if available', () async {
      final cache = CharacterCache();
      final mockNetworkManager = MockNetworkManager();

      cache.setCharacters(1, mockCharacters);
      final repo = RepositoryRickAndMortyApiCache(cache, mockNetworkManager);
      final result = await repo.fetchCharacters(page: 1);
      expect(result, mockCharacters);
    });

    test('should fetch from API and cache if not cached', () async {
      final cache = CharacterCache();
      final mockNetworkManager = MockNetworkManager();
      final repo = RepositoryRickAndMortyApiCache(cache, mockNetworkManager);

      cache.setCharacters(1, []);
      final result = await repo.fetchCharacters(page: 1);

      expect(result, isA<List<Character>>());
      expect(result.length, mockCharacters.length);
      expect(result.first.name, mockCharacters.first.name);
      expect(cache.getCharacters(1), isNotNull);
    });
  });
}
