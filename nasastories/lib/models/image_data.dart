// To parse this JSON data, do
//
//     final gallery = galleryFromJson(jsonString);

import 'dart:convert';

List<Gallery> galleryFromJson(String str) =>
    List<Gallery>.from(json.decode(str).map((x) => Gallery.fromJson(x)));

String galleryToJson(List<Gallery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gallery {
  Gallery({
    required this.date,
    required this.description,
    required this.image,
    required this.photographer,
    required this.title,
  });

  DateTime date;
  String description;
  String image;
  String photographer;
  String title;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        date: DateTime.parse(json["date"]),
        description: json["description"],
        image: json["image"],
        photographer: json["photographer"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "description": description,
        "image": image,
        "photographer": photographer,
        "title": title,
      };
}
