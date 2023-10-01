import 'package:dio/dio.dart';

import '../../../core/enums.dart';
import '../local_database/secure_cache.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://codingarabic.online/api',
        receiveDataWhenStatusError: true,
        // headers: {
        //   "Content-Type":"application/json"
        // },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    token = await FlutterSecureStorageCache.read(key: MySharedKeys.token);
    //FlutterSecureStorageCache.read(key:  MySharedKeys.token).then((value) => token=value);
    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> PostData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    token = await FlutterSecureStorageCache.read(key: MySharedKeys.token);

    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> PutData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    token = await FlutterSecureStorageCache.read(key: MySharedKeys.token);

    dio.options.headers = {
      "Content-Type": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.put(url, data: data, queryParameters: query);
  }

  static Future<Response> DeleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    token = await FlutterSecureStorageCache.read(key: MySharedKeys.token);

    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.delete(url, data: data, queryParameters: query);
  }
}
