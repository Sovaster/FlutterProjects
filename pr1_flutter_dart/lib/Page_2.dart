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
            height: 900,
            width: 390,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage("asset/chel.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 450,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Peter Mach",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 12,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      const Text("Mind Deep Relax",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.",
                  maxLines: 4,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 3, 158, 162)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            "Play Next Session",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 210,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ItomMusic(
                          name: "Sweet Memories",
                          date: "December 29 Pre-Launch",
                          color: Colors.blue,
                        ),
                        ItomMusic(
                          name: "A Day Dream",
                          date: "December 29 Pre-Launch",
                          color: Colors.greenAccent,
                        ),
                        ItomMusic(
                          name: "Mind Explore",
                          date: "December 29 Pre-Launch",
                          color: Colors.orange,
                        ),
                        ItomMusic(
                          name: "Sweet Memories",
                          date: "December 29 Pre-Launch",
                          color: Colors.blue,
                        ),
                        ItomMusic(
                          name: "A Day Dream",
                          date: "December 29 Pre-Launch",
                          color: Colors.greenAccent,
                        ),
                        ItomMusic(
                          name: "Mind Explore",
                          date: "December 29 Pre-Launch",
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
