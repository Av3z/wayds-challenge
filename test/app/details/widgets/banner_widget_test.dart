import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/details/widgets/banner_widget.dart';

void main() {
  testWidgets('BannerWidget renders correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: BannerWidget()));
    expect(find.byType(BannerWidget), findsOneWidget);
  });
}
