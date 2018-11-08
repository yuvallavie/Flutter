import 'package:flutter/material.dart';


class NamedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Named Page"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("The last page called this page by NAME. it went directly here"),
              RaisedButton(
                child: Text("BACK"),
                onPressed: () => _handleBackClick(context),
              ),
              RaisedButton(
                child: Text("HOME"),
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
    Navigator.pushNamed(context, 'Home');
  }
}
