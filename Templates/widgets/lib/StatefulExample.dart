import 'package:flutter/material.dart';

// ----------------------------------------------------------
//                      Stateful Template
// ----------------------------------------------------------

class StatefulExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  bool _stateBool;

  @override
  void initState() {
    super.initState();
    _stateBool = false;
  }

  @override
  void didUpdateWidget(StatefulExample oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stateful Widget")),
        body: Center(
          child: RaisedButton(
            child:Text(_stateBool.toString()),
            onPressed: () => _handleClick(),
          ),
        ));
  }

  void _handleClick() {
    setState(() {
      _stateBool = !_stateBool;
    });
  }
}
