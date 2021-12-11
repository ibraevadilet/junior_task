import 'package:dio/dio.dart';

class AppExceptions {
  String message;

  AppExceptions({this.message});

  static AppExceptions catchError(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        return AppExceptions(message: "Время ожидания истекло");
      } else if (error.type == DioErrorType.RESPONSE) {
        return AppExceptions(message: "Ошибка в системе");
      }
    } else {
      return AppExceptions(message: "Произошла системная ошибка");
    }
    return AppExceptions(message: "Произошла ошибка сервера");
  }
}
