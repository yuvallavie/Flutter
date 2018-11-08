import 'package:flutter/material.dart';


class ReplacedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Replaced Page"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("This page replaced the previous one. going back will return to HOMEPAGE"),
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
    print("Moving to the Named page");
    Navigator.pushNamed(context, 'NamedPage');
  }
}
