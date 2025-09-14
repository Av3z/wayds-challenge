import 'package:wayds_challenge/app/core/character/domain/models/character.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Character> characters;
  final bool hasReachedMax;

  HomeLoadedState({required this.characters, this.hasReachedMax = false});
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
