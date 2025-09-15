import '../models/character.dart';
import '../repositories/character_repository.dart';

class FetchCharactersUseCase {
  final CharacterRepository repository;

  FetchCharactersUseCase(this.repository);

  Future<List<Character>> call({int page = 1}) {
    if (page < 1) {
      throw ArgumentError('Page number must be greater than 0');
    }

    return repository.fetchCharacters(page: page);
  }
}
