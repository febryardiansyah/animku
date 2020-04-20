import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/current_season_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/material.dart';

class CurrentSeasonProvider extends ChangeNotifier {
  var api = ApiService();
  List<CurrentSeasonModel> _currentSeason = [];
  List<CurrentSeasonModel> get currentSeason => _currentSeason;

  //fetch currentSeason
  Future<List<CurrentSeasonModel>> getCurrentSeason(String path) async {
    final response = await api.client.get('${api.baseUrl+path}');

    if (response.statusCode == 200) {
      notifyListeners();
      var res = currentSeasonFromJson(response.body);
      _currentSeason.add(res);
      return _currentSeason;
    } else {
      throw Exception();
    }
  }
}