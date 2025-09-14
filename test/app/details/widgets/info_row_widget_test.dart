import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/details/widgets/info_row_widget.dart';

void main() {
  testWidgets('InfoRowWidget renders correctly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: InfoRowWidget(label: 'Label', value: 'Value'),
      ),
    );
    expect(find.byType(InfoRowWidget), findsOneWidget);
    expect(find.text('Label: '), findsOneWidget);
    expect(find.text('Value'), findsOneWidget);
  });
}
