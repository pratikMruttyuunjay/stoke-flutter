// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BatchList batchListFromJson(String str) => BatchList.fromJson(json.decode(str));

String batchListToJson(BatchList data) => json.encode(data.toJson());

class BatchList {
  BatchList({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final List<BatchListData> data;

  factory BatchList.fromJson(Map<String, dynamic> json) => BatchList(
    message: json["message"],
    status: json["status"],
    data: List<BatchListData>.from(json["data"].map((x) => BatchListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BatchListData {
  BatchListData({
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.createdAt,
    required this.productId,
    required this.status,
    required this.qty,
  });

  final String id;
  final String title;
  final String updatedAt;
  final String createdAt;
  final String productId;
  final String status;
  final String qty;

  factory BatchListData.fromJson(Map<String, dynamic> json) => BatchListData(
    id: json["id"],
    title: json["title"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
    productId: json["product_id"],
    status: json["status"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "product_id": productId,
    "status": status,
    "qty": qty,
  };
}
