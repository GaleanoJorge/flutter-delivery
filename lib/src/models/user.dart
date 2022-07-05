import 'dart:convert';

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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ? json["id"] : null,
        email: json["email"] ? json["email"] : null,
        name: json["name"] ? json["name"] : null,
        lastname: json["lastname"] ? json["lastname"] : null,
        phone: json["phone"] ? json["phone"] : null,
        image: json["image"] ? json["image"] : null,
        password: json["password"] ? json["password"] : null,
        isAvailable: json["is_available"] ? json["is_available"] : null,
        sessionToken: json["session_token"] ? json["session_token"] : null,
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
      };
}
