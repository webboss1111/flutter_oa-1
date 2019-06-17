import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../utils/request.dart' show Request;

class LoginService {
  static login(String name, String pwd) {
    var bytes = utf8.encode(pwd);
    var password = md5.convert(bytes);
    FormData formData = new FormData.from({
      "username": name,
      "password": password.toString(),
    });
    Response response = Request.postMethod('/api/login', formData);
    return response;
  }
}
