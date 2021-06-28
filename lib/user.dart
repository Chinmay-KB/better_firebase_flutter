// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.achievements,
    required this.alive,
    required this.name,
    required this.people,
    required this.age,
  });

  List<Achievement> achievements;
  bool alive;
  String name;
  People people;
  int age;

  factory User.fromJson(Map<String, dynamic> json) => User(
        achievements: List<Achievement>.from(
            json["achievements"].map((x) => Achievement.fromJson(x))),
        alive: json["alive"],
        name: json["name"],
        people: People.fromJson(json["people"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
        "alive": alive,
        "name": name,
        "people": people.toJson(),
        "age": age,
      };
}

class Achievement {
  Achievement({
    required this.data,
    required this.type,
  });

  String data;
  String type;

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        data: json["data"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "type": type,
      };
}

class People {
  People({
    required this.friends,
  });

  List<Friend> friends;

  factory People.fromJson(Map<String, dynamic> json) => People(
        friends:
            List<Friend>.from(json["friends"].map((x) => Friend.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "friends": List<dynamic>.from(friends.map((x) => x.toJson())),
      };
}

class Friend {
  Friend({
    required this.achievements,
    required this.name,
  });

  List<Achievement> achievements;
  String name;

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        achievements: List<Achievement>.from(
            json["achievements"].map((x) => Achievement.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
        "name": name,
      };
}
