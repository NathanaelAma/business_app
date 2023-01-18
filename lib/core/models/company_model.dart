// To parse this JSON data, do
//
//     final company = companyFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Company {
    Company({
        required this.companyDB,
        required this.companyName,
    });

    final String companyDB;
    final String companyName;

    factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Company.fromMap(Map<String, dynamic> json) => Company(
        companyDB: json["companyDB"],
        companyName: json["companyName"],
    );

    Map<String, dynamic> toMap() => {
        "companyDB": companyDB,
        "companyName": companyName,
    };

    getCompanyDb() {
      return companyDB;
    }

    getCompanyName() {
      return companyName;
    }
}
