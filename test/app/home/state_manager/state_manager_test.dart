import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/home/state_manager/events/home_event.dart';
import 'package:wayds_challenge/app/home/state_manager/state_manager.dart';
import 'package:wayds_challenge/app/home/state_manager/states/home_state.dart';
import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';

class MockCharacterRepository implements CharacterRepository {
  final List<Character> mockCharacters;
  MockCharacterRepository(this.mockCharacters);
  @override
  Future<List<Character>> fetchCharacters({int page = 1}) async => mockCharacters;
}

class ErrorCharacterRepository implements CharacterRepository {
  @override
  Future<List<Character>> fetchCharacters({int page = 1}) async => throw Exception('Error');
}

void main() {
  group('StateManager', () {
    test('should emit HomeLoadingState and HomeLoadedState', () async {
      final mockCharacters = [Character(id: 1, name: 'Rick', status: 'Alive', species: 'Human', type: '', image: '', gender: 'Male')];
      final repository = MockCharacterRepository(mockCharacters);
      final stateManager = StateManager(repository);
      final states = <HomeState>[];
      stateManager.state.stream.listen(states.add);
      stateManager.dispatch(FetchCharactersEvent(page: 1));
      await Future.delayed(const Duration(milliseconds: 100));
      expect(states.any((s) => s is HomeLoadingState), isTrue);
      expect(states.any((s) => s is HomeLoadedState), isTrue);
      final loadedState = states.whereType<HomeLoadedState>().first;
      expect(loadedState.characters, mockCharacters);
    });

    test('should emit HomeErrorState on exception', () async {
      final repository = ErrorCharacterRepository();
      final stateManager = StateManager(repository);
      final states = <HomeState>[];
      stateManager.state.stream.listen(states.add);
      stateManager.dispatch(FetchCharactersEvent(page: 1));
      await Future.delayed(const Duration(milliseconds: 100));
      expect(states.any((s) => s is HomeErrorState), isTrue);
    });
  });
}
