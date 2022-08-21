import 'package:dio/dio.dart';

import '../../component/constans.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
  }

  static Future<Response> get(
      {required String url,
      required Map<String, dynamic> queryParameters}) async {
    return await dio!.get(url, queryParameters: queryParameters);
  }
}
