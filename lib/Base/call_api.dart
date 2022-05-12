import 'dart:io';
import 'package:dio/dio.dart';
import '../Models/custom_dio_logger.dart';
import '../Models/rest_client.dart';
import 'app_config.dart';

class CallApi {
  static RestClient getRestClient(
      {bool hasToken = true, bool showError = true}) {
    final dio = Dio();
    if (hasToken) {
      dio.options.headers[HttpHeaders.authorizationHeader] =
          "Bearer " + AppConfig.tokenStringKey;
    }
    dio.options.connectTimeout = 30000;
    dio.interceptors.add(CustomDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        showError: showError));

    return RestClient(dio);
  }
}
