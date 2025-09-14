import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/details/widgets/information_title_widget.dart';

void main() {
  testWidgets('InformationTitleWidget renders correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: InformationTitleWidget(title: 'Info Title')));
    expect(find.byType(InformationTitleWidget), findsOneWidget);
    expect(find.text('Info Title'), findsOneWidget);
  });
}
