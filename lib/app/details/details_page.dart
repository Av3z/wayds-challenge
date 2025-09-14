import 'package:flutter/material.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/design_system/utils/image_provider.dart';
import 'package:wayds_challenge/app/details/widgets/banner_widget.dart';
import 'package:wayds_challenge/app/details/widgets/custom_profile_avatar.dart';
import 'package:wayds_challenge/app/details/widgets/details_list_info.dart';
import 'package:wayds_challenge/app/details/widgets/information_title_widget.dart';

class DetailsPage extends StatefulWidget {
  final Character character;
  const DetailsPage({required this.character, super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        centerTitle: true,
        forceMaterialTransparency: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: onBackPressed),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              BannerWidget(),
              InformationTitleWidget(title: 'Informations'),
              DetailsListInfo(character: widget.character),
            ],
          ),
          Positioned(
            top: 120,
            left: MediaQuery.of(context).size.width / 2 - 80,
            child: CustomProfileAvatar(imageUrl: TImageProvider.get(widget.character.image), size: 80),
          ),
        ],
      ),
    );
  }

  void onBackPressed() => Navigator.pop(context);
}
