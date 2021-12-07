import 'package:dateme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  padding: const EdgeInsets.fromLTRB(20, 15, 0, 10),
                  child: Text(
                    'First Name, 21',
                    style: kboldNameStyle,
                  ),
                ),
                Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "About Me",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Text(
                      'Im a photgrapher and a model. Just want someone to hang out with.'),
                ),
                Divider(), //customize the divider
                customInterestCard(
                    interestText: "Interest 1", colour: Colors.red),
                customInterestCard(
                    interestText: "Interest 2", colour: Colors.orange),
                customInterestCard(
                    interestText: "Interest 3", colour: Colors.yellow),
                Divider(),
                customMusicCard(),
                Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close, size: 30, color: Colors.orange)),
                )
              ],
            ),
          ),
        ),
      );
}

class customMusicCard extends StatelessWidget {
  const customMusicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Flexible(child: musicTrackCard()),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
              child: Row(
                children: [
                  Flexible(flex: 3, child: customMessageButton()),
                  Flexible(
                      flex: 1,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder()),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(FontAwesomeIcons.userPlus,
                              color: Colors.black),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20.0)),
      )),
    );
  }
}

//custom card for the music tracks
class musicTrackCard extends StatelessWidget {
  const musicTrackCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
}

//message button on the bottom sheet
class customMessageButton extends StatelessWidget {
  const customMessageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("messaging person"),
      child: Container(
        child: Center(
            child: Text('Message',
                style: TextStyle(
                    color: kpinkColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400))),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}

class customInterestCard extends StatelessWidget {
  String interestText;
  Color colour;

  customInterestCard({required this.interestText, required this.colour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: colour,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(interestText),
          ),
          height: MediaQuery.of(context).size.height * 0.08,
        ),
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
