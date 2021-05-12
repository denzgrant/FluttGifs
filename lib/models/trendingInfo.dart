// To parse this JSON data, do
//
//     final trendingGifs = trendingGifsFromJson(jsonString);
import 'dart:convert';

TrendingGifsModel trendingGifsModelFromJson(String str) =>
    TrendingGifsModel.fromJson(json.decode(str));

String trendingGifsModelToJson(TrendingGifsModel data) =>
    json.encode(data.toJson());

class TrendingGifsModel {
  TrendingGifsModel({
    this.data,
  });

  List<Gifs> data;

  factory TrendingGifsModel.fromJson(Map<String, dynamic> json) =>
      TrendingGifsModel(
        data: List<Gifs>.from(json["data"].map((x) => Gifs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Gifs {
  Gifs({
    this.id,
    this.url,
    this.username,
    this.title,
    this.importDatetime,
    this.trendingDatetime,
  });

  String id;
  String url;
  String username;
  String title;
  DateTime importDatetime;
  DateTime trendingDatetime;

  factory Gifs.fromJson(Map<String, dynamic> json) => Gifs(
        id: json["id"],
        url: json["images"]["original"]["url"],
        username: json["username"],
        title: json["title"],
        importDatetime: DateTime.parse(json["import_datetime"]),
        trendingDatetime: DateTime.parse(json["trending_datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "username": username,
        "title": title,
        "import_datetime": importDatetime.toIso8601String(),
        "trending_datetime": trendingDatetime.toIso8601String(),
      };
}
