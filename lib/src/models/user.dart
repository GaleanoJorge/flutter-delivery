import 'dart:convert';

import 'package:flutter_delivery/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  dynamic id;
  dynamic email;
  dynamic name;
  dynamic lastname;
  dynamic phone;
  dynamic image;
  dynamic password;
  dynamic isAvailable;
  dynamic sessionToken;
  dynamic roles;

  User({
    this.id,
    this.email,
    this.name,
    this.lastname,
    this.phone,
    this.image,
    this.password,
    this.isAvailable,
    this.sessionToken,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        email: json["email"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        image: json["image"],
        password: json["password"],
        isAvailable: json["is_available"],
        sessionToken: json["session_token"], 
        roles: json["roles"] == null ? [] : List<Rol>.from(json["roles"].map((model)=> Rol.fromJson(model))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "image": image,
        "password": password,
        "is_available": isAvailable,
        "session_token": sessionToken,
        "roles": roles,
      };
}
