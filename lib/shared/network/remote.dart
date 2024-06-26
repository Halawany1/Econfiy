
import 'package:dio/dio.dart';
import 'package:econfiy/shared/constant/api.dart';
import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/network/local.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print('----------> $token');
    dio!.options.headers = {
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    return await dio!.get(url,
        queryParameters: query);
  }

  static Future<Response> postData(
      {required url,
        Map<String, dynamic>? data,
        String? token}) async {
    dio!.options.headers = {
      'Accept': 'application/json',
       if (token != null) 'Authorization': 'Bearer $token',
    };
    return await dio!.post(url, data: data);
  }

  static Future<Response> putData(
      {required url,
        required Map<String, dynamic> data,
        String? token}) async {
    dio!.options.headers = {
      'Accept': 'application/json',
       if (token != null) 'Authorization': 'Bearer $token',
    };
    return await dio!.put(url, data: data);
  }

  static Future<Response> patchData({
    required url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
       if (token != null) 'Authorization': 'Bearer $token',
    };
    return await dio!.patch(url,data: data);
  }


  static Future<Response> deleteData({
    required url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
       if (token != null) 'Authorization': 'Bearer $token',
    };
    return await dio!.delete(url,queryParameters: query);
  }

}