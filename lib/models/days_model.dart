

class MondayModel {
  List<Day>day;

  MondayModel({this.day});

  factory MondayModel.fromMap(Map<String,dynamic>json){
   return MondayModel(
    day: List<Day>.from(json['monday'].map((item)=>Day.fromMap(item))),
   );

  }
}
class TuesdayModel {
  List<Day>day;

  TuesdayModel({this.day});

  factory TuesdayModel.fromMap(Map<String,dynamic>json){
    return TuesdayModel(
      day: List<Day>.from(json['tuesday'].map((item)=>Day.fromMap(item))),
    );

  }
}

class Day {
  String title, imageUrl, synopsis, type,
      airingStart, source;
  int members, score, episodes;
  List<GenreList> genreList;
  List<Producers> producers;

  Day({this.title, this.imageUrl, this.synopsis, this.type,
    this.airingStart, this.episodes, this.source, this.genreList, this.producers, this.score, this.members});

  factory Day.fromMap(Map<String, dynamic>json){
    return Day(
      title: json['title'],
      imageUrl: json['image_url'],
      synopsis: json['synopsis'],
      type: json['type'],
      airingStart: json['airing_start'],
      episodes: json['episodes'],
      members: json['members'],
      genreList: List<GenreList>.from(
          json['genres'].map((item) => GenreList.fromMap(item))),
      source: json['source'],
      producers: List<Producers>.from(
          json['producers'].map((item) => Producers.fromMap(item))),
    );
  }
}

class GenreList {
  String name;

  GenreList({this.name});

  factory GenreList.fromMap(Map<String, dynamic>json){
    return GenreList(
      name: json['name'],
    );
  }
}

class Producers {
  String name;

  Producers({this.name});

  factory Producers.fromMap(Map<String, dynamic>json){
    return Producers(
        name: json['name']
    );
  }
}