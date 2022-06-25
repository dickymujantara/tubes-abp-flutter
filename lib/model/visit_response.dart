// To parse this JSON data, do
//
//     final visitResponse = visitResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VisitResponse visitResponseFromJson(String str) => VisitResponse.fromJson(json.decode(str));

String visitResponseToJson(VisitResponse data) => json.encode(data.toJson());

class VisitResponse {
    VisitResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    List<Datum> data;

    factory VisitResponse.fromJson(Map<String, dynamic> json) => VisitResponse(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.idUser,
        required this.idTouristAttraction,
        required this.visitDate,
        required this.createdAt,
        required this.updatedAt,
        required this.fullname,
        required this.placeName,
        required this.address,
        required this.image,
    });

    int id;
    int idUser;
    int idTouristAttraction;
    DateTime visitDate;
    DateTime createdAt;
    DateTime updatedAt;
    String fullname;
    String placeName;
    String address;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idUser: json["id_user"],
        idTouristAttraction: json["id_tourist_attraction"],
        visitDate: DateTime.parse(json["visit_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fullname: json["fullname"],
        placeName: json["placeName"],
        address: json["address"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_tourist_attraction": idTouristAttraction,
        "visit_date": "${visitDate.year.toString().padLeft(4, '0')}-${visitDate.month.toString().padLeft(2, '0')}-${visitDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "fullname": fullname,
        "placeName": placeName,
        "address": address,
        "image": image,
    };
}
