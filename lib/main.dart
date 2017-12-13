import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var idx = 0;
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: idx == 0 ?
      new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _controller,
              // decoration: new InputDecoration(
              //   hintText: 'Type text here',
              // ),
            ),
            new ListTile(
              leading: const Icon(Icons.assignment_ind),
              title: const Text('What is this?'),
              trailing: new IconButton(
                icon: new Icon(Icons.volume_up),
                tooltip: 'Listen to learn!',
                onPressed: () { setState(() { var a = 1.1; }); },
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.assignment_ind),
              title: const Text('How are you?'),
              trailing: new IconButton(
                icon: new Icon(Icons.volume_up),
                tooltip: 'Listen to learn!',
                onPressed: () { setState(() { var a = 1.1; }); },
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.assignment_ind),
              title: const Text('What is your name?'),
              trailing: new IconButton(
                icon: new Icon(Icons.volume_up),
                tooltip: 'Listen to learn!',
                onPressed: () { setState(() { var a = 1.1; }); },
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.assignment_ind),
              title: const Text('My name is Bob Smith.'),
              trailing: new IconButton(
                icon: new Icon(Icons.volume_up),
                tooltip: 'Listen to learn!',
                onPressed: () { setState(() { var a = 1.1; }); },
              ),
            ),
          ],
        )
      :
      new Text("Right"),

      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: idx,
        onTap: (int idx) { setState((){ this.index = idx; }); },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Left"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text("Right"),
          ),
        ],
      ),
      appBar: new AppBar(
        title: new Text('doughnut'),
      ),
      
    );
  }
}
