import 'package:wayds_challenge/app/core/character/domain/models/character.dart';

sealed class CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final List<Character> characters;
  final bool hasReachedMax;

  CharacterLoadedState({required this.characters, this.hasReachedMax = false});
}

class CharacterErrorState extends CharacterState {
  final String message;

  CharacterErrorState({required this.message});
}
