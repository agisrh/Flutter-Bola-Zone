// ignore_for_file: constant_identifier_names

import 'connectivity_status.dart';
import 'package:dio/dio.dart';
import 'error_utils.dart';
import '../developer_log.dart';

enum MethodRequest { POST, GET, PUT, DELETE }

class ApiService {
  final Dio _dio = Dio();

  ApiService({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 90),
    Duration? receiveTimeout = const Duration(seconds: 50),
  }) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = connectTimeout;
    _dio.options.receiveTimeout = receiveTimeout;
    _dio.options.headers = {
      'Accept': 'application/json',
    };
    _dio.options.receiveDataWhenStatusError = true;

    //Interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers.addAll(
            {
              if (!options.headers.containsKey("Accept"))
                'Accept': 'application/json',
            },
          );

          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> call(
    String url, {
    MethodRequest method = MethodRequest.POST,
    dynamic request,
    Map<String, String>? header,
    bool useFormData = false,
    bool showLog = false,
  }) async {
    // Check Internet Connection
    bool isOnline = await ConnectivityStatus.hasNetwork();
    if (isOnline != true) {
      Response response = Response(
        data: {
          "message": "You're offline. Check your connection",
        },
        statusCode: 00,
        requestOptions: RequestOptions(path: ''),
      );
      return response;
    }

    // Add header options
    if (header != null) {
      _dio.options.headers = header;
    }

    // Show log
    if (showLog) {
      logSuccess('URL : ${_dio.options.baseUrl}$url');
      logSuccess('Method : $method');
      logSuccess("Header : ${_dio.options.headers}");
      logSuccess("Request : $request");
    }

    try {
      Response response;
      switch (method) {
        case MethodRequest.GET:
          response = await _dio.get(url, queryParameters: request);
          break;
        case MethodRequest.PUT:
          response = await _dio.put(
            url,
            data: useFormData ? FormData.fromMap(request!) : request,
          );
          break;
        case MethodRequest.DELETE:
          response = await _dio.delete(
            url,
            data: useFormData ? FormData.fromMap(request!) : request,
          );
          break;
        default:
          response = await _dio.post(
            url,
            data: useFormData ? FormData.fromMap(request!) : request,
          );
      }
      if (showLog) {
        logSuccess(
            'Response : ${url.contains("rss") ? "rss feed response to long" : response.data}');
      }

      return response;
    } on DioException catch (e) {
      if (showLog) {
        logError('Data: ${e.response?.data}\nError $e');
      }

      if (e.response?.data is Map) {
        if (!(e.response?.data as Map).containsKey("message")) {
          (e.response?.data as Map).addAll(<String, dynamic>{
            "message": DioErrorUtil.handleError(e),
          });
        }

        return e.response!;
      } else {
        Response response = Response(
          data: {
            "message": DioErrorUtil.handleError(e),
          },
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode,
        );
        return response;
      }
    }
  }
}
