import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<CardInformationModel> cardInformationList = [
    CardInformationModel(
      background: Colors.indigo,
      iconCard: Icons.person,
      textCard: 'Пользователи: 150',
      iconAdd: Icons.person_add,
      onTap: () {},
    ),
    CardInformationModel(
      background: Colors.orange,
      iconCard: Icons.menu_book_sharp,
      textCard: 'Книги: 112',
      iconAdd: Icons.add,
      onTap: () {},
    ),
    CardInformationModel(
      background: Colors.orange,
      iconCard: Icons.menu_book_sharp,
      textCard: 'Авторы: 100',
      iconAdd: Icons.add,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardInformationList.length,
      itemBuilder: (context, index) {
        return cardInformation(
          cardInformationList[index].background,
          cardInformationList[index].iconCard,
          cardInformationList[index].textCard,
          cardInformationList[index].iconAdd,
          cardInformationList[index].onTap,
        );
      },
    );
  }

  Widget cardInformation(
    Color background,
    IconData iconCard,
    String textCard,
    IconData iconAdd,
    Function onTap,
  ) {
    return Card(
      color: background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.white,
              width: 5,
            ),
          ),
        ),
        padding: const EdgeInsets.all(10),
        height: 65,
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70,
                    ),
                    child: Icon(
                      iconCard,
                      color: background,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.bottomCenter,
                    height: double.infinity,
                    child: Text(
                      textCard,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        onTap();
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Icon(iconAdd),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInformationModel {
  final Color background;
  final IconData iconCard;
  final String textCard;
  final IconData iconAdd;
  final Function onTap;

  CardInformationModel({
    required this.background,
    required this.iconCard,
    required this.textCard,
    required this.iconAdd,
    required this.onTap,
  });
}
