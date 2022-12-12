import 'package:flutter/material.dart';
  
class DrawerAdmin extends StatelessWidget {
  const DrawerAdmin({Key? key, required this.titleItem, required this.index})
      : super(key: key);

  ///
  final List<String> titleItem;

  ///
  final Function(int, String) index;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 170,
            child: DrawerHeader(
              padding: const EdgeInsets.only(left: 20, right: 5, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'PDA2304',
                        style: TextStyle(fontSize: 26),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () =>
                            Navigator.pushNamed(context, 'settings_admin'),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.settings),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ...titleItem.map(
            (element) {
              return InkWell(
                onTap: () {
                  index(titleItem.indexOf(element), element);
                  Navigator.pop(context);
                },
                child: item(element, false),
              );
            },
          ).toList(),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'sign_in', (route) => false);
            },
            child: item('Выход', true),
          )
        ],
      ),
    );
  }

  Widget item(String content, bool isIcon) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        children: [
          isIcon
              ? const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.exit_to_app),
                )
              : const SizedBox(),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
