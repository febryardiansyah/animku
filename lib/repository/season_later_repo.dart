import 'dart:convert';

import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';

abstract class SeasonLaterRepository {
  Future<List<AnimeList>> fetchSeasonLater();
}

class SeasonLaterImplements implements SeasonLaterRepository {
  ApiService api = ApiService();

  @override
  Future<List<AnimeList>> fetchSeasonLater() async {
    final response =
        await api.client.get('${api.baseUrl}${EndPointPath.seasonLater}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> res =
          json.decode(response.body) as Map<String, dynamic>;
      return CurrentSeasonModel.fromMap(res).animeList;
    } else {
      throw Exception();
    }
  }
}
