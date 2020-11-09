import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String city;
  final String position;

  User({
    @required this.name,
    @required this.email,
    @required this.city,
    @required this.position,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      city: json['city'],
      position: json['position'],
    );
  }
}
