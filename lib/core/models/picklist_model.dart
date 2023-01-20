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
    final dynamic remarks;
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
        "objectType": objectType,
        "lineItemsCount": lineItemsCount,
        "pickListLines": List<dynamic>.from(pickListLines.map((x) => x.toMap())),
    };
}

class PickListLine {
    PickListLine({
        required this.absEntry,
        required this.lineNumber,
        required this.orderEntry,
        required this.orderDocNum,
        required this.orderDocDate,
        required this.customerCode,
        required this.customerName,
        required this.orderRowId,
        required this.pickedQuantity,
        required this.releasedQuantity,
        required this.previouslyReleasedQuantity,
        required this.baseObjectType,
        required this.serialNumbers,
        required this.batchNumbers,
        required this.documentLinesBinAllocation,
    });

    final int absEntry;
    final int lineNumber;
    final int orderEntry;
    final int orderDocNum;
    final DateTime orderDocDate;
    final String customerCode;
    final String customerName;
    final int orderRowId;
    final int pickedQuantity;
    final int releasedQuantity;
    final int previouslyReleasedQuantity;
    final int baseObjectType;
    final List<dynamic> serialNumbers;
    final List<dynamic> batchNumbers;
    final dynamic documentLinesBinAllocation;

    factory PickListLine.fromJson(String str) => PickListLine.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PickListLine.fromMap(Map<String, dynamic> json) => PickListLine(
        absEntry: json["absEntry"],
        lineNumber: json["lineNumber"],
        orderEntry: json["orderEntry"],
        orderDocNum: json["orderDocNum"],
        orderDocDate: DateTime.parse(json["orderDocDate"]),
        customerCode: json["customerCode"],
        customerName: json["customerName"],
        orderRowId: json["orderRowID"],
        pickedQuantity: json["pickedQuantity"],
        releasedQuantity: json["releasedQuantity"],
        previouslyReleasedQuantity: json["previouslyReleasedQuantity"],
        baseObjectType: json["baseObjectType"],
        serialNumbers: List<dynamic>.from(json["serialNumbers"].map((x) => x)),
        batchNumbers: List<dynamic>.from(json["batchNumbers"].map((x) => x)),
        documentLinesBinAllocation: json["documentLinesBinAllocation"],
    );

    Map<String, dynamic> toMap() => {
        "absEntry": absEntry,
        "lineNumber": lineNumber,
        "orderEntry": orderEntry,
        "orderDocNum": orderDocNum,
        "orderDocDate": "${orderDocDate.year.toString().padLeft(4, '0')}-${orderDocDate.month.toString().padLeft(2, '0')}-${orderDocDate.day.toString().padLeft(2, '0')}",
        "customerCode": customerCode,
        "customerName": customerName,
        "orderRowID": orderRowId,
        "pickedQuantity": pickedQuantity,
        "releasedQuantity": releasedQuantity,
        "previouslyReleasedQuantity": previouslyReleasedQuantity,
        "baseObjectType": baseObjectType,
        "serialNumbers": List<dynamic>.from(serialNumbers.map((x) => x)),
        "batchNumbers": List<dynamic>.from(batchNumbers.map((x) => x)),
        "documentLinesBinAllocation": documentLinesBinAllocation,
    };
}
