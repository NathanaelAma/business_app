import 'dart:convert';

class SerialNumber {
    SerialNumber({
        this.manufacturerSerialNumber,
        this.internalSerialNumber,
        this.expiryDate,
        this.manufactureDate,
        this.receptionDate,
        this.warrantyStart,
        this.warrantyEnd,
        this.location,
        this.notes,
        this.batchId,
        this.systemSerialNumber,
        this.baseLineNumber,
        this.quantity,
        this.itemCode,
    });

    final String? manufacturerSerialNumber;
    final String? internalSerialNumber;
    final dynamic expiryDate;
    final dynamic manufactureDate;
    final DateTime? receptionDate;
    final dynamic warrantyStart;
    final dynamic warrantyEnd;
    final String? location;
    final String? notes;
    final String? batchId;
    final int? systemSerialNumber;
    final int? baseLineNumber;
    final double? quantity;
    final String? itemCode;

    factory SerialNumber.fromJson(String str) => SerialNumber.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SerialNumber.fromMap(Map<String, dynamic> json) => SerialNumber(
        manufacturerSerialNumber: json["manufacturerSerialNumber"],
        internalSerialNumber: json["internalSerialNumber"],
        expiryDate: json["expiryDate"],
        manufactureDate: json["manufactureDate"],
        receptionDate: json["receptionDate"] == null ? null : DateTime.parse(json["receptionDate"]),
        warrantyStart: json["warrantyStart"],
        warrantyEnd: json["warrantyEnd"],
        location: json["location"],
        notes: json["notes"],
        batchId: json["batchID"],
        systemSerialNumber: json["systemSerialNumber"],
        baseLineNumber: json["baseLineNumber"],
        quantity: json["quantity"],
        itemCode: json["itemCode"],
    );

    Map<String, dynamic> toMap() => {
        "manufacturerSerialNumber": manufacturerSerialNumber,
        "internalSerialNumber": internalSerialNumber,
        "expiryDate": expiryDate,
        "manufactureDate": manufactureDate,
        "receptionDate": "${receptionDate!.year.toString().padLeft(4, '0')}-${receptionDate!.month.toString().padLeft(2, '0')}-${receptionDate!.day.toString().padLeft(2, '0')}",
        "warrantyStart": warrantyStart,
        "warrantyEnd": warrantyEnd,
        "location": location,
        "notes": notes,
        "batchID": batchId,
        "systemSerialNumber": systemSerialNumber,
        "baseLineNumber": baseLineNumber,
        "quantity": quantity,
        "itemCode": itemCode,
    };
}