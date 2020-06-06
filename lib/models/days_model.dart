import 'dart:convert';

import 'package:animku/models/current_season_model.dart';

ScheduleModel scheduleModelFromJson(String res) =>
    json.decode(res) as ScheduleModel;

class ScheduleModel {
  MondayModel mondayModel;
  TuesdayModel tuesdayModel;
  WednesdayModel wednesdayModel;
  FridayModel fridayModel;
  SaturdayModel saturdayModel;
  SundayModel sundayModel;

  ScheduleModel({
    this.mondayModel,
    this.tuesdayModel,
    this.wednesdayModel,
    this.fridayModel,
    this.saturdayModel,
    this.sundayModel,
  });

  factory ScheduleModel.fromMap(Map<String, dynamic> json) {
    return ScheduleModel(
      mondayModel: json['monday'] as MondayModel,
      tuesdayModel: json['tuesday'] as TuesdayModel,
      wednesdayModel: json['wednesday'] as WednesdayModel,
      fridayModel: json['friday'] as FridayModel,
      saturdayModel: json['saturday'] as SaturdayModel,
      sundayModel: json['sunday'] as SundayModel,
    );
  }
}

class MondayModel {
  List<AnimeList> day;

  MondayModel({this.day});

  factory MondayModel.fromMap(Map<String, dynamic> json) {
    return MondayModel(
      day: List<AnimeList>.from(
        json['monday'].map(
          (item) => AnimeList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class TuesdayModel {
  List<AnimeList> day;

  TuesdayModel({this.day});

  factory TuesdayModel.fromMap(Map<String, dynamic> json) {
    return TuesdayModel(
      day: List<AnimeList>.from(
        json['tuesday'].map(
          (item) => AnimeList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class WednesdayModel {
  List<AnimeList> day;

  WednesdayModel({this.day});

  factory WednesdayModel.fromMap(Map<String, dynamic> json) {
    return WednesdayModel(
      day: List<AnimeList>.from(
        json['wednesday'].map(
          (item) => AnimeList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class ThursdayModel {
  List<AnimeList> day;

  ThursdayModel({this.day});

  factory ThursdayModel.fromMap(Map<String, dynamic> json) {
    return ThursdayModel(
      day: List<AnimeList>.from(
        json['thursday'].map(
          (item) => AnimeList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class FridayModel {
  List<AnimeList> day;

  FridayModel({this.day});

  factory FridayModel.fromMap(Map<String, dynamic> json) {
    return FridayModel(
      day: List<AnimeList>.from(
        json['friday'].map(
          (Map<String, dynamic> item) => AnimeList.fromMap(item),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class SaturdayModel {
  List<AnimeList> day;

  SaturdayModel({this.day});

  factory SaturdayModel.fromMap(Map<String, dynamic> json) {
    return SaturdayModel(
      day: List<AnimeList>.from(
        json['saturday'].map(
          (item) => AnimeList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}

class SundayModel {
  List<AnimeList> day;

  SundayModel({this.day});

  factory SundayModel.fromMap(Map<String, dynamic> json) {
    return SundayModel(
      day: List<AnimeList>.from(
        json['sunday'].map(
          (item) => AnimeList.fromMap(
            item as Map<String, dynamic>,
          ),
        ) as Iterable<dynamic>,
      ),
    );
  }
}
