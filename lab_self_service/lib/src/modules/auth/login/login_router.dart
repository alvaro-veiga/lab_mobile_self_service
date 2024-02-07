import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_self_service/src/service/login/user_login_service.dart';
import 'package:lab_self_service/src/service/login/user_login_service_interface.dart';
import './login_controller.dart';
import './login_page.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  @override
  // TODO: implement bindings
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<UserLoginService>((i) => UserLoginServiceInterface(userRepository: i())),
    Bind.lazySingleton((i) => LoginController(loginService: i())),
  ];

  @override
  // TODO: implement view
  WidgetBuilder get view => (_) => const LoginPage();

}