// To parse this JSON data, do
//
//     final touristAttractionResponse = touristAttractionResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TouristAttractionResponse touristAttractionResponseFromJson(String str) => TouristAttractionResponse.fromJson(json.decode(str));

String touristAttractionResponseToJson(TouristAttractionResponse data) => json.encode(data.toJson());

class TouristAttractionResponse {
    TouristAttractionResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    List<Datum> data;

    factory TouristAttractionResponse.fromJson(Map<String, dynamic> json) => TouristAttractionResponse(
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
        required this.createdAt,
        required this.updatedAt,
        required this.image,
        required this.rating,
        required this.imageurl,
        required this.openclose,
    });

    int id;
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
    DateTime createdAt;
    DateTime updatedAt;
    String image;
    String rating;
    String imageurl;
    List<Openclose> openclose;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        rating: json["rating"],
        imageurl: json["imageurl"],
        openclose: List<Openclose>.from(json["openclose"].map((x) => Openclose.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
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
        required this.createdAt,
        required this.updatedAt,
        required this.close,
    });

    int id;
    int idTouristAttraction;
    String day;
    String open;
    DateTime createdAt;
    DateTime updatedAt;
    String close;

    factory Openclose.fromJson(Map<String, dynamic> json) => Openclose(
        id: json["id"],
        idTouristAttraction: json["id_tourist_attraction"],
        day: json["day"],
        open: json["open"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        close: json["close"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_tourist_attraction": idTouristAttraction,
        "day": day,
        "open": open,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "close": close,
    };
}
