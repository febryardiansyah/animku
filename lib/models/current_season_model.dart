import 'dart:convert';

CurrentSeasonModel currentSeasonFromJson(String res) =>
    CurrentSeasonModel.fromMap(
      json.decode(
        res,
      ) as Map<String, dynamic>,
    );

class CurrentSeasonModel {
  String seasonName;
  int seasonYear;
  List<AnimeList> animeList;

  @override
  String toString() {
    return 'CurrentSeasonModel{seasonName: $seasonName, seasonYear: $seasonYear, animeList: $animeList}';
  }

  CurrentSeasonModel({this.seasonName, this.seasonYear, this.animeList});

  factory CurrentSeasonModel.fromMap(Map<String, dynamic> json) {
    return CurrentSeasonModel(
      seasonName: json['season_name'] as String,
      seasonYear: json['season_year'] as int,
      animeList: List<AnimeList>.from(
        json['anime'].map(
          (item) => AnimeList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class AnimeList {
  String title, imageUrl, synopsis, type, airingStart, source;
  int members, episodes, malId;
  double score;
  List<GenreList> genreList;
  List<Producers> producers;

  AnimeList({
    this.title,
    this.imageUrl,
    this.synopsis,
    this.type,
    this.malId,
    this.airingStart,
    this.episodes,
    this.source,
    this.genreList,
    this.producers,
    this.score,
    this.members,
  });

  factory AnimeList.fromMap(Map<String, dynamic> json) {
    return AnimeList(
      malId: json['mal_id'] as int,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      synopsis: json['synopsis'] as String,
      type: json['type'] as String,
      score: json['score'] as double,
      airingStart: json['airing_start'] as String,
      episodes: json['episodes'] as int,
      members: json['members'] as int,
      genreList: List<GenreList>.from(
        json['genres'].map(
          (item) => GenreList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
      source: json['source'] as String,
      producers: List<Producers>.from(
        json['producers'].map(
          (item) => Producers.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class GenreList {
  String name;

  GenreList({this.name});

  @override
  String toString() {
    return 'GenreList{name: $name,}';
  }

  factory GenreList.fromMap(Map<String, dynamic> json) {
    return GenreList(
      name: json['name'] as String,
    );
  }
}

class Producers {
  String name;

  Producers({this.name});

  factory Producers.fromMap(Map<String, dynamic> json) {
    return Producers(name: json['name'] as String);
  }
}
