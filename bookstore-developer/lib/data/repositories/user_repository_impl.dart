import 'package:bookstore/common/data_base_request.dart';
import 'package:bookstore/core/db/data_base_helper.dart';
import 'package:bookstore/core/exception/failure.dart';
import 'package:bookstore/data/model/users.dart';
import 'package:bookstore/domain/entity/role_entity.dart';
import 'package:bookstore/domain/entity/users_entity.dart';
import 'package:bookstore/domain/repositories/users_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class UserRepositoryImpl implements UserRepositories {
  final _db = DataBaseHelper.instance.dataBase;

  @override
  String get table => DataBaseRequest.tableUsers;

  @override
  Future<List<UsersEnity>> getAll() async {
    return (await _db.rawQuery(DataBaseRequest.select(table)))
        .map((e) => Users.toFromMap(e))
        .toList();
  }

  @override
  Future<Either<Failure, UsersEnity>> insert(
      String login, String password, RoleEnum idRole) async {
    try {
      var value = Users(login: login, idRole: idRole, password: password);
      await _db.insert(table, value.toMap());
      var result =
          await _db.rawQuery('SELECT * FROM $table ORDER BY id DESC LIMIT 1');
      return Right(result.map((e) => Users.toFromMap(e)).first);
    } on DatabaseException catch (e) {
      return Left(FailureImpl(e.getResultCode()!).error);
    }
  }

  @override
  Future<Either<Failure, bool>> delete(int id) async {
    try {
      await _db.delete(table, where: 'id = ?', whereArgs: [id]);
      return right(true);
    } on DatabaseException catch (error) {
      print("${error.getResultCode()}");
      print("${error.result}");
      return left(FailureImpl(error.getResultCode()!).error);
    }
  }
}
