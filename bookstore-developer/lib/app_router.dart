import 'package:bookstore/common/url_page.dart';
import 'package:bookstore/index.dart';
import 'package:bookstore/presentation/state/user/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  UsersCubit? _usersCubit;

  Route<dynamic>? generateRouter(RouteSettings settigns) {
    switch (settigns.name) {
      case UrlPage.signIn:
        {
          if (_usersCubit != null) {
            _usersCubit!.close();
          }
          return MaterialPageRoute(builder: (_) => SignIn());
        }
      case UrlPage.signUp:
        {
          return MaterialPageRoute(builder: (_) => SignUp());
        }
      case UrlPage.admin:
        {
          _usersCubit = UsersCubit();
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => _usersCubit!..init(),
              child: const HomeAdmin(),
            ),
          );
        }
      case UrlPage.settingsAdmin:
        {
          return MaterialPageRoute(builder: (_) => SettingsAdmin());
        }
      case UrlPage.addUser:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _usersCubit!,
              child: AddUserScreen(),
            ),
          );
        }
      case UrlPage.client:
        {
          return MaterialPageRoute(builder: (_) => HomeClient());
        }
      default:
        {
          return null;
        }
    }
  }
}
