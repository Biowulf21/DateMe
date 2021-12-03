import 'package:dateme/Custom%20Widgets/swipecard.dart';
import 'package:flutter/material.dart';
import 'package:dateme/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_drawer/bottom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kbackgroundColor,
            elevation: 1,
            centerTitle: true,
            title: Row(
              verticalDirection: VerticalDirection.up,
              textBaseline: TextBaseline.ideographic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DateMe",
                  style: klargeTitleStyle,
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/icons/DateMe Logo.png"),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
                color: Colors.orange,
              ),
            ],
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.slidersH),
              color: Colors.orange,
            )),
        backgroundColor: kbackgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SwipeStack(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Name of person, Age",
                    style: kswipeNameStyle,
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/Swipe left.png"),
                        iconSize: 60,
                        splashRadius: 40,
                        color: Colors.red,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/Favorite.png"),
                        iconSize: 60,
                        splashRadius: 40,
                        color: const Color(0xffE8C842),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/icons/Swipe right.png"),
                          iconSize: 60,
                          splashRadius: 40,
                          color: const Color(0xff4CD964))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/Swipe left.png"),
                      iconSize: 60,
                      splashRadius: 40,
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/Favorite.png"),
                      iconSize: 60,
                      splashRadius: 40,
                      color: const Color(0xffE8C842),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/Swipe right.png"),
                        iconSize: 60,
                        splashRadius: 40,
                        color: const Color(0xff4CD964))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
