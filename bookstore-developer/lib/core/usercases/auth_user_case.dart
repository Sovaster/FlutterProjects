import 'package:bookstore/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthUserCase<Type, Params> {
  Future<Either<Type, RoleEnum>> signIn(Params params);
  Future<Either<Type, bool>> signUp(Params params);
}
