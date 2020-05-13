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
  String title,imageUrl,synopsis,type,source;
  int members,episodes,malId;
  var score;
  List<GenreList> genreList;
  List<Studios> studio;

  SearchList({this.title, this.imageUrl, this.synopsis, this.type,this.malId,
     this.episodes, this.source, this.genreList, this.studio,this.score,this.members});

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
