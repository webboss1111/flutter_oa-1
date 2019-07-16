import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final String name;
  final double _width = 60;
  HomeDrawer({@required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width / 5.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            decoration: BoxDecoration(color: Colors.lightBlue),
            height: MediaQuery.of(context).size.height / 4.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: _width,
                  height: _width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("lib/asset/logo.jpg"))),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: _width,
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 3 * MediaQuery.of(context).size.height / 4.0,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.build),
                    title: Text('成员管理'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('写汇报'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.check),
                    title: Text('审核汇报'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('反馈'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('吐槽'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.error),
                    title: Text('注销'),
                  ),
                ),
                // Padding(child: Text("data"),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
