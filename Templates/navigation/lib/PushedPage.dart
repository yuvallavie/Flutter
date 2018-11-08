import 'package:flutter/material.dart';


// Import the replaced page
import './ReplacedPage.dart';

class PushedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pushed Page"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("BACK -> Last screen, NEXT -> Replaces with a new screen"),
              RaisedButton(
                child: Text("BACK"),
                onPressed: () => _handleBackClick(context),
              ),
              RaisedButton(
                child: Text("NEXT"),
                onPressed: () => _handleNextClick(context),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ));
  }

  void _handleBackClick(BuildContext context) {
    print("Moving to the last page");
    Navigator.pop(context);
  }

  void _handleNextClick(BuildContext context) {
    print("Moving to the Replaced page");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ReplacedPage()),
    );
  }
}
