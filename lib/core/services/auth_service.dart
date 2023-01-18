import 'dart:convert';

import 'package:business_app/core/models/company_model.dart';
import 'package:business_app/core/models/user_model.dart';
import 'package:business_app/global.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  Future<LoggedInUser> loginUserPwDb(User user) async {
    try {
      String jsonUser = jsonEncode({
        "userName": user.userName,
        "password": user.password,
        "companyDB": user.companyDB
      });
      var response = await http.post(
        Uri.parse('${UrlConstants.baseUrl}/sap/login'),
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json'
        },
        body: jsonUser,
      );
      
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      LoggedInUser loggedInUser = LoggedInUser.fromMap(data["result"]);

      return loggedInUser;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await http.post(Uri.parse('${UrlConstants.baseUrl}/sap/logout'));
      Future.delayed(const Duration(seconds: 1), () {});
      
    } catch (err) {
      rethrow;
    }
  }

  Future<List<Company>> getCompanies() async {
    List<Company> companyList = [];
    try {
      var response = await http
          .get(Uri.parse('${UrlConstants.baseUrl}/list/sbocompanies'));
      var data = jsonDecode(response.body.toString());
      for (var company in data) {
        companyList.add(Company.fromMap(company));
      }
      return companyList;
    } catch (err) {
      rethrow;
    }
  }
}
