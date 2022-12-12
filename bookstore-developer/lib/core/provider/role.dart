// import 'package:bookstore/common/data_base_request.dart';
// import 'package:bookstore/core/usercases/provider_user_case.dart';
// import 'package:bookstore/core/db/data_base_helper.dart';
// import 'package:bookstore/core/exception/failure.dart';
// import 'package:bookstore/data/model/role.dart';
// import 'package:dartz/dartz.dart';
// import 'package:sqflite/sqflite.dart';

// /// Провайдер для работы с таблицей Role
// /// Выполняет основные действия с таблице такие как
// /// get, getAll, insert, update, delete
// class RoleImpl implements ProviderUserCase<Failure, Role> {
//   final db = DataBaseHelper.instance.dataBase!;

//   @override
//   String get table => DataBaseRequest.tableRole;

//   @override
//   Future<List<Role>> get() async {
//     return (await db.rawQuery(DataBaseRequest.select(table)))
//         .map((e) => Role.toFromMap(e))
//         .toList();
//   }

//   @override
//   Future<List<Role>> getAll(Role role) async {
//     return (await db.rawQuery(DataBaseRequest.select(table)))
//         .map((e) => Role.toFromMap(e))
//         .toList();
//   }

//   @override
//   Future<Either<Failure, Role>> insert(Role role) async {
//     try {
//       await db.insert(table, role.toMap());
//       return Right(role);
//     } on DatabaseException catch (e) {
//       return Left(FailureImpl(e.getResultCode()!));
//     }
//   }

//   @override
//   Future<Either<Failure, Role>> update(Role role) async {
//     try {
//       return Right(role);
//     } on DatabaseException catch (e) {
//       return Left(FailureImpl(e.getResultCode()!));
//     }
//   }

//   @override
//   Future<Either<Failure, Role>> delete(Role role) async {
//     try {
//       await db.delete(table, where: 'id = ?', whereArgs: [role.id]);
//       return Right(role);
//     } on DatabaseException catch (e) {
//       return Left(FailureImpl(e.getResultCode()!));
//     }
//   }
// }
