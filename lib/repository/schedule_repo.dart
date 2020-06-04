import 'dart:convert';
import 'dart:io';

import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:http/http.dart' as http;

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
    switch (response.statusCode) {
      case 200:
        final List<AnimeList> res = json.decode(response.body)[name].map(
              (item) => AnimeList.fromMap(
                item as Map<String, dynamic>,
              ),
            ) as List<AnimeList>;
        final List<AnimeList> day = List<AnimeList>.from(res);
        return day;
      case 400:
        throw Exception();
      default:
        throw Exception();
    }
  }

  //get endpoint + object name
  Future<List<AnimeList>> get(String endpoint, String name) async {
    try {
      final url = await api.client.get('${api.baseUrl}$endpoint');
      final List<AnimeList> res = response(url, name);
      return res;
    } on SocketException {
      throw Exception();
    }
  }

  //get sunday
  @override
  Future<List<AnimeList>> getSunday() async {
    final List<AnimeList> res = await get(EndPointPath.sunday, 'sunday');
    return res;
  }

  //get monday
  @override
  Future<List<AnimeList>> getMonday() async {
    final List<AnimeList> res = await get(EndPointPath.monday, 'monday');
    return res;
  }

  @override
  Future<List<AnimeList>> getTuesday() async {
    final List<AnimeList> res = await get(EndPointPath.tuesday, 'tuesday');
    return res;
  }

  @override
  Future<List<AnimeList>> getFriday() async {
    final List<AnimeList> res = await get(EndPointPath.friday, 'friday');
    return res;
  }

  @override
  Future<List<AnimeList>> getSaturday() async {
    final List<AnimeList> res = await get(EndPointPath.saturday, 'saturday');
    return res;
  }

  @override
  Future<List<AnimeList>> getThursday() async {
    final List<AnimeList> res = await get(EndPointPath.thursday, 'thursday');
    return res;
  }

  @override
  Future<List<AnimeList>> getWednesday() async {
    final List<AnimeList> res = await get(EndPointPath.wednesday, 'wednesday');
    return res;
  }
}
