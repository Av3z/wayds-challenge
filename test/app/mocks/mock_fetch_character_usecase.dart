import 'package:mockito/mockito.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/domain/usecases/fetch_characters_usecase.dart';

class MockFetchCharactersUseCase extends Mock implements FetchCharactersUseCase {
  final List<Character> mockCharacters;
  MockFetchCharactersUseCase(this.mockCharacters);

  @override
  Future<List<Character>> call({int page = 1}) async => mockCharacters;
}
