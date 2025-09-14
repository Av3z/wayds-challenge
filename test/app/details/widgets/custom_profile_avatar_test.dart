import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/details/widgets/custom_profile_avatar.dart';

void main() {
  testWidgets('CustomProfileAvatar renders image correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: CustomProfileAvatar(imageUrl: AssetImage('assets/rick-and-morty.jpg'), size: 80)),
      ),
    );
    expect(find.byType(CircleAvatar), findsNWidgets(2));
    final avatars = tester.widgetList<CircleAvatar>(find.byType(CircleAvatar));
    expect(avatars.any((avatar) => avatar.backgroundImage != null), isTrue);
  });
}
