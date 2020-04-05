// To parse this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
    String requestHash;
    bool requestCached;
    int requestCacheExpiry;
    int malId;
    String url;
    String imageUrl;
    String trailerUrl;
    String title;
    dynamic titleEnglish;
    String titleJapanese;
    List<dynamic> titleSynonyms;
    String type;
    String source;
    int episodes;
    String status;
    bool airing;
    Aired aired;
    String duration;
    String rating;
    double score;
    int scoredBy;
    int rank;
    int popularity;
    int members;
    int favorites;
    String synopsis;
    dynamic background;
    String premiered;
    String broadcast;
    Related related;
    List<Genre> producers;
    List<Genre> licensors;
    List<Genre> studios;
    List<Genre> genres;
    List<String> openingThemes;
    List<String> endingThemes;

    Details({
        this.requestHash,
        this.requestCached,
        this.requestCacheExpiry,
        this.malId,
        this.url,
        this.imageUrl,
        this.trailerUrl,
        this.title,
        this.titleEnglish,
        this.titleJapanese,
        this.titleSynonyms,
        this.type,
        this.source,
        this.episodes,
        this.status,
        this.airing,
        this.aired,
        this.duration,
        this.rating,
        this.score,
        this.scoredBy,
        this.rank,
        this.popularity,
        this.members,
        this.favorites,
        this.synopsis,
        this.background,
        this.premiered,
        this.broadcast,
        this.related,
        this.producers,
        this.licensors,
        this.studios,
        this.genres,
        this.openingThemes,
        this.endingThemes,
    });

    factory Details.fromJson(Map<String, dynamic> json) => new Details(
        requestHash: json["request_hash"],
        requestCached: json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"],
        malId: json["mal_id"],
        url: json["url"],
        imageUrl: json["image_url"],
        trailerUrl: json["trailer_url"],
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: new List<dynamic>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: Aired.fromJson(json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"].toDouble(),
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        premiered: json["premiered"],
        broadcast: json["broadcast"],
        related: Related.fromJson(json["related"]),
        producers: new List<Genre>.from(json["producers"].map((x) => Genre.fromJson(x))),
        licensors: new List<Genre>.from(json["licensors"].map((x) => Genre.fromJson(x))),
        studios: new List<Genre>.from(json["studios"].map((x) => Genre.fromJson(x))),
        genres: new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        openingThemes: new List<String>.from(json["opening_themes"].map((x) => x)),
        endingThemes: new List<String>.from(json["ending_themes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "request_hash": requestHash,
        "request_cached": requestCached,
        "request_cache_expiry": requestCacheExpiry,
        "mal_id": malId,
        "url": url,
        "image_url": imageUrl,
        "trailer_url": trailerUrl,
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": new List<dynamic>.from(titleSynonyms.map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired.toJson(),
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "premiered": premiered,
        "broadcast": broadcast,
        "related": related.toJson(),
        "producers": new List<dynamic>.from(producers.map((x) => x.toJson())),
        "licensors": new List<dynamic>.from(licensors.map((x) => x.toJson())),
        "studios": new List<dynamic>.from(studios.map((x) => x.toJson())),
        "genres": new List<dynamic>.from(genres.map((x) => x.toJson())),
        "opening_themes": new List<dynamic>.from(openingThemes.map((x) => x)),
        "ending_themes": new List<dynamic>.from(endingThemes.map((x) => x)),
    };
}

class Aired {
    DateTime from;
    dynamic to;
    Prop prop;
    String string;

    Aired({
        this.from,
        this.to,
        this.prop,
        this.string,
    });

    factory Aired.fromJson(Map<String, dynamic> json) => new Aired(
        from: DateTime.parse(json["from"]),
        to: json["to"],
        prop: Prop.fromJson(json["prop"]),
        string: json["string"],
    );

    Map<String, dynamic> toJson() => {
        "from": from.toIso8601String(),
        "to": to,
        "prop": prop.toJson(),
        "string": string,
    };
}

class Prop {
    From from;
    From to;

    Prop({
        this.from,
        this.to,
    });

    factory Prop.fromJson(Map<String, dynamic> json) => new Prop(
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
    );

    Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "to": to.toJson(),
    };
}

class From {
    int day;
    int month;
    int year;

    From({
        this.day,
        this.month,
        this.year,
    });

    factory From.fromJson(Map<String, dynamic> json) => new From(
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
    );

    Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
    };
}

class Genre {
    int malId;
    String type;
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
        type: json["type"],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": type,
        "name": name,
        "url": url,
    };
}

class Related {
    List<Genre> adaptation;

    Related({
        this.adaptation,
    });

    factory Related.fromJson(Map<String, dynamic> json) => new Related(
        adaptation: new List<Genre>.from(json["Adaptation"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Adaptation": new List<dynamic>.from(adaptation.map((x) => x.toJson())),
    };
}
