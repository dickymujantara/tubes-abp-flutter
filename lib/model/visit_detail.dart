import 'dart:convert';

VisitDetail visitDetailFromJson(String str) =>
    VisitDetail.fromJson(json.decode(str));

String visitDetailToJson(VisitDetail data) => json.encode(data.toJson());

class VisitDetail {
  VisitDetail({
    required this.idUser,
    required this.idTouristAttraction,
    required this.visitDate,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String idUser;
  String idTouristAttraction;
  DateTime visitDate;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory VisitDetail.fromJson(Map<String, dynamic> json) => VisitDetail(
        idUser: json["id_user"],
        idTouristAttraction: json["id_tourist_attraction"],
        visitDate: DateTime.parse(json["visit_date"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "id_tourist_attraction": idTouristAttraction,
        "visit_date":
            "${visitDate.year.toString().padLeft(4, '0')}-${visitDate.month.toString().padLeft(2, '0')}-${visitDate.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
