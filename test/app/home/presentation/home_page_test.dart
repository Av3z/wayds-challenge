import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/app_module.dart';
import 'package:wayds_challenge/app/home/presentation/home_page.dart';

import '../../mocks/mock_characters.dart';

import '../../mocks/mock_fetch_character_usecase.dart';
import '../../mocks/mock_shared_prefs.dart';

void main() {
  setUp(() {
    Modular.bindModule(AppModule(MockSharedPrefs()));
    Modular.replaceInstance<MockFetchCharactersUseCase>(MockFetchCharactersUseCase(mockCharacters));
  });
  testWidgets('should home page render correctly ', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.widgetWithText(AppBar, 'Home'), findsOneWidget);
  });
}
