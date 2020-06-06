import 'current_season_model.dart';

class Results {
  List<SearchModelResult> searchModelResult;

  Results({this.searchModelResult});

  factory Results.fromMap(Map<String, dynamic> json) {
    return Results(
      searchModelResult: List<SearchModelResult>.from(
        json['results'].map(
          (item) => SearchModelResult.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class SearchModelResult {
  String imageUrl, title, synopsis, startDate, endDate;
  int episodes, malId;
  num score;

  SearchModelResult({
    this.imageUrl,
    this.title,
    this.synopsis,
    this.startDate,
    this.endDate,
    this.episodes,
    this.score,
    this.malId,
  });

  factory SearchModelResult.fromMap(Map<String, dynamic> json) {
    return SearchModelResult(
      malId: json['mal_id'] as int,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      score: json['score'] as num,
      synopsis: json['synopsis'] as String,
    );
  }
}

class SearchList {
  String title, imageUrl, synopsis, type, source, status, duration, trailerUrl;
  int members, episodes, malId, rank, popularity;
  double score;
  List<GenreList> genreList;
  List<Studios> studio;
//  Aired aired;
  List openingThemes;
  List endingThemes;

  SearchList({
    this.title,
    this.imageUrl,
    this.synopsis,
    this.type,
    this.malId,
    this.episodes,
    this.source,
    this.genreList,
    this.studio,
    this.score,
    this.members,
    this.popularity,
    this.rank,
    this.status,
    this.duration,
    this.endingThemes,
    this.openingThemes,
    this.trailerUrl,
  });

  factory SearchList.fromMap(Map<String, dynamic> json) {
    return SearchList(
      malId: json['mal_id'] as int,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      synopsis: json['synopsis'] as String,
      type: json['type'] as String,
      score: json['score'] as double,
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
      studio: List<Studios>.from(
        json['studios'].map(
          (item) => Studios.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
//      aired: json['aired'],
      duration: json['duration'] as String,
      endingThemes: json['ending_themes'] as List<dynamic>,
      openingThemes: json['opening_themes'] as List<dynamic>,
      popularity: json['popularity'] as int,
      rank: json['rank'] as int,
      status: json['status'] as String,
      trailerUrl: json['trailer_url'] as String,
    );
  }
}

class Studios {
  String name;

  Studios({this.name});

  factory Studios.fromMap(Map<String, dynamic> json) {
    return Studios(name: json['name'] as String);
  }
}

class Aired {
  String from, to;

  Aired({this.from, this.to});

  factory Aired.fromMap(Map<String, dynamic> json) {
    return Aired(
      from: json['from'] as String,
      to: json['to'] as String,
    );
  }
}
