import 'package:bookstore/domain/entity/personal_data_entity.dart';
import 'package:bookstore/domain/entity/role_entity.dart';

class UsersEnity extends PersonalDataEntity {
  late int id;
  final String login;
  final String password;
  final RoleEnum idRole;

  bool isSelect;

  UsersEnity({
    this.id = 0,
    required this.login,
    this.password = '',
    required this.idRole,
    this.isSelect = false,
    super.lastName,
    super.firstName,
    super.middleName,
  });
}
