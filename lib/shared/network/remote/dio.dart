import 'package:dio/dio.dart';
import 'package:driver_app/shared/components/global_variables.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dev.talabatcom.sa/Admin/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String methodUrl,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = headerWithToken;
    return await dio!.get(
      methodUrl,
      queryParameters: query,
    );
  }

  //*****NEW****/
  static Future<Response> postData({
    required String methodUrl,
    Map<String, dynamic>? query,
    required dynamic data,
    String? token,
  }) async {
    dio!.options.headers = headerWithToken;
    return await dio!.post(
      methodUrl,
      queryParameters: query,
      data: data,
    );
  }
}
