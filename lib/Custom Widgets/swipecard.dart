import 'package:dateme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class SwipeCard extends StatelessWidget {
  SwipeCard({Key? key, required this.colour}) : super(key: key);

  Color colour;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Clicked swipable');
        //shows the bottom sheet that appears whenevers a swipable is tapped
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (context) => buildSheet(context));
        // Navigator.push(context, Drawer())
      },
      child: Swipable(
        verticalSwipe: false,
        onSwipeRight: (finalPosition) {
          print('Swiped right');
        },
        onSwipeLeft: (finalposition) {
          print('Swiped left');
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color: colour),
        ),
      ),
    );
  }

  Widget makeDismissable(
          {required Widget child, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  buildSheet(context) => makeDismissable(
        context: context,
        child: DraggableScrollableSheet(
          maxChildSize: 0.7,
          initialChildSize: 0.3,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: ListView(
              controller: controller,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    'First Name, 21',
                    style: kboldNameStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      );
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
