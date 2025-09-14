import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';

void main() {
  String characterJson = '''
  {
    "id": 1,
    "name": "Rick Sanchez",
    "status": "Alive",
    "species": "Human",
    "type": "",
    "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
  }
  ''';

  test('should convert json in Character model', () {
    final character = Character.fromMap(jsonDecode(characterJson));

    expect(character.id, 1);
    expect(character.name, 'Rick Sanchez');
    expect(character.status, 'Alive');
    expect(character.species, 'Human');
    expect(character.type, '');
    expect(character.image, 'https://rickandmortyapi.com/api/character/avatar/1.jpeg');
  });

  test('should convert fromJson in Character model', () {
    final character = Character.fromJson(jsonDecode(characterJson));
    expect(character.id, 1);
    expect(character.name, 'Rick Sanchez');
    expect(character.status, 'Alive');
    expect(character.species, 'Human');
    expect(character.type, '');
    expect(character.image, 'https://rickandmortyapi.com/api/character/avatar/1.jpeg');
  });

  test('should convert Character toMap', () {
    final character = Character.fromMap(jsonDecode(characterJson));
    final map = character.toMap();
    expect(map['id'], 1);
    expect(map['name'], 'Rick Sanchez');
    expect(map['status'], 'Alive');
    expect(map['species'], 'Human');
    expect(map['type'], '');
    expect(map['image'], 'https://rickandmortyapi.com/api/character/avatar/1.jpeg');
  });

  test('should copy Character with new values', () {
    final character = Character.fromMap(jsonDecode(characterJson));
    final copy = character.copyWith(name: 'Morty', id: 2);
    expect(copy.id, 2);
    expect(copy.name, 'Morty');
    expect(copy.status, character.status);
    expect(copy.species, character.species);
    expect(copy.type, character.type);
    expect(copy.image, character.image);
  });
}
