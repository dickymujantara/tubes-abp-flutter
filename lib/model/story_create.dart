import 'dart:convert';

StoryCreate storyCreateFromJson(String str) => StoryCreate.fromJson(json.decode(str));

String storyCreateToJson(StoryCreate data) => json.encode(data.toJson());

class StoryCreate {
    StoryCreate({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory StoryCreate.fromJson(Map<String, dynamic> json) => StoryCreate(
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
        required this.idUser,
        required this.title,
        required this.content,
        required this.image,
        required this.likeCount,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    String idUser;
    String title;
    String content;
    String image;
    String likeCount;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUser: json["id_user"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        likeCount: json["like_count"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "title": title,
        "content": content,
        "image": image,
        "like_count": likeCount,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
