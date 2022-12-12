import 'package:bookstore/domain/entity/role_entity.dart';
import 'package:bookstore/presentation/screen/admin/user/widget/card_users.dart';
import 'package:bookstore/presentation/state/user/cubit/users_cubit.dart';
import 'package:bookstore/presentation/widgets/action_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsersCubit>().refresh(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocConsumer<UsersCubit, UsersState>(
            listener: (context, state) {
              if (state is UsersLoaded) {
                count = state.list.length;
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Количество пользователей: ${count}',
                  textAlign: TextAlign.left,
                ),
              );
            },
          ),
          BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is UsersLoad) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is UsersLoaded) {
                if (state.list.isEmpty) {
                  return const Center(
                    child: Text('Данных нет'),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      final test = state.list[index];
                      return Dismissible(
                        key: Key(test.id.toString()),
                        background: const ActionCard(
                          icon: Icons.favorite,
                          color: Colors.green,
                          alignment: Alignment.centerLeft,
                        ),
                        secondaryBackground: const ActionCard(
                          icon: Icons.delete,
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                        ),
                        onDismissed: (event) {
                          if (event == DismissDirection.endToStart) {
                            context.read<UsersCubit>().delete(index);
                          } else {}
                        },
                        confirmDismiss: (confirmDismiss) async {
                          if (confirmDismiss == DismissDirection.startToEnd) {
                            return false;
                          }
                          if (confirmDismiss == DismissDirection.endToStart) {
                            bool delete = false;
                            final snackbarController =
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                content: const Text('Вы точно хотите удалить?'),
                                action: SnackBarAction(
                                    label: 'Да',
                                    onPressed: () {
                                      delete = true;
                                    }),
                              ),
                            );
                            await snackbarController.closed;
                            return delete;
                          }
                        },
                        child: CardUser(
                          onTap: () {
                            context.read<UsersCubit>();
                          },
                          id: state.list[index].id,
                          login: state.list[index].login,
                          idRole: state.list[index].idRole,
                        ),
                      );
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
