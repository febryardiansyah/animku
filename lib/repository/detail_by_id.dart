import 'dart:convert';

import 'package:animku/models/search_model_results.dart';
import 'package:animku/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class DetailByIdProvider with ChangeNotifier {
  ApiService api = ApiService();

  SearchList searchListDetail;

  Future<SearchList> getDetailById(int id) async {
    final response = await api.client.get('${api.baseUrl}/anime/$id');

    if (response.statusCode == 200) {
      notifyListeners();
      final Map<String, dynamic> res =
          json.decode(response.body) as Map<String, dynamic>;
      return searchListDetail = SearchList.fromMap(res);
    } else {
      throw Exception();
    }
  }
}
