import 'dart:convert';
import 'dart:typed_data';
import 'package:cbor/cbor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_comm/util/toast_util.dart';
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

  Future get(String path, Map<String, Object> param) async {
    Response response;
    response = await dio.get(path, queryParameters: param);
    Log.d("path:${response.requestOptions.uri} param:${response.requestOptions.queryParameters}");
    return response.data;
  }

  Future<Object?> post(String path, Map<String, dynamic> d) async {
    final cborValue = CborValue(d);
    final cborBuffer = cbor.encode(cborValue);
    Response response;
    // 将 data 转换成Base64字符串
    String base64Str = base64Encode(cborBuffer);
    Log.d('\n${'-'*200}\n源数据:$d\n发送数据: cborBuffer:$cborBuffer base64Str:$base64Str');
    response = await dio.post(path, data: base64Str, options: Options(
      responseType: ResponseType.bytes,
      contentType: 'application/x-www-form-urlencoded',
      headers: {
        'd': 35
      }
    ));
    // 将字节数组转换为 ArrayBuffer
    Uint8List byteData = response.data;
    final responseData = cbor.decode(byteData);
    bool status = (responseData.toJson() as Map<String, dynamic>)['status'];
    dynamic data = (responseData.toJson() as Map<String, dynamic>)['data'];
    Log.d('\nstatus: ${(responseData.toJson() as Map<String, dynamic>)['status']}');
    Log.d('\ndata:${(responseData.toJson() as Map<String, dynamic>)['data']}');
    Log.d("\npath:${response.requestOptions.uri}\n源数据: ${response.data}\n结果:${cbor.decode(byteData)}\n${'-'*200}");

    if (status == false) {
      Toast.show('$data');
      return null;
    } else {
      return data;
    }
  }
}
