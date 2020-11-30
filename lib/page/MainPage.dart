import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/constant/SelfIcon.dart';
import 'package:flutter_app_1/page/TabPage.dart';
import 'package:flutter_app_1/page/home/HomeTabPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.selectIndex}) : super(key: key);
  int selectIndex = 0;

  @override
  State<StatefulWidget> createState() {
    return MainPageState(selectIndex);
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  MainPageState(this._selectIndex) : super();
  int _selectIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController( length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeTabPage(params: 123),
          TabPage(params: 234),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(SelfIcon.job), label: "首页"),
          BottomNavigationBarItem(icon: Icon(SelfIcon.mine), label: "我的"),
        ],
        onTap: (index) {
          _tabController.animateTo(index);
          setState(() {
            _selectIndex = index;
          });
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //     //悬浮按钮
      //     child: Icon(Icons.add),
      //     onPressed: () => {}),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Column buildTabItemColumn() {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(
            'images/pic1.jpg',
            width: 24.0,
            height: 24.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text("首页"),
        )
      ],
    );
  }

  Flex buildFlex() {
    return Flex(
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
