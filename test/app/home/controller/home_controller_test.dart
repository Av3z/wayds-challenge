import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/home/controller/home_controller.dart';

import '../../mocks/error_fetch_character_usecase.dart';
import '../../mocks/mock_fetch_character_usecase.dart';

void main() {
  test('HomeController fetchCharacters updates state', () async {
    final mockCharacters = [Character(id: 1, name: 'Rick', status: 'Alive', species: 'Human', type: '', image: '', gender: 'Male')];
    final usecase = MockFetchCharactersUseCase(mockCharacters);
    final controller = HomeController(usecase);
    controller.fetchCharacters();
    await Future.delayed(const Duration(milliseconds: 100));
    expect(controller.isLoading.value, isFalse);
    expect(controller.characters.value, mockCharacters);
    expect(controller.hasError.value, isFalse);
  });

  test('HomeController sets error state on failure', () async {
    final usecase = ErrorFetchCharactersUseCase();
    final controller = HomeController(usecase);
    controller.fetchCharacters();
    await Future.delayed(const Duration(milliseconds: 100));
    expect(controller.isLoading.value, isFalse);
    expect(controller.hasError.value, isTrue);
  });
}
