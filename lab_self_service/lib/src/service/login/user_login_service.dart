import 'package:lab_core/lab_core.dart';

abstract interface class UserLoginService{
  Future<Either<ServiceException, Unit>> execute(String email, String password);
}