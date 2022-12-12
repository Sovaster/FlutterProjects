import 'package:bookstore/domain/entity/role_entity.dart';

class Role extends RoleEntity {
  late int id;
  final String role;

  Role({
    required this.role,
  }) : super(role: role);

  Map<String, dynamic> toMap() {
    return {
      'role': role,
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(role: json['role']);
  }
}
