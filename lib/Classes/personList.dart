// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import 'Person.dart';

class Users {
  final _items = <Person>[
    Person(
        profilePicture: Image.network(
            'https://scontent.fdvo2-1.fna.fbcdn.net/v/t39.30808-6/248586883_4529129670528154_1107776970941438761_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=6-NuISOZfjcAX-xqpDI&_nc_ht=scontent.fdvo2-1.fna&oh=270b757a326744985551d6b01341d338&oe=61B3F55B'),
        fname: 'Mary',
        lname: 'Sue',
        bio: 'I am just a photographer looking for a good time and blablabla',
        birthday: DateTime.utc(1999, 11, 12),
        age: 21,
        gender: Gender.female,
        preferredGender: Gender.male),
    Person(
        profilePicture: Image.network(
            'https://scontent.fdvo2-1.fna.fbcdn.net/v/t1.6435-9/173108996_3810358232424372_6382907658385410901_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=UGbFROWPeNkAX9TFGWG&_nc_ht=scontent.fdvo2-1.fna&oh=304d1941d49651867283b7269a50a9b7&oe=61D51777'),
        fname: 'James',
        lname: 'Jilhaney',
        bio: "i want sex yadayadayadayada",
        birthday: DateTime.utc(2000, 09, 04),
        age: 21,
        gender: Gender.male,
        preferredGender: Gender.female),
  ];

  get itemlist {
    return _items;
  }
}
