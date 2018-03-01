import 'package:doughnut/learning/learning.dart';
import 'package:doughnut/search/search.dart';
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
  var idx = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('doughnut'),
        actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.info),
              onPressed: () {
                showDialog<Null>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  child: new AlertDialog(
                    title: new Text('Open Source Licenses'),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          new Text("xml", maxLines: 1000, style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text('The MIT License'),
                          new Text(' '),
                          new Text('Copyright (c) 2006-2017 Lukas Renggli.'),
                          new Text('All rights reserved.'),
                          new Text(' '),
                          new Text('Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:', maxLines: 1000),
                          new Text('The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.', maxLines: 1000),
                          new Text('THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.', maxLines: 1000),
                          new Text(' '),
                          new Text('Reference: https://pub.dartlang.org/packages/xml'),
                          new Text(' '),
                          new Text(' '),
                          new Text(' '),
                          new Text("tts", maxLines: 1000, style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text('unknown (LICENSE)'),
                          new Text(' '),
                          new Text('Reference: https://pub.dartlang.org/packages/tts'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
      ),
      body: idx == 0 ? new Search() : new Learning(),
      /// Prevents software keyboard from appearing over TextField.
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: idx,
        onTap: (int idx) {
          setState(() {
            this.idx = idx;
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('探す'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('学ぶ'),
          ),
        ],
      ),
    );
  }
}
