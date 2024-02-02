import 'package:lab_self_service/src/service/user_login_service.dart';
import 'package:lab_self_service/src/repositories/user/user_repository.dart';
import 'package:lab_core/lab_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceInterface implements UserLoginService {

  UserLoginServiceInterface({
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  Future<Either<ServiceException, Unit>> execute(String email, String password) async {
    final loginResult = await userRepository.login(email, password);
    
    switch(loginResult) {
      case Left(value: AuthErrorExeption()):
        return Left(ServiceException(message: 'Erro ao fazer login'));
      case Left(value: AuthUnauthorizedExeption()):
        return Left(ServiceException(message: 'Login ou senha inválidos'));
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageConstants.accesstoken, accessToken);
        return Right(unit);
    }
  }
}

