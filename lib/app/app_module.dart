import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:wayds_challenge/app/core/character/data/repositories/repository_rick_and_morty_api.dart';
import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';
import 'package:wayds_challenge/app/core/network/data/network_manager_http.dart';
import 'package:wayds_challenge/app/core/network/domain/network_manager.dart';
import 'package:wayds_challenge/app/details/details_page.dart';
import 'package:wayds_challenge/app/home/controller/home_controller.dart';
import 'package:wayds_challenge/app/home/presentation/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<Client>(() => Client());
    i.addLazySingleton<NetworkManager>(() => NetworkManagerHTTP(i()));
    i.addLazySingleton<CharacterRepository>(() => RepositoryRickAndMortyApi(i()));
    i.addLazySingleton<HomeController>(() => HomeController(i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
    r.child('/details', child: (context) => DetailsPage(character: Modular.args.data));
  }
}
