import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/poke_repositories.dart';

class HomeModule extends ChildModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get<PokeRepository>())),
    Bind((i) => PokeRepository(i.get<Dio>())),
  ];

  @override
  // TODO: implement routers
  List<Router> get routers => [
    Router('/', child: (_,args) => HomePage())
  ];

}