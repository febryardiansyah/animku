import 'dart:convert';

import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:http/http.dart';

abstract class CurrentSeasonRepository {
  Future<List<AnimeList>> getSpring2020();
  Future<List<AnimeList>> getWinter2020();
  Future<List<AnimeList>> getSummer2020();
  Future<List<AnimeList>> getFall2020();
}

class CurrSeasonImp implements CurrentSeasonRepository {
  ApiService api = ApiService();

  //fetch spring2020
  @override
  Future<List<AnimeList>> getSpring2020() async {
    final Response response =
        await api.client.get('${api.baseUrl}${EndPointPath.spring2020}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final List<AnimeList> list = CurrentSeasonModel.fromMap(data).animeList;
      return list;
    } else {
      return null;
    }
  }

  //fetch winter2020
  @override
  Future<List<AnimeList>> getWinter2020() async {
    final Response response =
        await api.client.get('${api.baseUrl}${EndPointPath.winter2020}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final List<AnimeList> list = CurrentSeasonModel.fromMap(data).animeList;
      return list;
    } else {
      return null;
    }
  }

  @override
  Future<List<AnimeList>> getSummer2020() async {
    final Response response =
        await api.client.get('${api.baseUrl}${EndPointPath.summer2020}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final List<AnimeList> list = CurrentSeasonModel.fromMap(data).animeList;
      return list;
    } else {
      return null;
    }
  }

  @override
  Future<List<AnimeList>> getFall2020() async {
    final Response response =
        await api.client.get('${api.baseUrl}${EndPointPath.fall2020}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final List<AnimeList> list = CurrentSeasonModel.fromMap(data).animeList;
      return list;
    } else {
      return null;
    }
  }
}
