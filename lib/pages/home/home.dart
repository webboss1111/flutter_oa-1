import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oa/pages/home/drawer/HomeDrawer.dart';
import 'package:oa/pages/member/Member.dart';
import 'package:oa/pages/myself/Myself.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage/HomePage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _lastPressedAt; //上次点击时间
  int _selectIndex = 0;
  String name = "";
  String avatarUrl = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _onTap(int e) {
    setState(() {
      _selectIndex = e;
    });
  }

  _getUser() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    name = user.getString('name');
  }

  List<Widget> pages = [HomePage(), Member(), Myself()];
  final snackbar = SnackBar(
    content: Text("再按一次退出"),
    backgroundColor: Colors.lightBlue,
    duration: Duration(seconds: 1),
  );
  @override
  Widget build(BuildContext context) {
    //获取本地储存的用户信息
    _getUser();
    return MaterialApp(
      title: '工大学子OA系统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: HomeDrawer(
          name: "$name",
        ),
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text(""), Text("OA"), Add()],
        )),
        body: WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              _lastPressedAt = DateTime.now();
              _scaffoldKey.currentState.showSnackBar(snackbar);
              return false;
            }
            return true;
          },
          child: pages[_selectIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('通知'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('成员'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('我的'),
            ),
          ],
        ),
      ),
    );
  }
}

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Listener(
        child: Icon(Icons.add),
        onPointerDown: (e) {},
      ),
    );
  }
}
