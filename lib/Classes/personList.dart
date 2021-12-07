// ignore_for_file: file_names

import 'Person.dart';

class Users {
  final _items = <Person>[
    Person(
        fname: 'Mary',
        lname: 'Sue',
        birthday: DateTime.utc(1999, 11, 12),
        age: 21,
        gender: Gender.female,
        preferredGender: Gender.male),
    Person(
        fname: 'James',
        lname: 'Jilhaney',
        birthday: DateTime.utc(2000, 09, 04),
        age: 21,
        gender: Gender.male,
        preferredGender: Gender.female),
  ];
}
