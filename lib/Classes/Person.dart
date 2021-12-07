// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/cupertino.dart';

enum Gender { male, female, gay, lesbian, bisexual, nonbinary }

class Person {
  //Widget profilePicture;
  //List<Widget> listofPhotos;
  String fname;
  String lname;
  int age;
  DateTime birthday;
  Gender gender;
  Gender preferredGender;

  Person({
    required this.fname,
    required this.lname,
    required this.birthday,
    required this.age,
    required this.gender,
    required this.preferredGender,
    //required this.listofPhotos,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
      fname: json['fname'],
      lname: json['lname'],
      birthday: json['birthday'],
      age: json['age'],
      gender: json['gender'],
      preferredGender: json['preferredGender']);

  Map<String, dynamic> toJson() => {
        'fname': fname,
        'lname': lname,
        'birthday': birthday,
        'age': age,
        'gender': gender,
        'preferredGender': preferredGender,
      };
}
