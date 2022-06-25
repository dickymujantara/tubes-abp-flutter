import 'dart:convert';

StoryResponse storyResponseFromJson(String str) => StoryResponse.fromJson(json.decode(str));

String storyResponseToJson(StoryResponse data) => json.encode(data.toJson());

class StoryResponse {
    StoryResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    List<Datum> data;

    factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
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
        required this.username,
        required this.name,
        required this.id,
        required this.idUser,
        required this.title,
        required this.content,
        required this.image,
        required this.likeCount,
        required this.createdAt,
        required this.updatedAt,
    });

    String username;
    String name;
    int id;
    int idUser;
    String title;
    String content;
    String image;
    int likeCount;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        username: json["username"],
        name: json["name"],
        id: json["id"],
        idUser: json["id_user"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        likeCount: json["like_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "id": id,
        "id_user": idUser,
        "title": title,
        "content": content,
        "image": image,
        "like_count": likeCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
