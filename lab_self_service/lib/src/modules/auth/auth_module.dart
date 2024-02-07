import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter/material.dart';
import 'package:lab_self_service/src/modules/auth/login/login_router.dart';
import 'package:lab_self_service/src/repositories/user/user_interface_repository.dart';
import 'package:lab_self_service/src/repositories/user/user_repository.dart';

class AuthModule extends FlutterGetItModule {

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<UserRepository>(
      (i) => UserInterfaceRepository(restClient: i())
      )
  ];

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/login': (_) =>  LoginRouter()
  };
}