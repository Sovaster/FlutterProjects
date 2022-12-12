import 'package:bookstore/presentation/screen/admin/author/author_screen.dart';
import 'package:bookstore/presentation/screen/admin/main/main.dart';
import 'package:bookstore/presentation/screen/admin/user/user_screen.dart';
import 'package:bookstore/presentation/widgets/drawer_admin.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key, this.index = 0}) : super(key: key);
  final int index;
  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  int index = 0;

  List<String> appbarTitle = [
    'Главная',
    'Пользователи',
    'Книги',
    'Авторы',
  ];

  ///
  List<Widget> content = [
    const Main(),
    UserScreen(),
    const Text('Книги'),
    const AuthorScreen(),
    // const Text('Настройки'),
  ];

  List<String> actionNavigatorList = ['', 'add_user', '', ''];

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appbarTitle[index]),
        actions: index == 0
            ? null
            : [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      if (actionNavigatorList[index] != '') {
                        Navigator.pushNamed(
                            context, actionNavigatorList[index]);
                      }
                    },
                    child: const SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.add),
                    ),
                  ),
                )
              ],
      ),
      drawer: DrawerAdmin(
        index: (index, title) {
          setState(() {
            this.index = index;
          });
        },
        titleItem: appbarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: content[index],
      ),
    );
  }
}
