import 'package:asyncstate/asyncstate.dart';
import 'package:lab_core/lab_core.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:lab_self_service/src/service/login/user_login_service.dart';

class LoginController with MessageStateMixin{

  LoginController({
    required UserLoginService loginService,
  }) : _loginService = loginService;

  final UserLoginService _loginService;


  //signals para controlar o estado da tela
  final _logged = signal(false);
  final _obscurePassword = signal(true);

  //getters para os signals
  bool get logged => _logged();
  bool get obscurePassword => _obscurePassword();

  void toggleObscurePassword() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    final loginResult = await _loginService.execute(email, password).asyncLoader();

    switch (loginResult) {
      //Mostrar mensagem de erro
      case Left(value: ServiceException(:final message)):
        showError(message);

      //Redirecionar para a tela de home
      case Right(value: _):
        _logged.value = true;
    }
  } 
}