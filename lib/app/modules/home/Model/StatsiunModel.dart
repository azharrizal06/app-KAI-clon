import 'dart:convert';

class StatsiunModel {
  final String? message;
  final List<DataSatasiun>? data;

  StatsiunModel({this.message, this.data});

  factory StatsiunModel.fromJson(String str) =>
      StatsiunModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatsiunModel.fromMap(Map<String, dynamic> json) => StatsiunModel(
    message: json["message"],
    data:
        json["data"] == null
            ? []
            : List<DataSatasiun>.from(
              json["data"]!.map((x) => DataSatasiun.fromMap(x)),
            ),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataSatasiun {
  final int? id;
  final String? name;
  final String? code;
  final String? city;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DataSatasiun({
    this.id,
    this.name,
    this.code,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

  factory DataSatasiun.fromJson(String str) =>
      DataSatasiun.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataSatasiun.fromMap(Map<String, dynamic> json) => DataSatasiun(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    city: json["city"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "code": code,
    "city": city,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
