import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Page_2.dart';
import 'Page_3.dart';

class ItemMeditate extends StatelessWidget {
  @override
  final AssetImage image;
  final String name;
  final String nameAuthor;
  final String likes;
  final double height;
  final double width;
  final double heightImage;
  final double topFontSize;
  final double bottonFontSize;

  ItemMeditate({
    Key? key,
    required this.image,
    required this.name,
    required this.nameAuthor,
    required this.likes,
    required this.height,
    required this.heightImage,
    required this.width,
    required this.topFontSize,
    required this.bottonFontSize,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 246, 245),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: heightImage,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: topFontSize),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  nameAuthor,
                  style: TextStyle(
                      fontSize: bottonFontSize,
                      color: Color.fromARGB(255, 128, 128, 128)),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "asset/Heard.png",
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(likes + " Sessions",
                        style: TextStyle(
                            color: Color.fromARGB(255, 128, 128, 128))),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text("Start", style: TextStyle(color: Colors.grey)),
                          Text(
                            " >",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemScroll extends StatelessWidget {
  @override
  final String text;
  final Color color;
  final Color colorText;

  ItemScroll({
    Key? key,
    required this.text,
    required this.color,
    required this.colorText,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 204, 253, 255)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)))),
        child: Text(
          text,
          style: TextStyle(color: colorText, fontSize: 15),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class ItomMusic extends StatelessWidget {
  @override
  final String name;
  final String date;
  final Color color;

  ItomMusic({
    Key? key,
    required this.name,
    required this.date,
    required this.color,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      width: 410,
      height: 70,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey, width: 0.2, style: BorderStyle.solid))),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 55,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            child: Expanded(
              child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                    size: 40,
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: const TextStyle(
                    fontSize: 12, color: Colors.grey, letterSpacing: 1),
              ),
            ],
          ),
          Spacer(),
          Image.asset("asset/dot.png")
        ],
      ),
    );
  }
}
