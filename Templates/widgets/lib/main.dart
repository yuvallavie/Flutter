import 'package:flutter/material.dart';
import './FutureExample.dart';
import './StreamExample.dart';
import './StatefulExample.dart';
import './ListViewExample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialRoute: 'Home',
      routes: {
        'Home': (context) => HomePage(),
        'FutureExample': (context) => FutureExample(),
        'StreamExample': (context) => StreamExample(),
        'StatefulExample': (context) => StatefulExample(),
        'ListViewExample': (context) => ListViewExample(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a widget"),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("FutureBuilder"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'FutureExample'),
                ),
                RaisedButton(
                  child: Text("StreamBuilder"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'StreamExample'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("StatefulWidget"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'StatefulExample'),
                ),
                RaisedButton(
                  child: Text("ListView"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'ListViewExample'),
                )
              ],
            )
          ],
        ));
  }
}
