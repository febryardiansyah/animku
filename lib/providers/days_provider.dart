import 'package:animku/environments/end_point_path.dart';
import 'package:animku/models/days_model.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/material.dart';

class DaysProvider extends ChangeNotifier{
  var api = ApiService();
  MondayModel mondayModel;

  Future<MondayModel>getDays()async{
    final response = await api.client.get('${api.baseUrl+EndPointPath.monday}');
    
    if(response.statusCode == 200){
      notifyListeners();
      var res = mondayModelFromJson(response.body);
      mondayModel = res;
      return mondayModel;
    }else{
      return null;
    }
  }
}