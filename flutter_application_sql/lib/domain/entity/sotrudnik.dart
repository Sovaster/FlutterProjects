import 'package:flutter_application_sql/domain/entity/role.dart';

class SotrudnikEntity {
  late int id;
  final String fam;
  final String name;
  final String otch;
  final String login;
  final String password;
  final RoleEnum idRole;

  SotrudnikEntity({
    this.id = 0,
    required this.fam,
    required this.name,
    required this.otch,
    required this.login,
    this.password = '',
    required this.idRole,
  });
}
