import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/core/data/network/data_request.dart';
import 'package:news/core/data/network/network_error.dart';
import 'package:news/core/data/network/request_type.dart';

class APIManager {
  int _retryCounter = 0;
  Future<dynamic> call(
    DataRequest request, {
    Object? body,
  }) async {
    try {
      Response httpResponse = await _filterCall(request, body: body);
      // final networkStatus = ref.watch(networkStatusState.notifier);
      // networkStatus.state = NetworkStatus.online;
      if (httpResponse.statusCode < 200 || httpResponse.statusCode >= 300) {
        final statusCode = httpResponse.statusCode;
        final body = json.decode(httpResponse.body);
        throw InvalidServerResponse(statusCode: statusCode, body: body);
      }

      final data = json.decode(httpResponse.body);
      _retryCounter = 0;
      return data;
    } on SocketException catch (e) {
      // final networkStatus = ref.watch(networkStatusState.notifier);
      // if (networkStatus.state != NetworkStatus.hidden) {
      //   networkStatus.state = NetworkStatus.offline;
      // }
      if (_retryCounter > 10) {
        rethrow;
      }
      log(e.toString(), error: e);
      await Future.delayed(const Duration(seconds: 1));
      _retryCounter++;
      log("_retryCounter: ${_retryCounter.toString()}");
      return await call(request, body: body);
    }
  }

  Future<Response> _filterCall(DataRequest request, {Object? body}) async {
    switch (request.requestType) {
      case RequestType.get:
        return http.get(request.url, headers: request.headers);

      case RequestType.post:
        return http.post(request.url, body: jsonEncode(body));

      case RequestType.put:
        return http.post(request.url,
            headers: request.headers, body: jsonEncode(body));

      case RequestType.delete:
        return http.delete(request.url,
            headers: request.headers, body: jsonEncode(body));
    }
  }
}
