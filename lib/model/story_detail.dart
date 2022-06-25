import 'dart:convert';

StoryDetail storyDetailFromJson(String str) => StoryDetail.fromJson(json.decode(str));

String storyDetailToJson(StoryDetail data) => json.encode(data.toJson());

class StoryDetail {
    StoryDetail({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory StoryDetail.fromJson(Map<String, dynamic> json) => StoryDetail(
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
        required this.idUser,
        required this.title,
        required this.content,
        required this.image,
        required this.likeCount,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int idUser;
    String title;
    String content;
    String image;
    int likeCount;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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