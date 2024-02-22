import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = "";
    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.connectionError:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorDescription =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "Your connection is not secure";
        break;
      case DioExceptionType.unknown:
        errorDescription = "Unexpected error occured";
        break;
    }
    return errorDescription;
  }
}

class AppsError {
  final String field;
  final String value;
  final String reason;

  AppsError(this.field, this.value, this.reason);

  static AppsError fromJson(Map<String, dynamic> json) {
    return AppsError(
      json["field"],
      json["value"],
      json["reason"],
    );
  }
}
