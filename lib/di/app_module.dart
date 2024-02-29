import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/constants.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dioClient => Dio()
    ..options.baseUrl = ApiUrl.baseUrl
    ..options.connectTimeout = connectTimeout
    ..options.receiveTimeout = receiveTimeout
    ..options.responseType = ResponseType.json
    ..options.contentType = Headers.formUrlEncodedContentType;
}
