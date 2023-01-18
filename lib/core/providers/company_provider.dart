import 'package:business_app/core/models/company_model.dart';
import 'package:flutter/foundation.dart';

class CompanyNameProvider extends ChangeNotifier {
  List<Company> _companies = [];
  List<Company> get companies => _companies;

  get size => _companies.length;
  
}