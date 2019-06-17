
import 'package:dio/dio.dart';
Dio dio = new Dio();
Response response;
// String url = "https://oa.hfutonline.net";
String url = " https://www.easy-mock.com/mock/5cf3a8062d6dcf7d7f2bf6fd/oa";

class Request {
  static getMethod(router, params) async {
    // response = await dio.get("${url + router}?${params}");
    // print("${url + router}?${params}");
    // print(response.data.toString());
  }

  static postMethod(router, FormData params) async {
    // print(params);
    print("${url + router}");
    try {
      response = await dio.post("${url + router}", data: params);
      print(response);
    } catch (e) {
      print(e);
    }
    return response;
  }
}
