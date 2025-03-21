// To parse this JSON data, do
//
//     final movieTrailer = movieTrailerFromJson(jsonString);

import 'dart:convert';

MovieTrailer movieTrailerFromJson(String str) =>
    MovieTrailer.fromJson(json.decode(str));

String movieTrailerToJson(MovieTrailer data) => json.encode(data.toJson());

class MovieTrailer {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  MovieTrailer({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  MovieTrailer copyWith({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    DateTime? publishedAt,
    String? id,
  }) => MovieTrailer(
    iso6391: iso6391 ?? this.iso6391,
    iso31661: iso31661 ?? this.iso31661,
    name: name ?? this.name,
    key: key ?? this.key,
    site: site ?? this.site,
    size: size ?? this.size,
    type: type ?? this.type,
    official: official ?? this.official,
    publishedAt: publishedAt ?? this.publishedAt,
    id: id ?? this.id,
  );

  factory MovieTrailer.fromJson(Map<String, dynamic> json) => MovieTrailer(
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"],
    key: json["key"],
    site: json["site"],
    size: json["size"],
    type: json["type"],
    official: json["official"],
    publishedAt:
        json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "key": key,
    "site": site,
    "size": size,
    "type": type,
    "official": official,
    "published_at": publishedAt?.toIso8601String(),
    "id": id,
  };
}
