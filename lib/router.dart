import 'package:flutter/material.dart';
import 'package:oa/pages/home/home.dart';

class OaRouter {
  static MaterialPageRoute home(context) {
    return MaterialPageRoute(builder: (context) {
      return Home();
    });
  }
}
