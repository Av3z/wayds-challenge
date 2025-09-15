import 'package:flutter/widgets.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/domain/usecases/fetch_characters_usecase.dart';
import 'package:wayds_challenge/app/home/state_manager/character_bloc.dart';
import 'package:wayds_challenge/app/home/state_manager/events/character_event.dart';
import 'package:wayds_challenge/app/home/state_manager/states/character_state.dart';

class HomeController {
  final FetchCharactersUseCase repository;
  late CharacterBloc characterBloc;

  HomeController(this.repository) {
    characterBloc = CharacterBloc(repository);
    characterBloc.states.stream.listen((state) => onStateReceived(state));
  }

  ValueNotifier<List<Character>> characters = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<bool> hasError = ValueNotifier(false);

  int currentPage = 1;
  bool hasReachedMax = false;

  void onStateReceived(CharacterState state) => switch (state) {
    CharacterLoadingState() => onLoadingState(),
    CharacterLoadedState() => onLoadedState(state),
    CharacterErrorState() => onErrorState(),
  };

  void onLoadingState() {
    isLoading.value = true;
    hasError.value = false;
  }

  void onLoadedState(CharacterLoadedState state) {
    isLoading.value = false;
    characters.value.addAll(state.characters);
    hasReachedMax = state.hasReachedMax;
  }

  void onErrorState() {
    isLoading.value = false;
    hasError.value = true;
  }

  void fetchCharacters({int page = 1}) async {
    characterBloc.events.add(FetchCharactersEvent(page: page));
  }
}
