part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoad extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UsersEnity> list;

  UsersLoaded(this.list);
}


class UserDelete extends UsersState{
  final List<UsersEnity> list;

  UserDelete(this.list);
}