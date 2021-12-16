import 'package:flutter/material.dart';
import 'Screens/homepage.dart';
import 'constants.dart';

void main() {
  runApp(const DateMe());
}

class DateMe extends StatelessWidget {
  const DateMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Date Me",
      theme: ThemeData.light().copyWith(
          backgroundColor: Colors.orange,
          primaryColor: Colors.orange,
          focusColor: Colors.orangeAccent),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
