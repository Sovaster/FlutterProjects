import 'package:flutter/material.dart';

class SettingsAdmin extends StatefulWidget {
  const SettingsAdmin({Key? key}) : super(key: key);

  @override
  State<SettingsAdmin> createState() => _SettingsAdminState();
}

class _SettingsAdminState extends State<SettingsAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Настройки'),
      ),
    );
  }
}
