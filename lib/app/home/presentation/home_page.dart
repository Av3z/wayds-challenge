import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';
import 'package:wayds_challenge/app/design_system/widgets/error_page.dart';
import 'package:wayds_challenge/app/design_system/widgets/loading_widget.dart';
import 'package:wayds_challenge/app/home/controller/home_controller.dart';
import 'package:wayds_challenge/app/home/presentation/widgets/characters_list_widget.dart';
import 'package:wayds_challenge/app/home/state_manager/states/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController(Modular.get<CharacterRepository>());
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    controller.fetchCharacters();
    controller.stateStream.listen(onStateChange);
    scrollController.addListener(onMaxScrollReach);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), forceMaterialTransparency: true),
      body: buildState(),
    );
  }

  Widget buildState() => switch (controller.stateManager.currentState) {
    HomeInitialState() => LoadingWidget(),
    HomeLoadingState() => LoadingWidget(),
    HomeLoadedState() => CharactersListWidget(characters: controller.stateManager.characters, scrollController: scrollController, onTapDetails: onTapDetails),
    HomeErrorState() => ErrorPage(),
  };

  void onStateChange(_) => setState(() {});

  void onTapDetails(Character character) => Modular.to.pushNamed('/details', arguments: character);

  void onMaxScrollReach() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      controller.fetchCharacters(page: controller.stateManager.currentPage++);
    }
  }
}
