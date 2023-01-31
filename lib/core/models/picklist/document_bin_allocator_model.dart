import 'dart:convert';


class DocumentLinesBinAllocation {
    DocumentLinesBinAllocation({
        required this.binAbsEntry,
        required this.binCode,
        required this.quantity,
        required this.allowNegativeQuantity,
        required this.serialAndBatchNumbersBaseLine,
        required this.baseLineNumber,
    });

    final int binAbsEntry;
    final String binCode;
    final double quantity;
    final String allowNegativeQuantity;
    final int serialAndBatchNumbersBaseLine;
    final int baseLineNumber;

    factory DocumentLinesBinAllocation.fromJson(String str) => DocumentLinesBinAllocation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DocumentLinesBinAllocation.fromMap(Map<String, dynamic> json) => DocumentLinesBinAllocation(
        binAbsEntry: json["binAbsEntry"],
        binCode: json["binCode"],
        quantity: json["quantity"],
        allowNegativeQuantity: json["allowNegativeQuantity"],
        serialAndBatchNumbersBaseLine: json["serialAndBatchNumbersBaseLine"],
        baseLineNumber: json["baseLineNumber"],
    );

    Map<String, dynamic> toMap() => {
        "binAbsEntry": binAbsEntry,
        "binCode": binCode,
        "quantity": quantity,
        "allowNegativeQuantity": allowNegativeQuantity,
        "serialAndBatchNumbersBaseLine": serialAndBatchNumbersBaseLine,
        "baseLineNumber": baseLineNumber,
    };
}
