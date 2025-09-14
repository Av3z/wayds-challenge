import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/details/details_page.dart';

void main() {
  testWidgets('DetailsPage displays character info', (tester) async {
    final character = Character(id: 1, name: 'Rick Sanchez', status: 'Alive', species: 'Human', type: '', image: 'assets/rick-and-morty.jpg', gender: 'Male');
    await tester.pumpWidget(MaterialApp(home: DetailsPage(character: character)));
    expect(find.text('Rick Sanchez'), findsOneWidget);
    expect(find.text('Alive'), findsOneWidget);
    expect(find.text('Human'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
  });
}
