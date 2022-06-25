import 'dart:convert';

UserUpdateResponse userUpdateResponseFromJson(String str) => UserUpdateResponse.fromJson(json.decode(str));

String userUpdateResponseToJson(UserUpdateResponse data) => json.encode(data.toJson());

class UserUpdateResponse {
    UserUpdateResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory UserUpdateResponse.fromJson(Map<String, dynamic> json) => UserUpdateResponse(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.username,
        required this.name,
        required this.address,
        required this.email,
        required this.role,
        required this.hasVerifiedEmail,
        required this.emailVerificationToken,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.profile,
    });

    int id;
    String username;
    String name;
    String address;
    String email;
    String role;
    int hasVerifiedEmail;
    dynamic emailVerificationToken;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    Profile profile;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        role: json["role"],
        hasVerifiedEmail: json["has_verified_email"],
        emailVerificationToken: json["email_verification_token"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profile: Profile.fromJson(json["profile"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "address": address,
        "email": email,
        "role": role,
        "has_verified_email": hasVerifiedEmail,
        "email_verification_token": emailVerificationToken,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile": profile.toJson(),
    };
}

class Profile {
    Profile({
        required this.id,
        required this.idUser,
        required this.phoneNumber,
        required this.address,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int idUser;
    String phoneNumber;
    String address;
    DateTime createdAt;
    DateTime updatedAt;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        idUser: json["id_user"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "phone_number": phoneNumber,
        "address": address,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
