import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/data/cache/character_cache.dart';
import '../../../../mocks/mock_characters.dart';

void main() {
  group('CharacterCache', () {
    test('should return null if no characters cached for page', () {
      final cache = CharacterCache();
      expect(cache.getCharacters(1), isNull);
    });

    test('should cache and retrieve characters for a page', () {
      final cache = CharacterCache();
      cache.setCharacters(1, mockCharacters);
      final result = cache.getCharacters(1);
      expect(result, isNotNull);
      expect(result, mockCharacters);
    });

    test('should overwrite characters for the same page', () {
      final cache = CharacterCache();
      cache.setCharacters(1, [mockCharacters[0]]);
      cache.setCharacters(1, [mockCharacters[1]]);
      final result = cache.getCharacters(1);
      expect(result, [mockCharacters[1]]);
    });
  });
}
