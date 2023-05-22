import 'package:news/core/data/network/data_request.dart';

enum BooksRequests {
  getEmailed,
  getShared,
  getViewed;

  Iterable<String> path() {
    return switch (this) {
      getEmailed => ["emailed", "7"],
      getShared => ["shared", "7"],
      getViewed => ["viewed", "7"]
    };
  }

  DataRequest request() {
    return DataRequest(
      path: path(),
    );
  }
}
