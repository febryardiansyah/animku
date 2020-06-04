import 'dart:convert';
import 'dart:io';

import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:http/http.dart'as http;

abstract class ScheduleRepository{
  Future<List<AnimeList>>getSunday();
  Future<List<AnimeList>>getMonday();
  Future<List<AnimeList>>getTuesday();
  Future<List<AnimeList>>getWednesday();
  Future<List<AnimeList>>getThursday();
  Future<List<AnimeList>>getFriday();
  Future<List<AnimeList>>getSaturday();
}

class ScheduleRepoImplement implements ScheduleRepository{
  ApiService api = ApiService();

  //response from api
  response(http.Response response,name){
   switch(response.statusCode){
     case 200:
       var res = json.decode(response.body)['$name'].map((item) => AnimeList.fromMap(item));
       List<AnimeList>day = List<AnimeList>.from((res));
       return day;
     case 400:
       throw Exception();
     default:
       throw Exception();
   }
  }
  //get endpoint + object name
  get(endpoint,name)async{
    try{
      final url = await api.client.get('${api.baseUrl+endpoint}');
      var res = response(url, name);
      return res;
    }on SocketException{
      throw Exception();
    }
  }

  //get sunday
  @override
  Future<List<AnimeList>> getSunday() async{
    var res = await get(EndPointPath.sunday, 'sunday');
    print(res[0].imageUrl);
    return res;
  }

  //get monday
  @override
  Future<List<AnimeList>> getMonday() async{
    var res = await get(EndPointPath.monday, 'monday');
    print(res[0].imageUrl);
    return res;
  }

  @override
  Future<List<AnimeList>> getTuesday() async {
    var res = await get(EndPointPath.tuesday, 'tuesday');
    print(res[0].imageUrl);
    return res;
  }

  @override
  Future<List<AnimeList>> getFriday() async{
    var res = await get(EndPointPath.friday, 'friday');
    print(res[0].imageUrl);
    return res;
  }

  @override
  Future<List<AnimeList>> getSaturday() async{
    var res = await get(EndPointPath.saturday, 'saturday');
    print(res[0].imageUrl);
    return res;
  }

  @override
  Future<List<AnimeList>> getThursday() async{
    var res = await get(EndPointPath.thursday, 'thursday');
    print(res[0].imageUrl);
    return res;
  }

  @override
  Future<List<AnimeList>> getWednesday() async{
    var res = await get(EndPointPath.wednesday, 'wednesday');
    print(res[0].imageUrl);
    return res;
  }
}