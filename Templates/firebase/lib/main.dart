  import 'package:flutter/material.dart';
import './FireStoreExample.dart';


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
        'FireStoreExample': (context) => FireStoreExample(),
      //  'StreamExample': (context) => StreamExample(),
     //   'StatefulExample': (context) => StatefulExample(),
   //     'ListViewExample': (context) => ListViewExample(),
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
                  child: Text("FireStore"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'FireStoreExample'),
                ),
                RaisedButton(
                  child: Text("StreamBuilder"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'FireStoreExample'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("StatefulWidget"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'FireStoreExample'),
                ),
                RaisedButton(
                  child: Text("ListView"),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'FireStoreExample'),
                )
              ],
            )
          ],
        ));
  }
}