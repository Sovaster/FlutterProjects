import 'package:bookstore/core/crypto/crypto.dart';
import 'package:bookstore/domain/entity/role_entity.dart';
import 'package:bookstore/domain/entity/users_entity.dart';

class Users extends UsersEnity {
  final String password;

  Users({
    super.id = 0,
    required super.login,
    required super.idRole,
    required this.password,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': Crypto.crypto(password),
      'id_role': idRole.id,
    };
  }

  factory Users.toFromMap(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int,
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values
          .firstWhere((element) => element.id == (json['id_role'] as int)),
    );
  }
}
