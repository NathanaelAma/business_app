import 'package:business_app/core/models/picklist/picklist_lines_model.dart';
import 'package:business_app/core/models/picklist/picklist_model.dart';
import 'package:business_app/core/services/pick_service.dart';
import 'package:flutter/foundation.dart';

class PickProvider extends ChangeNotifier {
  final PickService _pickService = PickService();
  PickProvider() : super();
  PickList? _pickList;
  PickListLine? _pickListLines;
  List<PickListLine> _uniquePickListLines = <PickListLine>[];

  get pickList => _pickList;
  get pickListLines => _pickListLines;
  get uniquePickListLines => _uniquePickListLines;

  Future getPickList(int pickId) async {
    try {
      _pickList = await _pickService.getPickList(pickId);
      notifyListeners();
      return _pickList;
    } catch (err) {
      rethrow;
    }
  }

  Future getPickListLines(int pickId) async {
    try {
      _pickListLines = await _pickService.getPickListLines(pickId);
      notifyListeners();
      return _pickListLines;
    } catch (err) {
      rethrow;
    }
  }

  Future getUniquePickListLines({int? pickId}) async {
    var seen = <String>{};
    try {
      if (pickId == null && _pickList != null) {
        List<PickListLine>? currentPickList = _pickList?.pickListLines;
        _uniquePickListLines = currentPickList!
            .where((element) => seen.add(element.orderEntry.toString()))
            .toList();
      } else if (pickListLines != null) {
        getPickList(pickId!);
        List<PickListLine>? currentPickList = _pickList?.pickListLines;
        _uniquePickListLines = currentPickList!
            .where((element) => seen.add(element.orderEntry.toString()))
            .toList();
        notifyListeners();
      }

      notifyListeners();
      return _uniquePickListLines;
    } catch (err) {
      rethrow;
    }
  }
}
