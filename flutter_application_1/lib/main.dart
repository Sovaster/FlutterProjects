import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "";

  void _incrementCounter() {
    setState(() {
      Random random = new Random();
      int randomNumber = random.nextInt(6);

      List list1 = ["word1", "word2", "word3", "word4", "word5"];
      _counter = list1[randomNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text("SOSI123"),
      ),
      // body: Center(
      //   child: Text("KAIF"),
      // ),
      // body: Stack(
      //   children: [
      //     Container(
      //         width: 150, height: 50, color: Color.fromARGB(255, 255, 0, 179)),
      //     Container(
      //         width: 50, height: 50, color: Color.fromARGB(255, 0, 64, 255)),
      //   ],
      // ),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //         width: 150, height: 50, color: Color.fromARGB(255, 255, 0, 179)),
      //     Text('data'),
      //     Text('data'),
      //     Text('data'),
      //     Text('data'),
      //     Text('data'),
      //   ],
      // ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //         width: 150, height: 50, color: Color.fromARGB(255, 255, 0, 179)),
      //     Text('data'),
      //     Text('data'),
      //     Text('data'),
      //     Text('data'),
      //     Text('data'),
      //   ],
      // ),
      // body: Container(
      //   // color: Colors.indigo,
      //   margin: EdgeInsets.all(10),
      //   padding: EdgeInsets.all(50),
      //   decoration: BoxDecoration(
      //       color: Color.fromARGB(255, 0, 252, 25),
      //       borderRadius: BorderRadius.circular(30),
      //       border: Border.all(color: Colors.black, width: 5)),
      //   child: Text("HEllo"),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
