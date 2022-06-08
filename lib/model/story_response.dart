import 'dart:convert';

Stories storiesFromJson(String str) => Stories.fromJson(jsonDecode(str));

String storiesToJson(Stories data) => jsonEncode(data.toJson());

class Stories{

  Stories({
    required this.data
  });

  List<Story> data;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
      data: List<Story>.from(json["data"].map((x) => Story.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Story{
  
  Story({
    required this.id,
    required this.idUser,
    required this.title,
    required this.content,
    required this.image,
    required this.likeCount,
    required this.username,
    required this.name,
    required this.createdAt,
    required this.updatedAt
  });

  int id;
  int idUser;
  String title;
  String content;
  String image;
  int likeCount;
  String username;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id : json['id'],
    idUser: json['id_user'],
    title: json['title'],
    content: json['content'],
    image: json['image'],
    likeCount: json['like_count'],
    username: json['username'],
    name : json['name'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at']
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "id_user" : idUser,
    "title" : title,
    "content" : content,
    "image" : image,
    "like_count" : likeCount,
    "username" : username,
    "name" : name,
    "created_at" : createdAt,
    "updated_at" : updatedAt,
  };

}