import 'dart:convert';

import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';

abstract class SeasonLaterRepository{
  Future<List<AnimeList>> fetchSeasonLater();
}

class SeasonLaterImplements implements SeasonLaterRepository{
  ApiService api = ApiService();
  @override
  Future<List<AnimeList>> fetchSeasonLater() async{
    final response = await api.client.get('${api.baseUrl+EndPointPath.seasonLater}');
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      List<AnimeList>animeList = CurrentSeasonModel.fromMap(res).animeList;
      print(animeList[0].title);
      return animeList;
    } else{
      throw Exception();
    }
  }
}