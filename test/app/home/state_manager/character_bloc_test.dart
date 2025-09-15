import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/home/state_manager/character_bloc.dart';
import 'package:wayds_challenge/app/home/state_manager/events/character_event.dart';
import 'package:wayds_challenge/app/home/state_manager/states/character_state.dart';

import '../../mocks/error_fetch_character_usecase.dart';
import '../../mocks/mock_fetch_character_usecase.dart';

void main() {
  group('CharacterBloc', () {
    test('should emit CharacterLoadingState and CharacterLoadedState', () async {
      final mockCharacters = [Character(id: 1, name: 'Rick', status: 'Alive', species: 'Human', type: '', image: '', gender: 'Male')];
      final usecase = MockFetchCharactersUseCase(mockCharacters);
      final bloc = CharacterBloc(usecase);
      final states = <CharacterState>[];
      bloc.states.stream.listen(states.add);
      bloc.events.add(FetchCharactersEvent(page: 1));
      await Future.delayed(const Duration(milliseconds: 100));
      expect(states.any((s) => s is CharacterLoadingState), isTrue);
      expect(states.any((s) => s is CharacterLoadedState), isTrue);
      final loadedState = states.whereType<CharacterLoadedState>().first;
      expect(loadedState.characters, mockCharacters);
    });

    test('should emit CharacterErrorState on exception', () async {
      final usecase = ErrorFetchCharactersUseCase();
      final bloc = CharacterBloc(usecase);
      final states = <CharacterState>[];
      bloc.states.stream.listen(states.add);
      bloc.events.add(FetchCharactersEvent(page: 1));
      await Future.delayed(const Duration(milliseconds: 100));
      expect(states.any((s) => s is CharacterErrorState), isTrue);
    });
  });
}
