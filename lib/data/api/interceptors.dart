import 'package:dio/dio.dart';
import 'package:flutter_rss/utils/Log.dart';

import 'api_service.dart';
import 'environment.dart';

InterceptorsWrapper requestInterceptor(Dio dio, Environment env) =>
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler requestHandler) {
        final uri = options.uri.toString();

        // TODO: Add any headers needed here

        if (ApiService().isInDebugMode) {
          Log.v("Api - URL: ${uri.toString()}");
          Log.v("Api - headers: ${options.headers}");
          Log.v("Api - Request Body: ${options.data}");
        }
        return requestHandler.next(options);
      },
    );

InterceptorsWrapper responseInterceptor(Dio dio, Environment env) =>
    InterceptorsWrapper(onResponse: (Response<dynamic> response,
        ResponseInterceptorHandler requestHandler) {
      if (ApiService().isInDebugMode) {
        Log.v("Api - Response: ${response.data}");
      }

      return requestHandler.next(response);
    });
