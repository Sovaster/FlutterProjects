import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract2/data/repository/auth_repository_impl.dart';
import 'package:pract2/domain/entity/role_entity.dart';
import 'package:pract2/domain/usercases/auth.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //const Expanded(child: SizedBox()),
              const Text(
                "MAGAZIN",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100, top: 15),
                child: TextFormField(
                  controller: _loginController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Поле логин пустое';
                    }
                    if (value.length < 2) {
                      return 'Логин должен содержать не менее 2 символов';
                    }
                    if (value.contains(RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$'))) {
                      return 'Логин должен содержать минимум 1 цифру, 1 спец. символ, 1 строчную и 1 заглавную латинскую букву';
                    }
                    return null;
                  },
                  maxLength: 16,
                  decoration: const InputDecoration(
                    labelText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100, top: 15),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Поле пароль пустое';
                    }
                    if (value.length < 2) {
                      return 'Пароль должен содержать не менее 2 символов';
                    }
                    if (value.contains(RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$'))) {
                      return 'Пароль должен содержать минимум 1 цифру, 1 спец. символ, 1 строчную и 1 заглавную латинскую букву';
                    }
                    return null;
                  },
                  maxLength: 10,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 150, right: 150, top: 50),
                  child: ElevatedButton(
                    child: Text("Войти"),
                    onPressed: () => {
                      _isValid = true,
                      if (_key.currentState!.validate()) {signIn()} else {}
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 150, right: 150, top: 50),
                  child: ElevatedButton(
                    child: Text("Регистрация"),
                    onPressed: () => {
                      _loginController.clear(),
                      _passwordController.clear(),
                      _isValid = false,
                      _key.currentState!.validate(),
                      Navigator.pushNamed(context, 'sign_up'),
                    },
                  ))
            ],
          ),
        ),
      )),
    );
  }

  void signIn() async {
    final AuthRepositoryImpl auth = AuthRepositoryImpl();
    var result = await Auth(auth).signIn(AuthParams(
      login: _loginController.text,
      password: _passwordController.text,
    ));
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.errorMessage),
        ),
      );
    }, (r) {
      switch (r) {
        case RoleEnum.admin:
          {
            Navigator.pushReplacementNamed(context, 'admin_home');
            break;
          }
        case RoleEnum.user:
          Navigator.pushNamedAndRemoveUntil(
              context, 'user_home', (route) => false);
          break;
      }
    });
  }
}
