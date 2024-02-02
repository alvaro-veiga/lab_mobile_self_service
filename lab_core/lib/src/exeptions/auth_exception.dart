// classe que representa as exceções personalizadas de autenticação

sealed class AuthExeption implements Exception {
  final String message;

  AuthExeption({required this.message});
}

// exceção de autenticação de credenciais inválidas
final class AuthErrorExeption extends AuthExeption {
  AuthErrorExeption({required super.message});

}
// execeção de não autorização de usuário
final class AuthUnauthorizedExeption extends AuthExeption {
  AuthUnauthorizedExeption() : super(message: 'Unauthorized');
}