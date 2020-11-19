import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(color: Colors.white),
    //   child: Center(
    //     child: Text(
    //       'Hello World',
    //       textDirection: TextDirection.ltr,
    //       style: TextStyle(
    //         fontSize: 32,
    //         color: Colors.black87,
    //       ),
    //     ),
    //   ),
    // );
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          "/": (context) => MyHomePage(title: "title==>"),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("here is  title"),
        ),
        body: Center(
          child: buildContainerV2(),
        ));
  }

  Widget buildContainerV1(){
    return Container(color: Colors.yellow);
  }
  Widget buildContainerV2(){
    return Container(width: 100, height: 100, color: Colors.red)
    ;
  }
  Widget buildContainer() {
    var image = Container(
      margin:  EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: Colors.red),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      child: Image.asset('images/pic1.jpg'),
    );
    var imageRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: [image, image],
    );
    var imageColumn = [imageRow, imageRow];
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.yellow),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      child: Column(
        children: imageColumn,
      ),
    );
  }

  Column buildRowColumn() {
    // Navigator.of(context).pushNamed("route")
    var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [row1, row2],
    );
  }

  Row buildRowStar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(
          child: Image.asset('images/pic1.jpg'),
          flex: 2,
        ),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
        Expanded(child: Image.asset('images/pic1.jpg')),
      ],
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Image.asset(name)
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic1.jpg'),
      ],
    );
  }

  Text buildText() => Text('hello world');
}
