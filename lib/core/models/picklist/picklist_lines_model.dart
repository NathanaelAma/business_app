import 'dart:convert';

import 'package:business_app/core/models/picklist/document_bin_allocator_model.dart';
import 'package:business_app/core/models/picklist/serial_number_model.dart';

class PickListLine {
    PickListLine({
        this.absEntry,
        this.lineNumber,
        required this.orderEntry,
        this.orderDocNum,
        this.orderDocDate,
        this.orderDocDueDate,
        required this.customerCode,
        required this.customerName,
        this.orderRowId,
        required this.itemCode,
        required this.itemName,
        this.whseCode,
        this.pickedQuantity,
        this.pickStatus,
        this.releasedQuantity,
        this.previouslyReleasedQuantity,
        this.baseObjectType,
        this.serialNumbers,
        this.batchNumbers,
        this.documentLinesBinAllocations,
        this.batch,
        this.serial,
    });

    final int? absEntry;
    final int? lineNumber;
    final int orderEntry;
    final int? orderDocNum;
    final DateTime? orderDocDate;
    final DateTime? orderDocDueDate;
    final String customerCode;
    final String customerName;
    final int? orderRowId;
    final String itemCode;
    final String itemName;
    final String? whseCode;
    final double? pickedQuantity;
    final String? pickStatus;
    final double? releasedQuantity;
    final double? previouslyReleasedQuantity;
    final int? baseObjectType;
    final List<SerialNumber>? serialNumbers;
    final List<dynamic>? batchNumbers;
    final List<DocumentLinesBinAllocation>? documentLinesBinAllocations;
    final bool? batch;
    final bool? serial;

    factory PickListLine.fromJson(String str) => PickListLine.fromMap(json.decode(str));

  get pickListLines => null;

    String toJson() => json.encode(toMap());

    factory PickListLine.fromMap(Map<String, dynamic> json) => PickListLine(
        absEntry: json["absEntry"],
        lineNumber: json["lineNumber"],
        orderEntry: json["orderEntry"],
        orderDocNum: json["orderDocNum"],
        orderDocDate: json["orderDocDate"] == null ? null : DateTime.parse(json["orderDocDate"]),
        orderDocDueDate: json["orderDocDueDate"] == null ? null : DateTime.parse(json["orderDocDueDate"]),
        customerCode: json["customerCode"],
        customerName: json["customerName"],
        orderRowId: json["orderRowID"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        whseCode: json["whseCode"],
        pickedQuantity: json["pickedQuantity"],
        pickStatus: json["pickStatus"],
        releasedQuantity: json["releasedQuantity"],
        previouslyReleasedQuantity: json["previouslyReleasedQuantity"],
        baseObjectType: json["baseObjectType"],
        serialNumbers: json["serialNumbers"] == null ? [] : List<SerialNumber>.from(json["serialNumbers"]!.map((x) => SerialNumber.fromMap(x))),
        batchNumbers: json["batchNumbers"] == null ? [] : List<dynamic>.from(json["batchNumbers"]!.map((x) => x)),
        documentLinesBinAllocations: json["documentLinesBinAllocations"] == null ? [] : List<DocumentLinesBinAllocation>.from(json["documentLinesBinAllocations"]!.map((x) => DocumentLinesBinAllocation.fromMap(x))),
        batch: json["batch"],
        serial: json["serial"],
    );

    Map<String, dynamic> toMap() => {
        "absEntry": absEntry,
        "lineNumber": lineNumber,
        "orderEntry": orderEntry,
        "orderDocNum": orderDocNum,
        "orderDocDate": "${orderDocDate!.year.toString().padLeft(4, '0')}-${orderDocDate!.month.toString().padLeft(2, '0')}-${orderDocDate!.day.toString().padLeft(2, '0')}",
        "orderDocDueDate": "${orderDocDueDate!.year.toString().padLeft(4, '0')}-${orderDocDueDate!.month.toString().padLeft(2, '0')}-${orderDocDueDate!.day.toString().padLeft(2, '0')}",
        "customerCode": customerCode,
        "customerName": customerName,
        "orderRowID": orderRowId,
        "itemCode": itemCode,
        "itemName": itemName,
        "whseCode": whseCode,
        "pickedQuantity": pickedQuantity,
        "pickStatus": pickStatus,
        "releasedQuantity": releasedQuantity,
        "previouslyReleasedQuantity": previouslyReleasedQuantity,
        "baseObjectType": baseObjectType,
        "serialNumbers": serialNumbers == null ? [] : List<dynamic>.from(serialNumbers!.map((x) => x.toMap())),
        "batchNumbers": batchNumbers == null ? [] : List<dynamic>.from(batchNumbers!.map((x) => x)),
        "documentLinesBinAllocations": documentLinesBinAllocations == null ? [] : List<dynamic>.from(documentLinesBinAllocations!.map((x) => x.toMap())),
        "batch": batch,
        "serial": serial,
    };
}
