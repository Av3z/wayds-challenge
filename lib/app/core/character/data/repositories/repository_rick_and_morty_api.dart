import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';
import 'package:wayds_challenge/app/core/network/domain/network_manager.dart';

class RepositoryRickAndMortyApi implements CharacterRepository {
  final NetworkManager networkManager;
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  RepositoryRickAndMortyApi(this.networkManager);

  @override
  Future<List<Character>> fetchCharacters({int page = 1}) async {
    final response = await networkManager.get<Map<String, dynamic>>('$baseUrl/character?page=$page');

    final results = response['results'] as List<dynamic>;
    return results.map((json) => Character.fromJson(json)).toList();
  }
}
