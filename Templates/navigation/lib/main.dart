import 'package:flutter/material.dart';

// Import the screens to navigate
import 'HomePage.dart';
import 'NamedPage.dart';

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
      home: HomePage(),
      initialRoute: 'Home',
      routes: {
        'Home' : (context) => HomePage(),
        'NamedPage' : (context) => NamedPage()
      },
    );
  }
}
