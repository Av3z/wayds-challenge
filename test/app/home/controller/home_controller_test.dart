import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/home/controller/home_controller.dart';
import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';

class MockCharacterRepository implements CharacterRepository {
  final List<Character> mockCharacters;
  MockCharacterRepository(this.mockCharacters);
  @override
  Future<List<Character>> fetchCharacters({int page = 1}) async => mockCharacters;
}

void main() {
  test('HomeController fetchCharacters updates state', () async {
    final mockCharacters = [Character(id: 1, name: 'Rick', status: 'Alive', species: 'Human', type: '', image: '', gender: 'Male')];
    final repository = MockCharacterRepository(mockCharacters);
    final controller = HomeController(repository);
    controller.fetchCharacters();
    await expectLater(controller.stateStream, emits(isNotNull));
  });
}
