import 'package:flutter/material.dart';
import '../../service/announce.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () => {print("object")},
        ),
        body: ExpandList());
  }
}

class ExpandList extends StatefulWidget {
  ExpandList({Key key}) : super(key: key);
  _ExpandListState createState() => _ExpandListState();
}

class _ExpandListState extends State<ExpandList> {
  List expansionPanelList = [];
  int _currentIndex = -1;
  //多选专用状态数组
  List<bool> expansionPanelState = [];
  getAnnounce() async {
    expansionPanelList = await announce();
    if (expansionPanelList.length > 0) {
      //初始化状态数组
      expansionPanelState.length = expansionPanelList.length;
      expansionPanelState.fillRange(0, expansionPanelList.length, false);
      setState(() {
        expansionPanelList = expansionPanelList;
        expansionPanelState = expansionPanelState;
      });
    }
  }

  @override
  void initState() {
    getAnnounce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //支持多选
    return ListView.builder(
      itemCount: expansionPanelList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
              height: 10.0,
            ),
            ExpansionPanelList(
              expansionCallback: (int i, bool isExpanded) {
                setState(() {
                  expansionPanelState[index] = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            expansionPanelList[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Text(expansionPanelList[index]['content']),
                  ),
                  isExpanded: expansionPanelState[index],
                )
              ],
            )
          ],
        );
      },
    );
    /** 单选功能
    return ListView.builder(
      itemCount: expansionPanelList.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionPanelList(
          expansionCallback: (int i, bool j) {
            setState(() {
              if (_currentIndex != index) {
                _currentIndex = index;
              } else {
                _currentIndex = -1;
              }
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(expansionPanelList[index]['title']),
                );
              },
              body: Text(expansionPanelList[index]['content']),
              isExpanded: _currentIndex == index,
            )
          ],
        );
      },
    );
    */
    /** 放弃  鸡肋的写法 
    return Container(
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            
          },
          children: expansionPanelList.map((item) {
            // print(item);
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item['title']),
                );
              },
              body: Text(item['content']),
              isExpanded: ,
            );
          }).toList(),
        ),
      ),
    );
    */
  }
}
