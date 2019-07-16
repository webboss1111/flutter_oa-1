import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../utils/request.dart' ;
import 'package:shared_preferences/shared_preferences.dart';
login(String name, String pwd) async {
  var bytes = utf8.encode(pwd);
  var password = md5.convert(bytes);
  FormData formData = new FormData.from({
    "username": name,
    "password": password.toString(),
  });
  var response = await postMethod('/api/login', formData);
  // 储存本地用户信息
  SharedPreferences user  =await SharedPreferences.getInstance();

  await user.setString('stuid', response['stuid']);
  await user.setString('name', response['name']);
  return response;
}
getUser() async {
  return await getMethod('/api/getUserByStuid');
}
