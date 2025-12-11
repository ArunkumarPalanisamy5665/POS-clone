import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      log('═══════════════════════════════════════════════════════════════ REQUEST ═══════════════════════════════════════════════════════════════');
      log('Method: ${options.method}');
      log('URL: ${options.uri}');
      log('Headers: ${options.headers}');
      log('Query Parameters: ${options.queryParameters}');
      if (options.data != null) {
        log('Body: ${options.data}');
      }
      log('Timeout: ${options.connectTimeout}');
      log('════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log('═══════════════════════════════════════════════════════════════ RESPONSE ═══════════════════════════════════════════════════════════════');
      log('URL: ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}');
      log('Status Message: ${response.statusMessage}');
      log('Response Data: ${response.data}');
      log('════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log('═══════════════════════════════════════════════════════════════  ERROR  ═══════════════════════════════════════════════════════════════ ');

      log('URL: ${err.response?.statusCode} ${err.response?.requestOptions.method} ${err.response?.requestOptions.uri}');
      log('Error Message: ${err.message}');
      log('Response Data: ${err.response?.data}');
      log('Exception: ${err.error}');
      log('════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════');

    }
    super.onError(err, handler);
  }
}