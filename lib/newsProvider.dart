import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:headlines/newsModel.dart';
import 'package:http/http.dart' as http;

class NewsProvider with ChangeNotifier {
  Future<NewsModel> fetchCoin() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-08-11&sortBy=publishedAt&apiKey=30a9cb04f1ce4bfbbe10d795c25c26e6'));

    if (response.statusCode == 200) {
      Map<String, dynamic>? values = null;
      values = json.decode(response.body);

      NewsModel newsModel = NewsModel.fromJson(values!);
      return newsModel;
    } else {
      throw Exception('API Access Denied use new Api');
    }
  }



  Future<NewsModel> get newsproviddfher {
    return fetchCoin() ;
  }
}
