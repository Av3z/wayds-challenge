import 'package:mockito/mockito.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/domain/usecases/fetch_characters_usecase.dart';

class ErrorFetchCharactersUseCase extends Mock implements FetchCharactersUseCase {
  @override
  Future<List<Character>> call({int page = 1}) async => throw Exception('Error');
}
