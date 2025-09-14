import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/design_system/theme/colors_theme.dart';
import 'package:wayds_challenge/app/design_system/utils/image_provider.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: TColors.lightGrey100,
        image: DecorationImage(image: TImageProvider.get('assets/rick-and-morty.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
