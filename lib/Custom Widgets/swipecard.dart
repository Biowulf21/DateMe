import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//modules
import 'package:dateme/Classes/personList.dart';
import 'musicWidgets.dart';
import 'package:dateme/Classes/Person.dart';
import 'package:dateme/constants.dart';

class SwipeCard extends StatelessWidget {
  SwipeCard(
      {Key? key,
      required this.profilePicture,
      required this.colour,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.bio})
      : super(key: key);

  NetworkImage profilePicture;
  Color colour;
  String firstName;
  String lastName;
  int age;
  String bio;

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
            builder: (context) =>
                BuildSheet(firstname: firstName, bio: bio, age: age));
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
                borderRadius: BorderRadius.circular(20.0),
                color: colour,
                image:
                    DecorationImage(image: profilePicture, fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20),
                    child: Text(
                      '${firstName}, ${age}',
                      style: kboldNameStyle,
                    )),
              ],
            )),
      ),
    );
  }
}

class BuildSheet extends StatefulWidget {
  String firstname, bio;
  int age;

  BuildSheet({required this.firstname, required this.bio, required this.age});

  @override
  _BuildSheetState createState() => _BuildSheetState();
}

class _BuildSheetState extends State<BuildSheet> {
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

  @override
  Widget build(BuildContext context) {
    return makeDismissable(
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
                  '${widget.firstname}, ${widget.age}',
                  style: kboldNameStyleBlack,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Text('${widget.bio}'),
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
}

//custom card for the music tracks

//message button on the bottom sheet

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
  //list of people whose information will be put from  'database'
  late List<Person> userList;
  Users users = Users();
  List<SwipeCard> listofCards = [
    SwipeCard(
      colour: Colors.red,
      firstName: 'Nanamie',
      lastName: 'Sakamoto',
      age: 21,
      bio: 'I\'m an independent woman who don\'t need no man (jk date me pls).',
      profilePicture: NetworkImage(
          'https://scontent.fdvo2-1.fna.fbcdn.net/v/t39.30808-6/248586883_4529129670528154_1107776970941438761_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=6-NuISOZfjcAX-xqpDI&_nc_ht=scontent.fdvo2-1.fna&oh=270b757a326744985551d6b01341d338&oe=61B3F55B'),
    )
  ];

  @override
  void initState() {
    super.initState();
    //on intiialization of page, all item in the personlist database will be imported to the userlist variable
    userList = users.itemlist;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(children: listofCards),
    );
  }
}
