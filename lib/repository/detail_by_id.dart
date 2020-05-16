import 'dart:convert';

import 'package:animku/models/search_model_results.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class DetailByIdProvider with ChangeNotifier{
  ApiService api = ApiService();

  SearchList searchListDetail;
  Future<SearchList>getDetailById(int id)async{
    final response = await api.client.get('${api.baseUrl}/anime/${id}');

    if(response.statusCode == 200){
      notifyListeners();
      var res = json.decode(response.body);
      searchListDetail = SearchList.fromMap(res);
      print(searchListDetail.malId);
      return searchListDetail;
    }else{
      throw Exception();
    }
  }
}