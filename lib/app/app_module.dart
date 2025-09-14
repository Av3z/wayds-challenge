import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<Client>(() => Client());
  }

  @override
  void routes(r) {}
}
