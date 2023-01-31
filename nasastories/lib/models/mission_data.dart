// To parse this JSON data, do
//
//     final missions = missionsFromJson(jsonString);

import 'dart:convert';

List<Missions> missionsFromJson(String str) =>
    List<Missions>.from(json.decode(str).map((x) => Missions.fromJson(x)));

String missionsToJson(List<Missions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Missions {
  Missions({
    required this.date,
    required this.details,
    required this.image,
    required this.timeZone,
    required this.title,
  });

  DateTime date;
  String details;
  String image;
  TimeZone timeZone;
  String title;

  factory Missions.fromJson(Map<String, dynamic> json) => Missions(
        date: DateTime.parse(json["date"]),
        details: json["details"],
        image: json["image"],
        timeZone: timeZoneValues.map[json["time_zone"]]!,
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "details": details,
        "image": image,
        "time_zone": timeZoneValues.reverse[timeZone],
        "title": title,
      };
}

enum TimeZone { UTC }

final timeZoneValues = EnumValues({"UTC": TimeZone.UTC});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
