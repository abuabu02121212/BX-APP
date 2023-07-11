import 'dart:convert';
import 'dart:typed_data';
import 'package:cbor/cbor.dart';
import 'package:dio/dio.dart';
import '../util/Log.dart';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

Uint8List mapToUint8List(Map<String, dynamic> map) {
  // 将 map 转换为 JSON 字符串
  String jsonStr = jsonEncode(map);

  // 创建 ByteData 对象来存储字节数据
  ByteData byteData = ByteData(jsonStr.length);

  // 将字符串中的每个字符转换为字节
  for (int i = 0; i < jsonStr.length; i++) {
    byteData.setUint8(i, jsonStr.codeUnitAt(i));
  }

  // 将 ByteData 转换为 Uint8List
  Uint8List uint8List = byteData.buffer.asUint8List();

  return uint8List;
}

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

  dynamic post(String path, Map<String, dynamic> data) async {
    final cborValue = CborValue(data);
    final cborBuffer = cbor.encode(cborValue);

    // q: arrayBuffer 和 Uint8List 有什么区别？

    Response response;
    print('发送数据 ${cborBuffer.runtimeType}; 数据：$cborBuffer');
    response = await dio.post(path, data: cborBuffer, options: Options(
      responseType: ResponseType.bytes,
      contentType: 'application/x-www-form-urlencoded',
      headers: {
        'd': 35
      }
    ));

    // 将字节数组转换为 ArrayBuffer
    Uint8List byteData = response.data;
    ByteBuffer buffer = byteData.buffer;
    var result = buffer.asUint8List();
    print('接收数据:$result');

    Log.d("path:${response.requestOptions.uri} response:$result，结果:${cbor.decode(result)}");
    Log.d('');
    return response.data;
  }
}
