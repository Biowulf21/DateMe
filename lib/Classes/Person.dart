// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/cupertino.dart';

enum Gender { male, female, gay, lesbian, bisexual, nonbinary }

class Person {
  Image profilePicture;
  //List<Widget> listofPhotos;
  String fname, lname, bio;
  int age;
  DateTime birthday;
  Gender gender, preferredGender;

  Person(
      {required this.fname,
      required this.lname,
      required this.bio,
      required this.birthday,
      required this.age,
      required this.gender,
      required this.preferredGender,
      required this.profilePicture
      //required this.listofPhotos,
      });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
      fname: json['fname'],
      lname: json['lname'],
      bio: json['bio'],
      birthday: json['birthday'],
      age: json['age'],
      gender: json['gender'],
      preferredGender: json['preferredGender'],
      profilePicture: json['profilePicture']);

  Map<String, dynamic> toJson() => {
        'fname': fname,
        'lname': lname,
        'bio': bio,
        'birthday': birthday,
        'age': age,
        'gender': gender,
        'preferredGender': preferredGender,
      };
}
