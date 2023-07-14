import 'dart:convert';
import 'dart:typed_data';
import 'package:cbor/cbor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_comm/util/toast_util.dart';
import '../util/Log.dart';
import '../util/sp_util.dart';
import '../util/sp_util_key.dart';

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
  String? loginToken;

  DioUtil(this.baseUrl) {
    init();
  }

  void init() {
    BaseOptions options = dio.options;
    options.baseUrl = baseUrl;
    options.connectTimeout = const Duration(seconds: 10);
    options.receiveTimeout = const Duration(seconds: 10);
    loginToken ??= spUtil.getString(keyLoginToken);
  }

  void getSample() async {
    Response response;
    response = await dio.get('https://dart.dev', queryParameters: {'id': 12, 'name': 'dio'});
    Log.d(response.data.toString());
  }

  Future get(String path, Map<String, Object> param) async {
    Response response;
    loginToken ??= spUtil.getString(keyLoginToken);
    response = await dio.get(path,
        queryParameters: param,
        options: Options(
          responseType: ResponseType.bytes,
          contentType: 'application/x-www-form-urlencoded',
          headers: {'d': 35, 't': loginToken},
        ));
    // 将字节数组转换为 ArrayBuffer
    Uint8List byteData = response.data;
    final responseData = cbor.decode(byteData);
    bool status = (responseData.toJson() as Map<String, dynamic>)['status'];
    dynamic data = (responseData.toJson() as Map<String, dynamic>)['data'];
    // Log.d('\nstatus: ${(responseData.toJson() as Map<String, dynamic>)['status']}');
    // Log.d('\ndata:${(responseData.toJson() as Map<String, dynamic>)['data']}');
    // \n源数据: ${response.data} \n结果:${cbor.decode(byteData)}
    Log.d("\npath:${response.requestOptions.uri} responseData :$responseData \n${'-' * 200}");

    return onRequestFinish(status, data);
  }

  onRequestFinish(bool status, data) {
    if (status == false) {
      Toast.show('$data');
      return data;
    } else {
      return data;
    }
  }

  Future<Object?> post(String path, Map<String, dynamic> d) async {
    final cborValue = CborValue(d);
    final cborBuffer = cbor.encode(cborValue);
    Response response;
    // 将 data 转换成Base64字符串
    String base64Str = base64Encode(cborBuffer);
    Log.d('\n${'-' * 200}\n \n发送数据: cborBuffer:$cborBuffer base64Str:$base64Str');
    loginToken ??= spUtil.getString(keyLoginToken);
    response = await dio.post(path,
        data: base64Str,
        options: Options(
          responseType: ResponseType.bytes,
          contentType: 'application/x-www-form-urlencoded',
          headers: {'d': 35, 't': loginToken},
        ));
    // 将字节数组转换为 ArrayBuffer
    Uint8List byteData = response.data;
    final responseData = cbor.decode(byteData);
    bool status = (responseData.toJson() as Map<String, dynamic>)['status'];
    dynamic data = (responseData.toJson() as Map<String, dynamic>)['data'];
    //  Log.d('\nstatus: ${(responseData.toJson() as Map<String, dynamic>)['status']}');
    //  Log.d('\ndata:${(responseData.toJson() as Map<String, dynamic>)['data']}');
    // 源数据: ${response.data}
    Map<String, List<String>> headerMap = response.headers.map;
    List<String>? ids = headerMap['id'];
    String id = "";
    if (ids != null) {
      id = ids[0];
      bool isOk = await spUtil.setString(keyLoginToken, id);
      loginToken = id;
      Log.e("$path 保存登陆toKen:$id 到本地是否成功：$isOk");
    }
    Log.d("header map:$headerMap");
    Log.d("path:${response.requestOptions.uri}  请求参数:$d 返回:${responseData.toJson()}\n${'-' * 200}");
    return onRequestFinish(status, data);
  }
}
