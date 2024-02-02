import 'package:lab_core/lab_core.dart';

// essa interface é responsável por definir o contrato de um repositório de usuário
// ela define um método de login que retorna um Future de Either de Exception e String
abstract interface class UserRepository {

 Future <Either<AuthExeption, String>> login(String email, String password);
}