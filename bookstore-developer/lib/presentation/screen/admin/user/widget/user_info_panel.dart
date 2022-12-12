import 'package:flutter/material.dart';

class UserProfilePanel extends StatefulWidget {
  const UserProfilePanel({super.key});

  @override
  State<UserProfilePanel> createState() => _UserProfilePanelState();
}

class _UserProfilePanelState extends State<UserProfilePanel>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isVisibilityPanel = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Checkbox(
              value: isVisibilityPanel,
              fillColor: MaterialStateProperty.all(Colors.indigo),
              onChanged: (value) {
                setState(() {
                  isVisibilityPanel = value!;
                });
              },
            ),
            title: Text('Дополнительная информация'),
          ),
          AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: isVisibilityPanel
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Container(),
              secondChild: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Фамилия',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Имя',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Отчество',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ))
        ],
      ),
    );
  }
}
