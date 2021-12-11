import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'exceptions.dart';

class ApiRequester {
  static String url = "https://bonus.andreyp.ru/api/v1/promos?";

  Future<Dio> initDio() async {
    return Dio(BaseOptions(
      baseUrl: url,
      headers: {
        'Content-Type': 'application/json',
      },
      responseType: ResponseType.json,
      receiveTimeout: 10000,
      connectTimeout: 10000,
    ));
  }

  Future<Response> toGet(dynamic params) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: params);
    } catch (e) {
      throw AppExceptions.catchError(e);
    }
  }
}
