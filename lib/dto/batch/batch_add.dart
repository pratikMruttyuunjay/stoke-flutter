// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


// To parse this JSON data, do
//
//     final batchAdd = batchAddFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final batchAdd = batchAddFromJson(jsonString);

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
    required this.batchTitle,
    required this.batchQty,
  });

  final int batchId;
  final String batchTitle;
  final int batchQty;

  factory BatchAddData.fromJson(Map<String, dynamic> json) => BatchAddData(
    batchId: json["batchId"],
    batchTitle: json["batchTitle"],
    batchQty: json["batchQty"],
  );

  Map<String, dynamic> toJson() => {
    "batchId": batchId,
    "batchTitle": batchTitle,
    "batchQty": batchQty,
  };
}

