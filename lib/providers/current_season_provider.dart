import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/material.dart';

class CurrentSeasonProvider extends ChangeNotifier{
  var api = ApiService();
  List<CurrentSeasonModel> _winter2020=[];
  List<CurrentSeasonModel> _spring2020 = [];

  List<CurrentSeasonModel> get spring2020 => _spring2020;

  List<CurrentSeasonModel> get winter2020 => _winter2020;

  //fetch getWinter2020
  Future<List<CurrentSeasonModel>>getWinter()async{
    final response = await api.client.get('${api.baseUrl+EndPointPath.winter2020}');

    if(response.statusCode == 200){
      notifyListeners();
      var res = currentSeasonFromJson(response.body);
      _winter2020.add(res);
      return _winter2020;
    }else{
      throw Exception();
    }
  }

  //fetch getSpring2020
  Future<List<CurrentSeasonModel>>getSpring()async{
    final response = await api.client.get('${api.baseUrl+EndPointPath.spring2020}');

    if(response.statusCode == 200){
      notifyListeners();
      var res = currentSeasonFromJson(response.body);
      _spring2020.add(res);
      return _spring2020;
    }else{
      throw Exception();
    }
  }
}