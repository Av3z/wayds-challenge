import 'package:wayds_challenge/app/core/character/domain/models/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> fetchCharacters({int page = 1});
}
