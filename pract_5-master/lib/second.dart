import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences sharedPreferences1;
  late String text = '';
  late int currentTheme;

  Future<void> loadPrefs() async {
    sharedPreferences1 = await _prefs;
  }

  @override
  Widget build(BuildContext context) {
    loadPrefs();

    var data = ModalRoute.of(context)!.settings.arguments;
    Map<String, dynamic> values = data as Map<String, dynamic>;

    if (data != null) {
      text = data['STRING'];
      currentTheme = data['TEMA'] as int;
    }

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Записанные данные: ' + text,
            style:
                TextStyle(fontSize: 40, color: Color.fromARGB(255, 43, 255, 0)),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(1, 0, 0, 0)),
                    onPressed: () {
                      sharedPreferences1.setString('STRING', text);
                      sharedPreferences1.setInt('TEMA', currentTheme);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Данные сохранены'),
                        ),
                      );
                    },
                    child: Text('Сохранить')),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            height: 35,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(1, 0, 0, 0)),
                onPressed: () {
                  if (sharedPreferences1.getString('STRING') != null &&
                      sharedPreferences1.getInt('TEMA') != null) {
                    sharedPreferences1.remove('STRING');
                    sharedPreferences1.remove('TEMA');

                    Navigator.pushNamed(context, 'first');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Нет данных для удаления'),
                      ),
                    );
                  }
                },
                child: Text('Чистка данных')),
          ),
        ],
      )),
    );
  }
}
