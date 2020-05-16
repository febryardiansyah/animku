import 'current_season_model.dart';

class Results{
  List<SearchModelResult> searchModelResult;

  Results({this.searchModelResult});

  factory Results.fromMap(Map<String,dynamic>json){
    return Results(
      searchModelResult: List<SearchModelResult>.from(json['results'].map((item) => SearchModelResult.fromMap(item)))
    );
  }


}
class SearchModelResult{
  String imageUrl,title,synopsis,startDate,endDate;
  int episodes,malId;
  var score;

  SearchModelResult({this.imageUrl, this.title, this.synopsis,
      this.startDate, this.endDate, this.episodes,
      this.score,this.malId});

  factory SearchModelResult.fromMap(Map<String,dynamic>json){
    return SearchModelResult(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
      synopsis: json['synopsis']
    );
  }

}
class SearchList{
  String title,imageUrl,synopsis,type,source,status,duration,trailer_url;
  int members,episodes,malId,rank,popularity;
  var score;
  List<GenreList> genreList;
  List<Studios> studio;
//  Aired aired;
  List opening_themes;
  List ending_themes;

  SearchList({this.title, this.imageUrl, this.synopsis, this.type,this.malId,
     this.episodes, this.source, this.genreList, this.studio,this.score,this.members,
    this.popularity,this.rank,this.status,this.duration,this.ending_themes,
    this.opening_themes,this.trailer_url,
  });

  factory SearchList.fromMap(Map<String,dynamic>json){
    return SearchList(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      synopsis: json['synopsis'],
      type: json['type'],
      score: json['score'],
      episodes: json['episodes'],
      members: json['members'],
      genreList: List<GenreList>.from(json['genres'].map((item)=>GenreList.fromMap(item))),
      source: json['source'],
      studio: List<Studios>.from(json['studios'].map((item)=>Studios.fromMap(item))),
//      aired: json['aired'],
      duration: json['duration'],
      ending_themes: json['ending_themes'],
      opening_themes: json['opening_themes'],
      popularity: json['popularity'],
      rank: json['rank'],
      status: json['status'],
      trailer_url: json['trailer_url']
    );
  }
}
class Studios {
  String name;

  Studios({this.name});

  factory Studios.fromMap(Map<String,dynamic>json){
    return Studios(
      name: json['name']
    );
  }
}
class Aired{
  String from,to;

  Aired({this.from, this.to});

  factory Aired.fromMap(Map<String,dynamic>json){
    return Aired(
      from: json['from'],
      to: json['to']
    );
  }

}
