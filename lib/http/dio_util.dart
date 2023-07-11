import 'package:dio/dio.dart';

import '../util/Log.dart';

class DioUtil {
  final dio = Dio();
  final String baseUrl;

  DioUtil(this.baseUrl) {
    init();
  }

  void init() {
    BaseOptions options = dio.options;
    options.baseUrl = baseUrl;
    options.connectTimeout = const Duration(seconds: 10);
    options.receiveTimeout = const Duration(seconds: 10);
  }

  void getSample() async {
    Response response;
    response = await dio.get('https://dart.dev', queryParameters: {'id': 12, 'name': 'dio'});
    Log.d(response.data.toString());
  }

  dynamic get(String path, Map<String, Object> param) async {
    Response response;
    response = await dio.get(path, queryParameters: param);
    Log.d("path:${response.requestOptions.uri} param:${response.requestOptions.queryParameters}");
    return response.data;
  }

  dynamic post(String path, Map<String, Object> param) async {
    Response response;
    response = await dio.post(path, queryParameters: param);

    Log.d("path:${response.requestOptions.uri} param:${response.requestOptions.queryParameters}");
    return response.data;
  }
}
