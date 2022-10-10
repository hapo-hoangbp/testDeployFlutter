import 'package:async/async.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class RestApiService {
  final Dio _dio = Dio();

  Future<Result<dynamic>> post(String url, dynamic requestBody, {Options? options}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return Result.error("messageNotInternet");
    } else {
      try {
        final response = await _dio.post(url, data: requestBody, options: options);
        if ((response.statusCode! - 200) < 100) {
          var data = response.data is Map ? response.data : json.decode(response.data);
          return Result.value(data);
        } else {
          return Result.error("");
        }
      } on DioError catch (e) {
        return Result.error("");
      }
    }
  }

  Future<Result<dynamic>> get(String url, {Options? options}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return Result.error("messageNotInternet");
    } else {
      try {
        final response = await _dio.get(url, options: options);
        if ((response.statusCode! - 200) < 100) {
          var data = response.data is Map || response.data is List ? response.data : json.decode(response.data);
          return Result.value(data);
        } else {
          return Result.error("");
        }
      } on DioError catch (e) {
        return Result.error("");
      }
    }
  }
}
