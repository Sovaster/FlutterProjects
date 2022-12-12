class RoleEntity {
  late int id;
  final String role;

  RoleEntity({
    required this.role,
  });
}

enum RoleEnum {
  admin(id: 1, name: 'Администратор'),
  user(id: 2, name:'Пользователь');

  const RoleEnum({
    required this.name,
    required this.id,
  });
  final String name;
  final int id;
}
