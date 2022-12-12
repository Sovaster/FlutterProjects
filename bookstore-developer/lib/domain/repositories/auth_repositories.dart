import 'package:bookstore/core/exception/failure.dart';
import 'package:bookstore/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories {
  String get table;

  /// Метод для регистрации пользователя
  Future<Either<Failure, RoleEnum>> signIn(String login, String password);

  /// Метод для авторизации пользователя
  Future<Either<Failure, bool>> signUp(String login, String password);
}
