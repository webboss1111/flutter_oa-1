// 登录页面
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:oa/router.dart';
import 'package:oa/utils/request.dart';
import '../../service/login.dart' show LoginService;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFrom = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
        key: _loginFrom,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: _userNameController,
              decoration: InputDecoration(
                labelText: "学号",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value.length != 10) {
                  return "学号长度不对";
                }
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "密码",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  if (_loginFrom.currentState.validate()) {
                    // print(_userNameController.text+"  "+_passwordController.text);
                    // Response response = LoginService.login(
                    //   _userNameController.text,
                    //   _passwordController.text,
                    // );
                    // if (response.data) {
                      Navigator.push(context, OaRouter.home(context));
                    // }
                  }
                },
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
