// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

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
                  Expanded(flex: 5, child: customMessageButton()),
                  Flexible(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.userPlus)))
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
