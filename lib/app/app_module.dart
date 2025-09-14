import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:wayds_challenge/app/core/character/data/repositories/repository_rick_and_morty_api_cache.dart';
import 'package:wayds_challenge/app/core/character/data/cache/character_cache.dart';
import 'package:wayds_challenge/app/core/localstorage/data/shared_preference_storage.dart';
import 'package:wayds_challenge/app/core/character/domain/repositories/character_repository.dart';
import 'package:wayds_challenge/app/core/localstorage/domain/local_storage.dart';
import 'package:wayds_challenge/app/core/network/data/network_manager_http.dart';
import 'package:wayds_challenge/app/core/network/domain/network_manager.dart';
import 'package:wayds_challenge/app/details/details_page.dart';
import 'package:wayds_challenge/app/home/controller/home_controller.dart';
import 'package:wayds_challenge/app/home/presentation/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  final SharedPreferences prefs;
  AppModule(this.prefs);

  @override
  void binds(i) {
    i.addLazySingleton<Client>(() => Client());
    i.addLazySingleton<NetworkManager>(() => NetworkManagerHTTP(i()));
    i.addInstance<SharedPreferences>(prefs);
    i.addLazySingleton<LocalStorage>(() => SharedPreferenceStorage(i()));
    i.addLazySingleton<CharacterCache>(() => CharacterCache(i()));
    i.addLazySingleton<CharacterRepository>(() => RepositoryRickAndMortyApiCache(i(), i()));
    i.addLazySingleton<HomeController>(() => HomeController(i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
    r.child('/details', child: (context) => DetailsPage(character: Modular.args.data));
  }
}
