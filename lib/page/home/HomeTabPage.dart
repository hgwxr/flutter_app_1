import 'package:flutter/material.dart';
import 'package:flutter_app_1/constant/SelfIcon.dart';

class HomeTabPage extends StatefulWidget {
  // TabPage({Key key, this.params}) :super(key: key)
  HomeTabPage({Key key,this.params}):super(key: key);
  int params;
  // final String params;

  @override
  _HomeTabPageState createState() => new _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; //是否保存状态

  int _indexCount = 0;

  void _addCount() {
    setState(() {
      _indexCount ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = widget.params;
    return Scaffold(
      appBar: AppBar(title: Text("appbar"),),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCount, tooltip: '点击相加',
        child: Icon(Icons.add, color: Colors.white,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("这是界面$t", style:  TextStyle(fontSize: 16.0,color: Colors.blueAccent)),
            Icon(SelfIcon.mine),
            Text('$_indexCount', style:  TextStyle(fontSize: 16.0,color: Colors.blueAccent))
          ],
        ),
      ),
    );
  }
}