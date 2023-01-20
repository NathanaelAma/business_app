import 'dart:convert';

import 'package:business_app/core/models/picklist_model.dart';
import 'package:business_app/global.dart';
import 'package:http/http.dart' as http;

class PickService {
  factory PickService() => _instance;
  static final PickService _instance = PickService._internal();
  PickService._internal();

  Future<PickList> getPickList(int pickId) async {
    try {
      var response = await http.get(
        Uri.parse('${UrlConstants.baseUrl}/picklist/$pickId'),
      );
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      PickList pickList = PickList.fromMap(data);
      return pickList;
    } catch (err) {
      rethrow;
    }
  }
}
