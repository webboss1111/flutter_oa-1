import 'package:dio/dio.dart';

Dio dio = new Dio();
// String url = "https://oa.hfutonline.net";
String baseUrl = "https://easy.wangminwei.top/mock/5cf3a8062d6dcf7d7f2bf6fd/oa";
// String baseUrl = "https://day.wangminwei.top";

getMethod(String router, {params}) async {
  String url = "$baseUrl$router?$params";
  // print(url);
  Response res = await dio.get(url);
  return checkRes(res);
}

postMethod(router, FormData params) async {
  //type 'Future<dynamic>' is not a subtype of type 'Response<dynamic>'
  // you cann't use like "$url$router" because of the above reason
  String url = baseUrl + router;
  Response res = await dio.post(url, data: params);
  return checkRes(res);
}

checkRes(Response res) {
  if (res.data['success']) {
    return res.data['data'];
  }
  return {};
}
