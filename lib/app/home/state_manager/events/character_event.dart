sealed class CharacterEvents {}

class FetchCharactersEvent extends CharacterEvents {
  final int page;

  FetchCharactersEvent({this.page = 1});
}
