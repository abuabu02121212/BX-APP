import 'package:dio/dio.dart';

import '../util/Log.dart';

class DioUtil {
  final dio = Dio();

  DioUtil() {
    init();
  }

  void init() {
    BaseOptions options = dio.options;
    options.baseUrl = 'https://api.pub.dev';
    options.connectTimeout = const Duration(seconds: 10);
    options.receiveTimeout = const Duration(seconds: 10);
  }

  void getSample() async {
    Response response;
    response = await dio.get('https://dart.dev', queryParameters: {'id': 12, 'name': 'dio'});
    Log.d(response.data.toString());
  }

  dynamic get(String url, Map<String, Object> param) async {
    Response response;
    response = await dio.get(url, queryParameters: param);
    Log.d(response.data.toString());
    return response.data;
  }

  dynamic post(String url, Map<String, Object> param) async {
    Response response;
    response = await dio.post(url, queryParameters: param);
    return response.data;
  }
}
