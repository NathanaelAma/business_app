// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    User({
        required this.userName,
        required this.password,
        required this.companyDB,
    });

    final String? userName;
    final String? password;
    final String? companyDB;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        userName: json["userName"],
        password: json["password"],
        companyDB: json["companyDB"],
    );

    Map<String, dynamic> toMap() => {
        "userName": userName,
        "password": password,
        "companyDB": companyDB,
    };
}

class LoggedInUser {
    LoggedInUser({
         this.id,
         this.userCode,
         this.userName,
         this.email,
         this.superUser,
    });

    final int? id;
    final String? userCode;
    final String? userName;
    final String? email;
    final String? superUser;

    factory LoggedInUser.fromJson(String str) => LoggedInUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoggedInUser.fromMap(Map<String, dynamic> json) => LoggedInUser(
        id: json["id"],
        userCode: json["userCode"],
        userName: json["userName"],
        email: json["email"],
        superUser: json["superUser"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userCode": userCode,
        "userName": userName,
        "email": email,
        "superUser": superUser,
    };
}
