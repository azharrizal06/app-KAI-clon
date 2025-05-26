import 'dart:convert';

class JadawalModel {
  final List<DataJadawal>? data;

  JadawalModel({this.data});

  factory JadawalModel.fromJson(String str) =>
      JadawalModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JadawalModel.fromMap(Map<String, dynamic> json) => JadawalModel(
    data:
        json["data"] == null
            ? []
            : List<DataJadawal>.from(
              json["data"]!.map((x) => DataJadawal.fromMap(x)),
            ),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataJadawal {
  final int? id;
  final int? trainId;
  final int? originStationId;
  final int? destinationStationId;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Train? train;
  final NStation? originStation;
  final NStation? destinationStation;

  DataJadawal({
    this.id,
    this.trainId,
    this.originStationId,
    this.destinationStationId,
    this.departureTime,
    this.arrivalTime,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.train,
    this.originStation,
    this.destinationStation,
  });

  factory DataJadawal.fromJson(String str) =>
      DataJadawal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataJadawal.fromMap(Map<String, dynamic> json) => DataJadawal(
    id: json["id"],
    trainId: json["train_id"],
    originStationId: json["origin_station_id"],
    destinationStationId: json["destination_station_id"],
    departureTime:
        json["departure_time"] == null
            ? null
            : DateTime.parse(json["departure_time"]),
    arrivalTime:
        json["arrival_time"] == null
            ? null
            : DateTime.parse(json["arrival_time"]),
    price: json["price"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    train: json["train"] == null ? null : Train.fromMap(json["train"]),
    originStation:
        json["origin_station"] == null
            ? null
            : NStation.fromMap(json["origin_station"]),
    destinationStation:
        json["destination_station"] == null
            ? null
            : NStation.fromMap(json["destination_station"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "train_id": trainId,
    "origin_station_id": originStationId,
    "destination_station_id": destinationStationId,
    "departure_time": departureTime?.toIso8601String(),
    "arrival_time": arrivalTime?.toIso8601String(),
    "price": price,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "train": train?.toMap(),
    "origin_station": originStation?.toMap(),
    "destination_station": destinationStation?.toMap(),
  };
}

class NStation {
  final int? id;
  final String? name;
  final String? code;
  final String? city;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NStation({
    this.id,
    this.name,
    this.code,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

  factory NStation.fromJson(String str) => NStation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NStation.fromMap(Map<String, dynamic> json) => NStation(
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

class Train {
  final int? id;
  final String? name;
  final String? code;
  final int? seatCapacity;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Train({
    this.id,
    this.name,
    this.code,
    this.seatCapacity,
    this.createdAt,
    this.updatedAt,
  });

  factory Train.fromJson(String str) => Train.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Train.fromMap(Map<String, dynamic> json) => Train(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    seatCapacity: json["seat_capacity"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "code": code,
    "seat_capacity": seatCapacity,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
