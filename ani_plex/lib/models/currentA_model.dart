// To parse this JSON data, do
//
//  final currentSeason = currentSeasonFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

CurrentSeason currentSeasonFromJson(String str) => CurrentSeason.fromJson(json.decode(str));

String currentSeasonToJson(CurrentSeason data) => json.encode(data.toJson());

class CurrentSeason {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  String seasonName;
  int seasonYear;
  List<Anime> anime;

  CurrentSeason({
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.seasonName,
    this.seasonYear,
    this.anime,
  });

  factory CurrentSeason.fromJson(Map<String, dynamic> json) => new CurrentSeason(
    requestHash: json["request_hash"],
    requestCached: json["request_cached"],
    requestCacheExpiry: json["request_cache_expiry"],
    seasonName: json["season_name"],
    seasonYear: json["season_year"],
    anime: new List<Anime>.from(json["anime"].map((x) => Anime.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "request_hash": requestHash,
    "request_cached": requestCached,
    "request_cache_expiry": requestCacheExpiry,
    "season_name": seasonName,
    "season_year": seasonYear,
    "anime": new List<dynamic>.from(anime.map((x) => x.toJson())),
  };
}

class Anime {
  int malId;
  String url;
  String title;
  String imageUrl;
  String synopsis;
  AnimeType type;
  DateTime airingStart;
  int episodes;
  int members;
  List<Genre> genres;
  Source source;
  List<Genre> producers;
  double score;
  List<String> licensors;
  bool r18;
  bool kids;
  bool continuing;

  Anime({
    this.malId,
    this.url,
    this.title,
    this.imageUrl,
    this.synopsis,
    this.type,
    this.airingStart,
    this.episodes,
    this.members,
    this.genres,
    this.source,
    this.producers,
    this.score,
    this.licensors,
    this.r18,
    this.kids,
    this.continuing,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => new Anime(
    malId: json["mal_id"],
    url: json["url"],
    title: json["title"],
    imageUrl: json["image_url"],
    synopsis: json["synopsis"],
    type: animeTypeValues.map[json["type"]],
    airingStart: json["airing_start"] == null ? null : DateTime.parse(json["airing_start"]),
    episodes: json["episodes"] == null ? null : json["episodes"],
    members: json["members"],
    genres: new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    source: sourceValues.map[json["source"]],
    producers: new List<Genre>.from(json["producers"].map((x) => Genre.fromJson(x))),
    score: json["score"] == null ? null : json["score"].toDouble(),
    licensors: new List<String>.from(json["licensors"].map((x) => x)),
    r18: json["r18"],
    kids: json["kids"],
    continuing: json["continuing"],
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "url": url,
    "title": title,
    "image_url": imageUrl,
    "synopsis": synopsis,
    "type": animeTypeValues.reverse[type],
    "airing_start": airingStart == null ? null : airingStart.toIso8601String(),
    "episodes": episodes == null ? null : episodes,
    "members": members,
    "genres": new List<dynamic>.from(genres.map((x) => x.toJson())),
    "source": sourceValues.reverse[source],
    "producers": new List<dynamic>.from(producers.map((x) => x.toJson())),
    "score": score == null ? null : score,
    "licensors": new List<dynamic>.from(licensors.map((x) => x)),
    "r18": r18,
    "kids": kids,
    "continuing": continuing,
  };
}

class Genre {
  int malId;
  GenreType type;
  String name;
  String url;

  Genre({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
    malId: json["mal_id"],
    type: genreTypeValues.map[json["type"]],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "type": genreTypeValues.reverse[type],
    "name": name,
    "url": url,
  };
}

enum GenreType { ANIME }

final genreTypeValues = new EnumValues({
  "anime": GenreType.ANIME
});

enum Source { MANGA, LIGHT_NOVEL, WEB_MANGA, ORIGINAL, THE_4_KOMA_MANGA, GAME, OTHER, CARD_GAME, VISUAL_NOVEL, PICTURE_BOOK, EMPTY, NOVEL }

final sourceValues = new EnumValues({
  "Card game": Source.CARD_GAME,
  "-": Source.EMPTY,
  "Game": Source.GAME,
  "Light novel": Source.LIGHT_NOVEL,
  "Manga": Source.MANGA,
  "Novel": Source.NOVEL,
  "Original": Source.ORIGINAL,
  "Other": Source.OTHER,
  "Picture book": Source.PICTURE_BOOK,
  "4-koma manga": Source.THE_4_KOMA_MANGA,
  "Visual novel": Source.VISUAL_NOVEL,
  "Web manga": Source.WEB_MANGA
});

enum AnimeType { TV, ONA, OVA, MOVIE, SPECIAL }

final animeTypeValues = new EnumValues({
  "Movie": AnimeType.MOVIE,
  "ONA": AnimeType.ONA,
  "OVA": AnimeType.OVA,
  "Special": AnimeType.SPECIAL,
  "TV": AnimeType.TV
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}


