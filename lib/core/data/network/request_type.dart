enum RequestType {
  get,
  post,
  put,
  delete;

  String get value => name.toUpperCase();
}

enum RequestScheme {
  https,
  http;

  String get value => name.toUpperCase();
}
