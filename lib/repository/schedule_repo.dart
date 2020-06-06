import 'dart:convert';
import 'dart:io';

import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class ScheduleRepository {
  Future<List<AnimeList>> getSunday();
  Future<List<AnimeList>> getMonday();
  Future<List<AnimeList>> getTuesday();
  Future<List<AnimeList>> getWednesday();
  Future<List<AnimeList>> getThursday();
  Future<List<AnimeList>> getFriday();
  Future<List<AnimeList>> getSaturday();
}

class ScheduleRepoImplement implements ScheduleRepository {
  ApiService api = ApiService();

  //response from api
  List<AnimeList> response(http.Response response, String name) {
    print('${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        final List<Map<String, dynamic>> dayObj = json
            .decode(response.body)[name]
            .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;

        final List<AnimeList> animeList = <AnimeList>[];
        for (final Map<String, dynamic> anime in dayObj) {
          animeList.add(AnimeList.fromMap(anime));
        }
        return animeList;
      case 400:
        throw Exception();
      default:
        throw Exception('${response.statusCode}');
    }
  }

  //get endpoint + object name
  Future<List<AnimeList>> getResponse(String endpoint, String name) async {
    try {
      print('${api.baseUrl}$endpoint');
      final Response url = await api.client.get('${api.baseUrl}$endpoint');
      final List<AnimeList> res = response(url, name);

      return res;
    } on SocketException {
      throw Exception();
    }
  }

  //get sunday
  @override
  Future<List<AnimeList>> getSunday() async {
    final List<AnimeList> res =
        await getResponse(EndPointPath.sunday, 'sunday');
    return res;
  }

  //get monday
  @override
  Future<List<AnimeList>> getMonday() async {
    final List<AnimeList> res =
        await getResponse(EndPointPath.monday, 'monday');
    return res;
  }

  @override
  Future<List<AnimeList>> getTuesday() async {
    final List<AnimeList> res =
        await getResponse(EndPointPath.tuesday, 'tuesday');
    return res;
  }

  @override
  Future<List<AnimeList>> getFriday() async {
    final List<AnimeList> res =
        await getResponse(EndPointPath.friday, 'friday');
    return res;
  }

  @override
  Future<List<AnimeList>> getSaturday() async {
    final List<AnimeList> res =
        await getResponse(EndPointPath.saturday, 'saturday');
    return res;
  }

  @override
  Future<List<AnimeList>> getThursday() async {
    final List<AnimeList> res =
        await getResponse(EndPointPath.thursday, 'thursday');
    return res;
  }

  @override
  Future<List<AnimeList>> getWednesday() async {
    final List<AnimeList> res =
        await getResponse(EndPointPath.wednesday, 'wednesday');
    return res;
  }
}
