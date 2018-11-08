import 'package:flutter/material.dart';

// Import the screen you will move to
import './PushedPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Please use the button below to move to the next screen"),
              RaisedButton(
                child: Text("NEXT"),
                onPressed: () => _handleClick(context),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ));
  }

  void _handleClick(BuildContext context) {
    print("Moving to the next page");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PushedPage()),
    );
  }
}
