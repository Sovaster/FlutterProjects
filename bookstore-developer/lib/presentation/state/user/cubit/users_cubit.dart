import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookstore/data/repositories/user_repository_impl.dart';
import 'package:bookstore/domain/entity/role_entity.dart';
import 'package:bookstore/domain/entity/users_entity.dart';
import 'package:bookstore/domain/usercases/user.dart';
import 'package:flutter/material.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  final UserRepositoryImpl _usersRepositoryImpl = UserRepositoryImpl();
  late Users _users;

  List<UsersEnity> list = [];

  Future<void> init() async {
    emit(UsersLoad());
    _users = Users(_usersRepositoryImpl);
    list = await _users.getAll();

    emit(UsersLoaded(list));
  }

  Future<void> refresh() async {
    list = await _users.getAll();
    emit(UsersLoaded(list));
  }

  void add(
    String login,
    String password,
    RoleEnum role,
    BuildContext context,
  ) async {
    var result = await _users.insert(UsersEnity(
      login: login,
      password: password,
      idRole: role,
    ));
    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.errorMessage),
          ),
        );
      },
      (user) {
        list.add(UsersEnity(
          id: user.id,
          login: user.login,
          idRole: user.idRole,
        ));
        emit(UsersLoaded(list));
        Navigator.pop(context);
      },
    );
  }

  void delete(int index) async {
    await _users.delete(
      UsersEnity(
        id: list[index].id,
        login: list[index].login,
        idRole: list[index].idRole,
      ),
    );
    list.removeAt(index);

    emit(UsersLoaded(list));
  }
}
