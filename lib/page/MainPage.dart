import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.selectIndex}) : super(key: key);
  int selectIndex = 0;

  @override
  State<StatefulWidget> createState() {
    return MainPageState(selectIndex);
  }
}

class MainPageState extends State<MainPage> {
  MainPageState(this._selectIndex) : super();
  int _selectIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 30.0,
              color: Colors.red,
            ),
          ),
          buildBottomNavBar()
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Container(
          height: 70,
          child: Row(
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'images/pic1.jpg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("首页")
                ],
              ),
              SizedBox(), //中间位置空出
              IconButton(icon: Icon(Icons.business)),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: () => {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  buildNavItem({text = 'home', imagePath = 'images/pic1.jpg', index = 0}) {
    var color = Colors.black87;
    var fontSize = 14.0;
    if (_selectIndex == index) {
      color = Colors.blue;
      fontSize = 16.0;
    }
    return Expanded(
        child: FlatButton(
            onPressed: () => {
                  setState(() {
                    _selectIndex = index;
                  })
                },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: color, fontSize: fontSize),
                  ),
                )
              ],
            )));
  }

  buildBottomNavBar() {
    return Container(
      height: 70.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        buildNavItem(text: "职位", index: 0),
        buildNavItem(text: "消息", index: 1),
        buildNavItem(text: "发现", index: 3),
        buildNavItem(text: "我的", index: 4),
      ]),
    );
  }
}
