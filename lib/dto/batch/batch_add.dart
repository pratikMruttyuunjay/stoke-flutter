// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BatchAdd batchAddFromJson(String str) => BatchAdd.fromJson(json.decode(str));

String batchAddToJson(BatchAdd data) => json.encode(data.toJson());

class BatchAdd {
  BatchAdd({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final BatchAddData data;

  factory BatchAdd.fromJson(Map<String, dynamic> json) => BatchAdd(
    message: json["message"],
    status: json["status"],
    data: BatchAddData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class BatchAddData {
  BatchAddData({
    required this.batchId,
    required this.batchQty,
    required this.batchTitle,
  });

  final String batchId;
  final String batchQty;
  final String batchTitle;

  factory BatchAddData.fromJson(Map<String, dynamic> json) => BatchAddData(
    batchId: json["batchId"],
    batchQty: json["batchQty"],
    batchTitle: json["batchTitle"],
  );

  Map<String, dynamic> toJson() => {
    "batchId": batchId,
    "batchQty": batchQty,
    "batchTitle": batchTitle,
  };
}
