import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr1_flutter_dart/Pluses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(children: [
          Container(
            height: 950,
            width: 390,
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Meditate",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.search_outlined)
                    ],
                  ),
                ),
                Container(
                  width: 440,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 35,
                            margin: EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 3, 158, 162)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)))),
                              child: Text(
                                "All",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          ItemScroll(
                            text: "Bible In a Year",
                            color: Color.fromARGB(255, 255, 255, 255),
                            colorText: Color.fromARGB(255, 0, 117, 121),
                          ),
                          ItemScroll(
                            text: "Dailies",
                            color: Color.fromARGB(255, 230, 254, 255),
                            colorText: Color.fromARGB(255, 0, 117, 121),
                          ),
                          ItemScroll(
                            text: "Minutes",
                            color: Color.fromARGB(255, 230, 254, 255),
                            colorText: Color.fromARGB(255, 0, 117, 121),
                          ),
                          ItemScroll(
                            text: "November",
                            color: Color.fromARGB(255, 230, 254, 255),
                            colorText: Color.fromARGB(255, 0, 117, 121),
                          ),
                        ],
                      )),
                ),
                ItemMeditate(
                  width: 380,
                  image: AssetImage("asset/San.png"),
                  name: "A Song of Moon",
                  nameAuthor: "Start with the basics",
                  likes: "124",
                  heightImage: 190,
                  height: 320,
                  topFontSize: 22,
                  bottonFontSize: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: 380,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemMeditate(
                              width: 180,
                              image: AssetImage("asset/San2.png"),
                              name: "The Sleep Hour",
                              nameAuthor: "Ashna Mukherjee",
                              likes: "6",
                              heightImage: 120,
                              height: 240,
                              topFontSize: 15,
                              bottonFontSize: 14,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ItemMeditate(
                              width: 180,
                              image: AssetImage("asset/San3.png"),
                              name: "Easy on the Mission",
                              nameAuthor: "Peter Mach",
                              likes: "1",
                              heightImage: 120,
                              height: 240,
                              topFontSize: 15,
                              bottonFontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemMeditate(
                              width: 180,
                              image: AssetImage("asset/San4.png"),
                              name: "Relax with Me",
                              nameAuthor: "Amanda James",
                              likes: "2",
                              heightImage: 120,
                              height: 240,
                              topFontSize: 15,
                              bottonFontSize: 14,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ItemMeditate(
                              width: 180,
                              image: AssetImage("asset/San5.png"),
                              name: "Sun and Energy",
                              nameAuthor: "Micheal Hiu",
                              likes: "9",
                              heightImage: 120,
                              height: 240,
                              topFontSize: 15,
                              bottonFontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemMeditate(
                              width: 180,
                              image: AssetImage("asset/San.png"),
                              name: "Easy on the Mission",
                              nameAuthor: "Peter Mach",
                              likes: "5",
                              heightImage: 120,
                              height: 240,
                              topFontSize: 15,
                              bottonFontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
