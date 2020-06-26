import 'package:slidytest/app/modules/login/login_module.dart';
import 'package:slidytest/app/pages/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:slidytest/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:slidytest/app/app_widget.dart';
import 'package:slidytest/app/modules/home/home_module.dart';
import 'package:slidytest/app/pages/splash/splash_page.dart';
import 'package:slidytest/shared/repositories/localstorage/local_storage_hive.dart';
import 'package:slidytest/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:slidytest/shared/repositories/localstorage/local_storage_share.dart';
import 'package:slidytest/shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        //Bind((i) => LocalStorageHive()),
        Bind<ILocalStorage>((i) => LocalStorageShare()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
        Router('/Login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
