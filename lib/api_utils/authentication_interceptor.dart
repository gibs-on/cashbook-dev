import 'dart:async';
import 'dart:collection';

import 'package:chopper/chopper.dart';

class AuthenticationInterceptor implements RequestInterceptor {
  // final String apiKey;
  final String Function() accessTokenProvider;

  AuthenticationInterceptor(/* this.apiKey, */ this.accessTokenProvider);

  @override
  FutureOr<Request> onRequest(Request request) {
    Map<String, String> headers = HashMap.from(request.headers);
    headers['Authorization'] = accessTokenProvider();
    // headers['x-api-key'] = apiKey;
    if (headers['Accept'] == null) {
      headers['Accept'] = 'application/json';
    }
    return request.copyWith(headers: headers);
  }
}
