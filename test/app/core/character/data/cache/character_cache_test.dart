import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/data/cache/character_cache.dart';
import '../../../../mocks/local_storage_mock.dart';
import '../../../../mocks/mock_characters.dart';

void main() {
  group('CharacterCache', () {
    test('should return null if no characters cached for page', () async {
      final cache = CharacterCache(LocalStorageMock());
      final result = await cache.getCharacters(1);
      expect(result, isNull);
    });

    test('should cache and retrieve characters for a page', () async {
      final cache = CharacterCache(LocalStorageMock());
      await cache.setCharacters(1, mockCharacters);
      final result = await cache.getCharacters(1);
      expect(result, isNotNull);
      expect(result, mockCharacters);
    });

    test('should overwrite characters for the same page', () async {
      final cache = CharacterCache(LocalStorageMock());
      await cache.setCharacters(1, [mockCharacters[0]]);
      await cache.setCharacters(1, [mockCharacters[1]]);
      final result = await cache.getCharacters(1);
      expect(result, [mockCharacters[1]]);
    });
  });
}
