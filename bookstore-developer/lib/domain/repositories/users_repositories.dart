import 'package:bookstore/core/exception/failure.dart';
import 'package:bookstore/domain/entity/role_entity.dart';
import 'package:bookstore/domain/entity/users_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositories {
  String get table;

  Future<List<UsersEnity>> getAll();
  Future<Either<Failure, UsersEnity>> insert(
    String login,
    String password,
    RoleEnum idRole,
  );
  Future<Either<Failure, bool>> delete(int id);
}
