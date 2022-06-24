import 'package:meta/meta.dart';
import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
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
        required this.accessToken,
        required this.tokenType,
        required this.user,
    });

    String accessToken;
    String tokenType;
    User user;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
    };
}

class User {
    User({
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

    factory User.fromJson(Map<String, dynamic> json) => User(
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
    };
}
