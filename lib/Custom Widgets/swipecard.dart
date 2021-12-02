import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class SwipeCard extends StatelessWidget {
  SwipeCard({required this.colour});

  Color colour;
  @override
  Widget build(BuildContext context) {
    return Swipable(
      verticalSwipe: false,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: colour),
      ),
    );
  }
}

class SwipeStack extends StatefulWidget {
  @override
  _SwipeStackState createState() => _SwipeStackState();
}

class _SwipeStackState extends State<SwipeStack> {
  List<SwipeCard> listofCards = [
    SwipeCard(colour: Colors.red),
    SwipeCard(colour: Colors.blue),
    SwipeCard(colour: Colors.green),
    SwipeCard(colour: Colors.lightBlue),
    SwipeCard(colour: Colors.purple)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(children: listofCards),
    );
  }
}
