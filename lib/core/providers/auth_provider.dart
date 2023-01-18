import 'package:business_app/core/models/company_model.dart';
import 'package:business_app/core/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:business_app/core/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  
  LoggedInUser? currentUser;
  List<Company> companyList = [];
  Company? currentCompany;
  AuthService authService = AuthService();

  Future<void> logInUserPwDb(
      User user) async {
    LoggedInUser loggedInUser;
    try {
      loggedInUser = await authService.loginUserPwDb(user);
      currentUser = loggedInUser;
      notifyListeners();
    } catch (err) {
      rethrow;
    }
    
  }

  void setCompanyList (List<Company> companyList) {
    this.companyList = companyList;
    notifyListeners();
  }
  
  Future<void> updateCompanyList() async {
    companyList = await authService.getCompanies();
    notifyListeners();
  }

  Future<void> logOutUser() async {
    currentUser = null;
    companyList = [];
    currentCompany = null;
    await authService.logoutUser();
    notifyListeners();
  }
}
