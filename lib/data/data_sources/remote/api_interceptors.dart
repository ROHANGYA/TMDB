import 'package:dio/dio.dart';

final authInterceptor = InterceptorsWrapper(onRequest: (options, handler) {
  const bearerToken =
      'Bearer ${const String.fromEnvironment('api_key', defaultValue: "test")}';
  options.headers.addAll({"Authorization": bearerToken});
  handler.next(options);
}, onResponse: (response, handler) {
  handler.next(response);
}, onError: (error, handler) {
  handler.reject(error);
});

final loggingInterceptor = LogInterceptor(
  request: true,
  requestHeader: true,
  requestBody: true,
  responseHeader: true,
  responseBody: true,
);
