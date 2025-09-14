import 'dart:async';

import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/home/state_manager/events/home_event.dart';
import 'package:wayds_challenge/app/home/state_manager/states/home_state.dart';

import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';

class StateManager {
  final CharacterRepository repository;
  final StreamController<HomeState> state = StreamController<HomeState>.broadcast();
  HomeState currentState;

  StateManager(this.repository) : currentState = HomeInitialState() {
    state.add(currentState);
  }

  List<Character> characters = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasReachedMax = false;

  void dispatch(HomeEvent event) {
    if (event is FetchCharactersEvent) {
      fetchCharacters(event);
    }
  }

  void fetchCharacters(FetchCharactersEvent event) async {
    if (isLoading || hasReachedMax) return;
    isLoading = true;
    currentState = HomeLoadingState();
    state.add(currentState);

    try {
      final newCharacters = await repository.fetchCharacters(page: event.page);

      if (newCharacters.isEmpty) {
        hasReachedMax = true;
      } else {
        characters.addAll(newCharacters);
        currentPage++;
      }

      currentState = HomeLoadedState(characters: characters, hasReachedMax: hasReachedMax);
      state.add(currentState);
    } catch (e) {
      currentState = HomeErrorState(message: e.toString());
      state.add(currentState);
    } finally {
      isLoading = false;
    }
  }
}
