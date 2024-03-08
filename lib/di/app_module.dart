import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/data/data_sources/remote/api_interceptors.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FlutterSecureStorage> get secureStorage async =>
      const FlutterSecureStorage();

  @lazySingleton
  Dio get dioClient => Dio()
    ..options.baseUrl = ApiUrl.baseUrl
    ..options.connectTimeout = connectTimeout
    ..options.receiveTimeout = receiveTimeout
    ..options.responseType = ResponseType.json
    ..options.contentType = Headers.formUrlEncodedContentType
    ..interceptors.addAll([authInterceptor, loggingInterceptor]);
}
