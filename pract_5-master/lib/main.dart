import 'package:flutter/material.dart';
import 'package:pract_5/first.dart';
import 'package:pract_5/second.dart';
import 'package:pract_5/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      builder: ((context, themeMode, child) => MaterialApp(
            title: 'Shared',
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: themeMode,
            initialRoute: 'first',
            routes: {
              'first': (context) => FirstPage(_notifier),
              'second': (context) => SecondPage(),
            },
          )),
      valueListenable: _notifier,
    );
  }
}
