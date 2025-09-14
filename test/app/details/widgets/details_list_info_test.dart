import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/details/widgets/details_list_info.dart';

import '../../mocks/mock_characters.dart';

void main() {
  testWidgets('DetailsListInfo renders correctly', (tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailsListInfo(character: mockCharacters[0])));
    expect(find.byType(DetailsListInfo), findsOneWidget);

    expect(find.text('Alive'), findsOneWidget);
    expect(find.text('Human'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
  });
}
