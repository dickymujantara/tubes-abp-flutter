// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Attraction> attractionFromJson(String str) =>
    List<Attraction>.from(json.decode(str).map((x) => Attraction.fromJson(x)));

String attractionToJson(List<Attraction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Attraction {
  Attraction({
    required this.id,
    required this.name,
    required this.image,
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
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.imageurl,
    required this.openclose,
  });

  int id;
  String name;
  String image;
  String address;
  int idOpenClose;
  String phone;
  String emailContact;
  String websiteInformation;
  String ticketPrice;
  int reviewFiveStar;
  int reviewFourStar;
  int reviewThreeStar;
  int reviewTwoStar;
  int reviewOneStar;
  dynamic fullReview;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  double rating;
  String imageurl;
  List<Openclose> openclose;

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        id: json["id"],
        name: json["name"],
        image: json["image"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rating: json["rating"].toDouble(),
        imageurl: json["imageurl"],
        openclose: List<Openclose>.from(
            json["openclose"].map((x) => Openclose.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rating": rating,
        "imageurl": imageurl,
        "openclose": List<dynamic>.from(openclose.map((x) => x.toJson())),
      };
}

class Openclose {
  Openclose({
    required this.id,
    required this.idTouristAttraction,
    required this.day,
    required this.open,
    required this.close,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int idTouristAttraction;
  String day;
  String open;
  String close;
  DateTime createdAt;
  DateTime updatedAt;

  factory Openclose.fromJson(Map<String, dynamic> json) => Openclose(
        id: json["id"],
        idTouristAttraction: json["id_tourist_attraction"],
        day: json["day"],
        open: json["open"],
        close: json["close"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tourist_attraction": idTouristAttraction,
        "day": day,
        "open": open,
        "close": close,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
