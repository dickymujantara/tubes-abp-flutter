import 'dart:convert';

VisitResponse visitResponseFromJson(String str) =>
    VisitResponse.fromJson(json.decode(str));

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
    required this.name,
    required this.address,
    required this.idOpenClose,
    required this.phone,
    required this.emailContact,
    required this.websiteInformation,
    required this.ticketPrice,
    required this.reviewFiveStar,
    required this.reviewFourStar,
    required this.reviewThreeStar,
    required this.reviewTwoStar,
    required this.reviewOneStar,
    required this.fullReview,
    required this.createdBy,
    required this.updatedBy,
    required this.image,
  });

  int id;
  int idUser;
  int idTouristAttraction;
  DateTime visitDate;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String address;
  dynamic idOpenClose;
  String phone;
  String emailContact;
  String websiteInformation;
  String ticketPrice;
  dynamic reviewFiveStar;
  dynamic reviewFourStar;
  dynamic reviewThreeStar;
  dynamic reviewTwoStar;
  dynamic reviewOneStar;
  dynamic fullReview;
  dynamic createdBy;
  dynamic updatedBy;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idUser: json["id_user"],
        idTouristAttraction: json["id_tourist_attraction"],
        visitDate: DateTime.parse(json["visit_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        address: json["address"],
        idOpenClose: json["id_open_close"],
        phone: json["phone"],
        emailContact: json["email_contact"],
        websiteInformation: json["website_information"],
        ticketPrice: json["ticket_price"],
        reviewFiveStar: json["review_five_star"],
        reviewFourStar: json["review_four_star"],
        reviewThreeStar: json["review_three_star"],
        reviewTwoStar: json["review_two_star"],
        reviewOneStar: json["review_one_star"],
        fullReview: json["full_review"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_tourist_attraction": idTouristAttraction,
        "visit_date":
            "${visitDate.year.toString().padLeft(4, '0')}-${visitDate.month.toString().padLeft(2, '0')}-${visitDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "address": address,
        "id_open_close": idOpenClose,
        "phone": phone,
        "email_contact": emailContact,
        "website_information": websiteInformation,
        "ticket_price": ticketPrice,
        "review_five_star": reviewFiveStar,
        "review_four_star": reviewFourStar,
        "review_three_star": reviewThreeStar,
        "review_two_star": reviewTwoStar,
        "review_one_star": reviewOneStar,
        "full_review": fullReview,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "image": image,
      };
}
