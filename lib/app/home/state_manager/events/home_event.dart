sealed class HomeEvent {}

class FetchCharactersEvent extends HomeEvent {
  final int page;

  FetchCharactersEvent({this.page = 1});
}
