// ignore_for_file: constant_identifier_names

import 'connectivity_status.dart';
import 'package:dio/dio.dart';
import 'error_utils.dart';
import '../developer_log.dart';

enum MethodRequest { POST, GET, PUT, DELETE }

class ApiService {
  final Dio _dio = Dio();

  ApiService(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 90);
    _dio.options.receiveTimeout = const Duration(seconds: 50);
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
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // If a 401 response is received, refresh the access token
            String newAccessToken = "";
            // Update the request header with the new access token
            e.requestOptions.headers = {
              'Accept': 'application/json',
              'Authorization': 'Bearer $newAccessToken'
            };
            return handler.resolve(await _dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> call(
    String url, {
    MethodRequest method = MethodRequest.POST,
    dynamic request,
    Map<String, String>? header,
    String? token,
    bool useFormData = false,
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

    if (header != null) {
      _dio.options.headers = header;
    }
    if (token != null) {
      if (header != null) {
        header.addAll({'Authorization': 'Bearer $token'});
        _dio.options.headers = header;
      } else {
        _dio.options.headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        };
      }
    }

    logSuccess('URL : ${_dio.options.baseUrl}$url');
    logSuccess('Method : $method');
    logSuccess("Header : ${_dio.options.headers}");
    logSuccess("Request : $request");

    MethodRequest? selectedMethod;
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
      logSuccess(
          'Success $selectedMethod $url: \nResponse : ${url.contains("rss") ? "rss feed response to long" : response.data}');
      return response;
    } on DioException catch (e) {
      logError('URL : ${_dio.options.baseUrl}$url');
      logError('Error $selectedMethod $url: $e\nData: ${e.response?.data}');

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
