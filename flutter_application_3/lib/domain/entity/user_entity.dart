import 'package:flutter_application_3/domain/entity/role_enitty.dart';

class UserEntity {
  late int id;
  final String login;
  final String password;
  final RoleEnum idRole;

  UserEntity({
    this.id = 0,
    required this.login,
    this.password = '',
    required this.idRole,
  });
}
