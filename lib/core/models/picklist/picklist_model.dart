// To parse this JSON data, do
//
//     final pickList = pickListFromMap(jsonString);

import 'package:business_app/core/models/picklist/picklist_lines_model.dart';
import 'dart:convert';

class PickList {
    PickList({
        required this.id,
        required this.absEntry,
        required this.pickerName,
        required this.ownerCode,
        required this.owner,
        required this.pickDate,
        required this.remarks,
        required this.status,
        required this.objectType,
        required this.lineItemsCount,
        required this.pickListLines,
    });

    final int id;
    final int absEntry;
    final String pickerName;
    final int ownerCode;
    final String owner;
    final DateTime pickDate;
    final String? remarks;
    final dynamic status;
    final int objectType;
    final int lineItemsCount;
    final List<PickListLine> pickListLines;

    factory PickList.fromJson(String str) => PickList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PickList.fromMap(Map<String, dynamic> json) => PickList(
        id: json["id"],
        absEntry: json["absEntry"],
        pickerName: json["pickerName"],
        ownerCode: json["ownerCode"],
        owner: json["owner"],
        pickDate: DateTime.parse(json["pickDate"]),
        remarks: json["remarks"],
        status: json["status"],
        objectType: json["objectType"],
        lineItemsCount: json["lineItemsCount"],
        pickListLines: List<PickListLine>.from(json["pickListLines"].map((x) => PickListLine.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "absEntry": absEntry,
        "pickerName": pickerName,
        "ownerCode": ownerCode,
        "owner": owner,
        "pickDate": "${pickDate.year.toString().padLeft(4, '0')}-${pickDate.month.toString().padLeft(2, '0')}-${pickDate.day.toString().padLeft(2, '0')}",
        "remarks": remarks,
        "status": status,
        "objectType": objectType,
        "lineItemsCount": lineItemsCount,
        "pickListLines": List<dynamic>.from(pickListLines.map((x) => x.toMap())),
    };
}


