import 'dart:convert';

CurrentSeasonModel currentSeasonFromJson(String res) => CurrentSeasonModel.fromMap(json.decode(res));

class CurrentSeasonModel{
  String seasonName;
  int seasonYear;
  List<AnimeList> animeList;

  @override
  String toString() {
    return 'CurrentSeasonModel{seasonName: $seasonName, seasonYear: $seasonYear, animeList: $animeList}';
  }
  CurrentSeasonModel({this.seasonName, this.seasonYear, this.animeList});

  factory CurrentSeasonModel.fromMap(Map<String, dynamic>json){
    return CurrentSeasonModel(
      seasonName: json['season_name'],
      seasonYear: json['season_year'],
      animeList: List<AnimeList>.from(json['anime'].map((item)=>AnimeList.fromMap(item))),

    );
  }
}

class AnimeList{
  String title,imageUrl,synopsis,type,
  airingStart,source;
  int members,episodes,malId;
  var score;
  List<GenreList> genreList;
  List<Producers> producers;

  AnimeList({this.title, this.imageUrl, this.synopsis, this.type,this.malId,
      this.airingStart, this.episodes, this.source, this.genreList, this.producers,this.score,this.members});

  factory AnimeList.fromMap(Map<String,dynamic>json){
    return AnimeList(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      synopsis: json['synopsis'],
      type: json['type'],
      score: json['score'],
      airingStart: json['airing_start'],
      episodes: json['episodes'],
      members: json['members'],
      genreList: List<GenreList>.from(json['genres'].map((item)=>GenreList.fromMap(item))),
      source: json['source'],
      producers: List<Producers>.from(json['producers'].map((item)=>Producers.fromMap(item))),
    );
  }
}

class GenreList{
  String name;

  GenreList({this.name});

  @override
  String toString() {
    return 'GenreList{name: $name,}';
  }
  factory GenreList.fromMap(Map<String,dynamic>json){
    return GenreList(
      name: json['name'],
    );
  }
}

class Producers{
  String name;

  Producers({this.name});

  factory Producers.fromMap(Map<String,dynamic>json){
    return Producers(
      name: json['name']
    );
  }
}