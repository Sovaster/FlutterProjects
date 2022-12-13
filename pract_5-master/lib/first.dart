import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemesEnum { dark, light }

class FirstPage extends StatefulWidget {
  final ValueNotifier<ThemeMode> notifier;

  FirstPage(this.notifier);

  @override
  State<StatefulWidget> createState() => _FirstPageState(notifier);
}

class _FirstPageState extends State<FirstPage> {
  final ValueNotifier<ThemeMode> notifier;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  ThemesEnum currentTheme = ThemesEnum.light;
  TextEditingController _textController = TextEditingController();

  _FirstPageState(this.notifier);

  Future<void> loadPrefs() async {
    final SharedPreferences prefs = await _prefs;

    String? text = prefs.getString('STRING');
    int? theme = prefs.getInt('TEMA');

    if (text != null && theme != null) {
      Map<String, dynamic> values = {'STRING': text, 'TEMA': theme};

      if (theme == ThemesEnum.light.index) {
        notifier.value = ThemeMode.light;
      } else {
        notifier.value = ThemeMode.dark;
      }

      Navigator.pushNamed(context, 'second', arguments: values);
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments;

    if (data != null) {
      Map<String, dynamic> values = data as Map<String, dynamic>;
      _textController.text = values['STRING'];
    }

    loadPrefs();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          notifier.value = notifier.value == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light,
          currentTheme = notifier.value == ThemeMode.light
              ? ThemesEnum.light
              : ThemesEnum.dark,
        },
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: Icon(
            notifier.value == ThemeMode.light
                ? Icons.accessibility_new
                : Icons.accessible,
            color: Color.fromARGB(255, 251, 255, 0)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
                width: 300,
                height: 35,
                child: TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Поле ввода текста',
                    border: OutlineInputBorder(),
                  ),
                )),
          ),
          Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  child: Text('Переслать'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(1, 0, 0, 0)),
                  onPressed: () {
                    Map<String, dynamic> values = {
                      'STRING': _textController.text,
                      'TEMA': currentTheme.index
                    };

                    Navigator.pushNamed(context, 'second', arguments: values);
                  },
                ),
              ))
        ],
      )),
    );
  }
}
