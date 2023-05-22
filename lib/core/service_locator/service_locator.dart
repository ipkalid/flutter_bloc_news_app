import 'package:get_it/get_it.dart';
import 'package:news/core/data/network/api_manager.dart';
import 'package:news/features/news/services/news_service.dart';

final locator = GetIt.I;
void setUpServiceLocator() {
  locator.registerSingleton<APIManager>(APIManager());
  locator.registerSingleton<NewsService>(NewsService());
}
