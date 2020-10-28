import 'package:flutter/material.dart';
import 'package:flutter_pager_indicator/custom_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  List<Widget> pages = [
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.cyanAccent,
    ),
    Container(
      color: Colors.deepOrangeAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.limeAccent,
    ),
  ];

  double curPagePos;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        curPagePos = _controller.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pager Indicator")),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: pages,
          ),
          Text(curPagePos.toString()),
          Center(
            child: CustomPaint(
              size: Size.fromWidth(100),
              painter: CustomIndicator(pages.length, curPagePos),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
