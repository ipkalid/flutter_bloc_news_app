import 'package:news/core/data/network/network_error.dart';
import 'package:news/core/data/network/request_type.dart';

import '../api_constant.dart';

class DataRequest {
  String host;
  Iterable<String> defaultPath;
  Iterable<String> path;
  RequestType requestType;
  Map<String, dynamic>? params;
  Map<String, String>? urlParams;
  Map<String, String>? headers;

  DataRequest({
    this.host = APIConstants.host,
    this.defaultPath = APIConstants.defaultPath,
    this.path = const [],
    this.requestType = RequestType.get,
    this.headers = const {"Accept": "application/json"},
    this.urlParams = const {"api-key": "qy6mrHJcleK5sYzGrHXzNQGLzpFGt8qF"},
    this.params,
  });

  Uri get url => _url();

  Uri _url() {
    final Uri url;

    try {
      url = Uri(
        scheme: RequestScheme.https.value,
        host: host,
        pathSegments: defaultPath.followedBy(path),
        queryParameters: urlParams,
      );
    } catch (e) {
      throw InvalidURL();
    }
    return url;
  }

  @override
  String toString() {
    return "API_CALL: [URL: ${url.toString()}, METHOD: ${requestType.value}]";
  }
}
