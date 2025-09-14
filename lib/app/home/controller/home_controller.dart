import 'dart:async';

import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';
import 'package:wayds_challenge/app/home/state_manager/events/home_event.dart';
import 'package:wayds_challenge/app/home/state_manager/state_manager.dart';

class HomeController {
  final StateManager stateManager;

  HomeController(CharacterRepository repository) : stateManager = StateManager(repository);

  Stream get stateStream => stateManager.state.stream;

  void fetchCharacters({int page = 1}) {
    stateManager.dispatch(FetchCharactersEvent(page: page));
  }

  void dispose() {
    stateManager.state.close();
  }
}
