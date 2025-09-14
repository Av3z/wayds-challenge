import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/data/repositories/repository_rick_and_morty_api.dart';
import 'package:wayds_challenge/app/core/network/domain/network_manager.dart';
import '../../../../mocks/mock_characters.dart';

class MockNetworkManager extends Mock implements NetworkManager {
  @override
  Future<T> get<T>(String url, {Map<String, String>? headers}) async {
    return {'results': mockCharacters.map((c) => c.toMap()).toList()} as T;
  }
}

void main() {
  group('CharacterRepositoryImpl', () {
    test('should fetch characters from API', () async {
      final mockNetworkManager = MockNetworkManager();

      final repo = RepositoryRickAndMortyApi(mockNetworkManager);
      final result = await repo.fetchCharacters(page: 1);

      expect(result, isA<List<Character>>());
      expect(result.length, mockCharacters.length);
      expect(result.first.name, mockCharacters.first.name);
    });
  });
}
