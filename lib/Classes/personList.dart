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
    Person(
      fname: 'Aaron',
      lname: 'Lagura',
      bio: 'I like icecream!',
      birthday: DateTime.utc(2000, 12, 1),
      age: 21,
      gender: Gender.male,
      preferredGender: Gender.female,
      profilePicture: Image.network(
          'https://scontent.fmnl4-5.fna.fbcdn.net/v/t1.6435-9/104127891_1675191699315476_7377662041652503862_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=eXQfLeObqCQAX-nHjG7&tn=lwD1PZnNUdIStSbg&_nc_ht=scontent.fmnl4-5.fna&oh=00_AT9KXc58b5dt1kFMu_7RJrGl80XSRSJuYu9Io52Qqo30JA&oe=61E14FFD'),
    ),
    Person(
        fname: 'Christlie',
        lname: 'Bestes',
        bio: 'Certified 21 Pilots fan',
        birthday: DateTime.utc(2001, 12, 19),
        age: 20,
        gender: Gender.male,
        preferredGender: Gender.female,
        profilePicture: Image.network(
            'https://pbs.twimg.com/profile_images/1316016469273055236/T-C1bUEn_400x400.jpg'))
  ];

  get itemlist {
    return _items;
  }

  get listLength {
    return _items.length;
  }
}
