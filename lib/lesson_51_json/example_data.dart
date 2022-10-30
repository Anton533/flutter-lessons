import 'package:flutter_example/lesson_51_json/address.dart';
import 'package:flutter_example/lesson_51_json/human.dart';

final humans = [
  Human(
    name: 'Ivan',
    surname: 'Ivanov',
    age: 31,
    address: [
      Address(city: 'Kiev', street: "IvanStreetOne", house: '32b', flat: 43),
      Address(city: 'City', street: 'InanStreetTwo', house: '23a', flat: 54),
    ],
  ),
  Human(
    name: 'Petr',
    surname: 'Petrov',
    age: 31,
    address: [
      Address(city: 'Kiev', street: 'PetrStreetOne', house: '12b', flat: 143),
      Address(city: 'City', street: 'PetrStreetTwo', house: '17a', flat: 354),
    ],
  )
];

const jsonString = ''' 
[
  {
    "first_name": "Ivan",
    "surname": "Ivanov",
    "age": 31,
    "address":[
      {
      "city": "Kiey",
      "street": "IvanStreetOne",
      "house": "32b",
      "flat": 43
      },
      {
      "city": "City",
      "street": "InanStreetTwo",
      "house": "23a",
      "flat": 54
      }
    ]  
  }
] 
  ''';
