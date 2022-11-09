import 'package:flutter_application_sql/domain/entity/role.dart';
import 'package:flutter_application_sql/domain/entity/sotrudnik.dart';

class Sotrudnik extends SotrudnikEntity {
  final String password;
  Sotrudnik({
    super.id = 0,
    required super.fam,
    required super.name,
    required super.otch,
    required super.login,
    required this.password,
    required super.idRole,
  });

  Map<String, dynamic> toMap() {
    return {
      'fam': fam,
      'name': name,
      'otch': otch,
      'login': login,
      'password': password,
      'id_role': idRole.id,
    };
  }

  factory Sotrudnik.toFromMap(Map<String, dynamic> json) {
    return Sotrudnik(
      id: json['id'] as int,
      fam: json['fam'],
      name: json['name'],
      otch: json['otch'],
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values
          .firstWhere((element) => element.id == (json['id_role'] as int)),
    );
  }
}
