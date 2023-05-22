import 'dart:developer';

import 'package:news/core/data/network/api_manager.dart';
import 'package:news/core/data/requests/most_popular_requests.dart';
import 'package:news/core/service_locator/service_locator.dart';
import 'package:news/features/news/models/news_model.dart';

class NewsService {
  final _apiManager = locator<APIManager>();

  Future<List<NewsModel>> getNews() async {
    final request = MostPopularRequests.getViewed.request();
    log(request.toString());
    try {
      final Map response = await _apiManager.call(request);
      final List<dynamic> responseList = response["results"];
      final news = responseList.map((e) => NewsModel.fromJson(e)).toList();
      return news;
    } catch (e) {
      rethrow;
    }
  }
}
