import 'package:flutter/material.dart';
import './pages/login/login.dart' show Login;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '工大学子OA系统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '工大学子办公系统'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final int durationTime = 1;
  // DateTime _lastPressedAt; //上次点击时间
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final snackbar = SnackBar(
  //   content: Text("再按一次退出"),
  //   backgroundColor: Colors.lightBlue,
  //   duration: Duration(seconds: 1),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/asset/login-bg.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Login(),
      ),
    );
  }
}
