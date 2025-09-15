import 'dart:async';

import 'package:wayds_challenge/app/core/character/domain/usecases/fetch_characters_usecase.dart';
import 'package:wayds_challenge/app/home/state_manager/events/character_event.dart';
import 'package:wayds_challenge/app/home/state_manager/states/character_state.dart';

class CharacterBloc {
  final FetchCharactersUseCase repositoryUseCase;

  final StreamController<CharacterState> states = StreamController<CharacterState>();
  final StreamController<CharacterEvents> events = StreamController<CharacterEvents>();

  CharacterBloc(this.repositoryUseCase) {
    events.stream.listen((event) {
      if (event is FetchCharactersEvent) {
        fetchCharacters(page: event.page);
      }
    });
  }

  void fetchCharacters({int page = 1}) async {
    states.add(CharacterLoadingState());
    try {
      final characters = await repositoryUseCase.call(page: page);
      states.add(CharacterLoadedState(characters: characters));
    } catch (e) {
      states.add(CharacterErrorState(message: e.toString()));
    }
  }

  void dispose() {
    states.close();
  }
}
