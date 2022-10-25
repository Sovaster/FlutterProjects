import 'dart:ffi';

import 'package:testproject/testproject.dart' as testproject;

void main(List<String> arguments) {
  int a = 2;
  double b = 4.5;
  String word = "word";
  String word1 = """word hi""";
  print(word);

  List list = [];
  List list1 = ["word2", 2, 4.5];
  List<String> list2 = ["word2", "ggwp", "LOL"];

  Map map = {};
  Map map1 = {1: "Hello1", "ggwp": 2};
  Map<int, String> map2 = {1: "Hello1"};

  Set set = {1, 2, 2, 2, 3, 4, 5, 5, 5};

  for (var i = 0; i < 4; i++) {
    print(word1);
  }

  for (var element in set) {
    print(set);
  }

  while (4 > 5) {
    print(word);
  }

  do {
    print(word);
  } while (4 > 5);

  if (a > 3) {
    b = 4.2;
  } else {
    b = 6.2;
  }

  a > 3 ? b = 4.2 : b = 6.2;

  switch (a) {
    case 1:
      break;
    default:
  }

  const run = 123;
  final run2;
  late int run3;
  String mach = "LOL123";

  Car car3 = Car("engine");
  Car? car;
  car ?? print("nope123");
  print(lol123(mach));
  print('Hello world: ${testproject.calculate()}!');

  Car? car2;
  // print(car2!.engine);
  print(car2?.engine);
}

String lol123(String word) {
  return word;
}

class Car {
  final String engine;

  Car(this.engine);
}
