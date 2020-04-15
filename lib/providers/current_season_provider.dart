import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/material.dart';

class CurrentSeasonProvider extends ChangeNotifier{
  var api = ApiService();
  CurrentSeasonModel currentSeasonModel;

  Future<CurrentSeasonModel>getCurrentSeason()async{
    final response = await api.client.get('${api.baseUrl+EndPointPath.currentSeason}');

    if(response.statusCode == 200){
      notifyListeners();
      var res = currentSeasonFromJson(response.body);
      currentSeasonModel = res;
      print(currentSeasonModel.animeList[0].title);
      return currentSeasonModel;
    }else{
      return null;
    }
  }
}