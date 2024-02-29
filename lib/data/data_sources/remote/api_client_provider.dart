import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiClientProvider {
  final Dio dio;

  ApiClientProvider({required this.dio}) {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      const bearerToken =
          'Bearer ${const String.fromEnvironment('api_key', defaultValue: "test")}';
      options.headers.addAll({"Authorization": bearerToken});
      handler.next(options);
    }, onResponse: (response, handler) {
      handler.next(response);
    }, onError: (error, handler) {
      handler.reject(error);
    }));

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
    ));
  }
}
