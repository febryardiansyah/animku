import 'dart:convert';

MondayModel mondayModelFromJson(String res) =>
    MondayModel.fromMap(json.decode(res));

TuesdayModel tuesdayModelFromJson(String res) =>
    TuesdayModel.fromMap(json.decode(res));

WednesdayModel wednesdayModelFromJson(String res) =>
    WednesdayModel.fromMap(json.decode(res));

ThursdayModel thursdayModelFromJson(String res) =>
    ThursdayModel.fromMap(json.decode(res));

FridayModel fridayModelFromJson(String res) =>
    FridayModel.fromMap(json.decode(res));

SaturdayModel saturdayModelFromJson(String res) =>
    SaturdayModel.fromMap(json.decode(res));

SundayModel sundayModelFromJson(String res) =>
    SundayModel.fromMap(json.decode(res));

class MondayModel {
  List<Day> day;

  MondayModel({this.day});

  factory MondayModel.fromMap(Map<String, dynamic> json) {
    return MondayModel(
      day: List<Day>.from(json['monday'].map((item) => Day.fromMap(item))),
    );
  }
}

class TuesdayModel {
  List<Day> day;

  TuesdayModel({this.day});

  factory TuesdayModel.fromMap(Map<String, dynamic> json) {
    return TuesdayModel(
      day: List<Day>.from(json['tuesday'].map((item) => Day.fromMap(item))),
    );
  }
}

class WednesdayModel {
  List<Day> day;

  WednesdayModel({this.day});

  factory WednesdayModel.fromMap(Map<String, dynamic> json) {
    return WednesdayModel(
      day: List<Day>.from(json['wednesday'].map((item) => Day.fromMap(item))),
    );
  }
}

class ThursdayModel {
  List<Day> day;

  ThursdayModel({this.day});

  factory ThursdayModel.fromMap(Map<String, dynamic> json) {
    return ThursdayModel(
      day: List<Day>.from(json['thursday'].map((item) => Day.fromMap(item))),
    );
  }
}

class FridayModel {
  List<Day> day;

  FridayModel({this.day});

  factory FridayModel.fromMap(Map<String, dynamic> json) {
    return FridayModel(
      day: List<Day>.from(json['friday'].map((item) => Day.fromMap(item))),
    );
  }
}

class SaturdayModel {
  List<Day> day;

  SaturdayModel({this.day});

  factory SaturdayModel.fromMap(Map<String, dynamic> json) {
    return SaturdayModel(
      day: List<Day>.from(json['saturday'].map((item) => Day.fromMap(item))),
    );
  }
}

class SundayModel {
  List<Day> day;

  SundayModel({this.day});

  factory SundayModel.fromMap(Map<String, dynamic> json) {
    return SundayModel(
      day: List<Day>.from(json['sunday'].map((item) => Day.fromMap(item))),
    );
  }
}

class Day {
  String title, imageUrl, synopsis, type, airingStart, source;
  int members, score, episodes;
  List<GenreList> genreList;
  List<Producers> producers;

  Day(
      {this.title,
      this.imageUrl,
      this.synopsis,
      this.type,
      this.airingStart,
      this.episodes,
      this.source,
      this.genreList,
      this.producers,
      this.score,
      this.members});

  factory Day.fromMap(Map<String, dynamic> json) {
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

  factory GenreList.fromMap(Map<String, dynamic> json) {
    return GenreList(
      name: json['name'],
    );
  }
}

class Producers {
  String name;

  Producers({this.name});

  factory Producers.fromMap(Map<String, dynamic> json) {
    return Producers(name: json['name']);
  }
}
