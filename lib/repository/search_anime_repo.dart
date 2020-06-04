import 'dart:convert';

import 'package:animku/models/search_model_results.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class SearchAnimeProvider with ChangeNotifier{
  ApiService api = ApiService();

  List<SearchModelResult>_listSearch = [];

  List<SearchModelResult> get listSearch => _listSearch;

  Future<List<SearchModelResult>> getSearchAnime(String param)async{
    final response = await api.client.get('${api.baseUrl}/search/anime?q=$param/Zero&page=1');

    if(response.statusCode == 200){
      notifyListeners();
      var res = json.decode(response.body);
      _listSearch  = Results.fromMap(res).searchModelResult;
      print(_listSearch[0].title);
      return _listSearch;
    }else{
      throw Exception();
    }
  }
}