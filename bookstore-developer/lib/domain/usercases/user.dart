import 'package:bookstore/core/exception/failure.dart';
import 'package:bookstore/core/usercases/users_user_case.dart';
import 'package:bookstore/domain/entity/users_entity.dart';
import 'package:bookstore/domain/repositories/users_repositories.dart';
import 'package:dartz/dartz.dart';

class Users implements UsersUserCase<Failure, UsersEnity> {
  final UserRepositories usersRepositories;

  Users(this.usersRepositories);

  @override
  Future<Either<Failure, bool>> delete(UsersEnity params) async {
    return await usersRepositories.delete(params.id);
  }

  @override
  Future<List<UsersEnity>> get(UsersEnity params) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<UsersEnity>> getAll() async {
    return Future<List<UsersEnity>>.delayed(
      const Duration(seconds: 2),
      () async => (await usersRepositories.getAll())
          .map((e) => UsersEnity(id: e.id, login: e.login, idRole: e.idRole))
          .toList(),
    );
  }

  @override
  Future<Either<Failure, UsersEnity>> insert(UsersEnity params) async {
    return await usersRepositories.insert(
      params.login,
      params.password,
      params.idRole,
    );
  }

  @override
  Future<Either<Failure, UsersEnity>> update(UsersEnity params) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
