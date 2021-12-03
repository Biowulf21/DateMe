import 'package:flutter/material.dart';
import 'Screens/homepage.dart';

void main() {
  runApp(const DateMe());
}

class DateMe extends StatelessWidget {
  const DateMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Date Me",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
