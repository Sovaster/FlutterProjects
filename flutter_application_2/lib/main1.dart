import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        child: Column(
          children: [
            Image.asset("assets/123.jpg"),
            Image.network(
                "https://img10.reactor.cc/pics/post/Anime-Darling-In-The-Franxx-Zero-Two-%28Darling-in-the-Franxx%29-k-me-4360682.jpeg")
          ],
        ),
      ),
      // body: Container(
      //   width: 100,
      //   height: 100,
      //   alignment: Alignment.center,
      //   margin: const EdgeInsets.all(10),
      //   padding: const EdgeInsets.all(5),
      //   decoration: BoxDecoration(
      //       color: Colors.amber,
      //       borderRadius: BorderRadius.circular(30),
      //       border: Border.all(
      //         color: Colors.black,
      //         width: 10,
      //       )),
      //   child: const Text(
      //     "Hello",
      //     style: TextStyle(color: Colors.white, fontSize: 10),
      //   ),
      // ),
    );
  }
}
