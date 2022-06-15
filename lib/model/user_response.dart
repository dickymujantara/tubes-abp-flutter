import 'dart:convert';

UserResponse userFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse{
  UserResponse({
    this.code,
    this.message,
    this.data
  });

  int? code;
  String? message;
  UserLoginResponse? data;

  factory UserResponse.fromJson(Map<String, dynamic> data) =>  UserResponse(
    code: data["code"],
    message: data["message"],
    data: data["data"]
  );

  Map<String, dynamic> toJson() => {
    "code" : code,
    "message" : message,
    "data" : data,
  };
}

class UserLoginResponse{
  UserLoginResponse({
    this.token,
    this.token_type,
    this.user
  });

  String? token;
  String? token_type;
  UserData? user;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>  UserLoginResponse(
    token: json["access_token"],
    token_type: json["token_type"],
    user: json["user"]
  );

  Map<String, dynamic> toJson() => {
    "token" : token,
    "token_type" : token_type,
    "user" : user,
  };

}

class UserData{
  UserData({
    this.id,
    this.username,
    this.name,
    this.role,
    this.address,
    this.email
  });

  int? id;
  String? username;
  String? name;
  String? address;
  String? email;
  String? role;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    address: json["address"],
    email: json["email"],
    role: json["role"]
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "username" : username,
    "name" : name,
    "address" : address,
    "email" : email,
    "role" : role
  };

}