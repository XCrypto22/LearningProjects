// To parse this JSON data, do
//
//     final stories = storiesFromJson(jsonString);

import 'dart:convert';

List<Stories> storiesFromJson(String str) =>
    List<Stories>.from(json.decode(str).map((x) => Stories.fromJson(x)));

String storiesToJson(List<Stories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stories {
  Stories({
    required this.id,
    required this.image,
    required this.title,
    required this.uri,
  });

  int id;
  String image;
  String title;
  String uri;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "uri": uri,
      };
}
