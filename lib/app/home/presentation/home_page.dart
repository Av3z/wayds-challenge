import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wayds_challenge/app/core/character/domain/models/character.dart';
import 'package:wayds_challenge/app/core/character/domain/usecases/fetch_characters_usecase.dart';
import 'package:wayds_challenge/app/home/controller/home_controller.dart';
import 'package:wayds_challenge/app/home/presentation/widgets/characters_list_widget.dart';
import 'package:wayds_challenge/app/home/presentation/widgets/character_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController(Modular.get<FetchCharactersUseCase>());
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onMaxScrollReach);
    controller.fetchCharacters();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        forceMaterialTransparency: true,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: onSearchPressed)],
      ),
      body: CharactersListWidget(characters: controller.characters, isLoading: controller.isLoading, hasError: controller.hasError, scrollController: scrollController, onTapDetails: onTapDetails),
    );
  }

  void onTapDetails(Character character) => Modular.to.pushNamed('/details', arguments: character);

  void onMaxScrollReach() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      controller.fetchCharacters(page: controller.currentPage++);
    }
  }

  void onSearchPressed() async {
    final result = await showSearch<Character?>(context: context, delegate: CharacterSearchDelegate(controller.characters.value));

    if (result != null) {
      onTapDetails(result);
    }
  }
}
