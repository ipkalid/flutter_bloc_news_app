import 'package:news/core/data/network/data_request.dart';

enum MostPopularRequests {
  getEmailed,
  getShared,
  getViewed;

  Iterable<String> path() {
    return switch (this) {
      getEmailed => ["emailed", "7.json"],
      getShared => ["shared", "7.json"],
      getViewed => ["viewed", "7.json"]
    };
  }

  DataRequest request() {
    return DataRequest(
      path: path(),
    );
  }
}
