import 'dart:convert';

import 'package:animku/models/search_model_results.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class SearchAnimeProvider with ChangeNotifier {
  ApiService api = ApiService();

  List<SearchModelResult> _listSearch = [];

  List<SearchModelResult> get listSearch => _listSearch;

  Future<List<SearchModelResult>> getSearchAnime(String param) async {
    final response = await api.client
        .get('${api.baseUrl}/search/anime?q=$param/Zero&page=1');

    if (response.statusCode == 200) {
      notifyListeners();
      final Map<String, dynamic> res =
          json.decode(response.body) as Map<String, dynamic>;
      return _listSearch = Results.fromMap(res).searchModelResult;
    } else {
      throw Exception();
    }
  }
}
