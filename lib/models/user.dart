

import 'package:flutter_practice/models/location.dart';
import 'package:flutter_practice/models/picture.dart';

import 'name.dart';

class User {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Picture picture;

  User(this.gender, this.name, this.location, this.email, this.picture);

  User.fromJson(Map<String, dynamic> json)
      : gender = json["gender"],
        name = Name.fromJson(json["name"]),
        location = Location.fromJson(json["location"]),
        email = json["email"],
        picture = Picture.fromJson(json["picture"]);

}