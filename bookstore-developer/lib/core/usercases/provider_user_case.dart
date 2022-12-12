import 'package:dartz/dartz.dart';

/// Класс отвечающий за основные действия с базой данных.
abstract class ProviderUserCase<Type, Params> {
  String get table;

  Future<Either<Type, Params>> insert(Params params);
  Future<List<Params>> get();
  Future<List<Params>> getAll(Params params);
  Future<Either<Type, Params>> update(Params params);
  Future<Either<Type, Params>> delete(Params params);
}
