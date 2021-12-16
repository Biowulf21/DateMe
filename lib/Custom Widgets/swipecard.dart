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
      required this.firstName,
      required this.lastName,
      this.colour,
      required this.age,
      required this.bio})
      : super(key: key);

  NetworkImage profilePicture;
  Color? colour;
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
        profilePicture: NetworkImage(
            'https://scontent.fmnl4-5.fna.fbcdn.net/v/t1.18169-9/17796373_10212446561029805_2031448292497081221_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=xnCcKkr_j9IAX8nDYe-&_nc_ht=scontent.fmnl4-5.fna&oh=00_AT_bAgIPBxXSpfy5BUNRhk9S_RU-iTeSKtlKyrAmAYpd1g&oe=61E09406'),
        firstName: 'Poloi',
        lastName: 'Ash',
        age: 24,
        bio: 'Git gud bro'),
    SwipeCard(
        profilePicture: const NetworkImage(
            'https://scontent.fmnl4-1.fna.fbcdn.net/v/t1.18169-9/19366618_1541518562576921_4912835116745060597_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=qySjCQjRWNoAX_iNJGH&_nc_ht=scontent.fmnl4-1.fna&oh=00_AT975VxKFqu_c-BuSSw4p2cqKeNwOVqigB8EeH3hpCJbbg&oe=61E219BA'),
        colour: Colors.red,
        firstName: 'James',
        lastName: 'Panganiban',
        age: 20,
        bio: '@Jamesdeii✌s'),
    SwipeCard(
        profilePicture: const NetworkImage(
            'https://scontent.fmnl4-3.fna.fbcdn.net/v/t1.6435-9/173108996_3810358232424372_6382907658385410901_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=xKL_ycrrvV0AX8Z8VRh&_nc_ht=scontent.fmnl4-3.fna&oh=0a03ba157d0921fa3d03854133099994&oe=61D51777'),
        colour: Colors.red,
        firstName: 'James',
        lastName: 'Jilhaney',
        age: 22,
        bio: 'Professional idiot and gamer. Are you ready for 3 inches?'),
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
