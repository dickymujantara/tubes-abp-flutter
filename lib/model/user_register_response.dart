import 'dart:convert';

UserRegisterResponse userRegisterResponseFromJson(String str) => UserRegisterResponse.fromJson(json.decode(str));

String userRegisterResponseToJson(UserRegisterResponse data) => json.encode(data.toJson());

class UserRegisterResponse {
    UserRegisterResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory UserRegisterResponse.fromJson(Map<String, dynamic> json) => UserRegisterResponse(
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
        required this.username,
        required this.name,
        required this.email,
        required this.address,
        required this.role,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    String username;
    String name;
    String email;
    String address;
    String role;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "email": email,
        "address": address,
        "role": role,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
