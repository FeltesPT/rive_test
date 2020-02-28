import "package:flutter/material.dart";

import "package:flare_flutter/flare_actor.dart";
import "package:flare_flutter/flare_cache_builder.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<String> _animations = [
    "Demo Mode",
    "Sun Rotate",
    "to 3",
    "to 4",
    "to 5",
    "to 6"
  ];
  int _index = 0;
  String _asset = "assets/ResizingHouse.flr";

  void _changeAnimation() {
    setState(() {
      _index++;
      if (_index >= _animations.length) {
        _index = 0;
      }
      print(_animations[_index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlareCacheBuilder(
          [_asset],
          builder: (BuildContext context, bool isWarm) {
            return !isWarm
                ? Container(child: Text("NO"))
                : FlareActor(
                    _asset,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: _animations[_index],
                  );
            ;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeAnimation,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
