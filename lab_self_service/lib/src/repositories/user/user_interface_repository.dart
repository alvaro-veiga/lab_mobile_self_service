import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lab_core/lab_core.dart';
import 'package:lab_core/src/exeptions/auth_exception.dart';

import 'package:lab_core/src/fp/either.dart';

import './user_repository.dart';

class UserInterfaceRepository implements UserRepository {

  UserInterfaceRepository({
    required this.restClient,
  });

  final RestClient restClient;

  @override
  Future<Either<AuthExeption, String>> login(
    String email, String password) async {
      try{
        final Response(data: {'access_token': access_token}) = 
          await restClient.unauth.post('/auth', data: {
            'email': email,
            'password': password,
            'admin': true,
          });
        return Right(access_token);
      } on DioException catch(e, s) {
        log('Erro ao fazer login', error: e, stackTrace: s);
        return switch(e) {
          DioException(requestOptions: Response(statusCode: HttpStatus.forbidden)) =>
            Left(AuthUnauthorizedExeption()),
            _ => Left(AuthErrorExeption(message:'Erro ao fazer login'))
        };
      }
  }
}	