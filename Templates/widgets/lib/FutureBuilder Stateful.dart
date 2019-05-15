import 'package:flutter/material.dart';

// ----------------------------------------------------------
//                      FutureBuilder
// ----------------------------------------------------------

class FutureStatefulExample extends StatelessWidget {
// Async function
  Future<String> _getFutureVariable() async {
    return new Future.delayed(const Duration(seconds: 5), () => "DelayedData");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getFutureVariable(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text(
                "Probably wont happen because we start the builder with a function");
          case ConnectionState.active: // If the connection is active
          case ConnectionState.waiting:
            return waitingForFuture();
          case ConnectionState.done:
            if (snapshot.hasError) return futureError(snapshot);
            return futureSuccess(snapshot);
        }
      },
    );
  }

  Widget waitingForFuture() {
    return Scaffold(
        appBar: AppBar(title: Text("Please hold on ..")),
        body: Center(child: CircularProgressIndicator()));
  }

  Widget futureError(AsyncSnapshot snapshot) {
    return Center(child: Text('Error: ${snapshot.error}'));
  }

  Widget futureSuccess(AsyncSnapshot snapshot) {
    return StatefulExample();
  }
}

// ----------------------------------------------------------
//                        # Sign in
//           - Get Country and phone number from user
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
            child: Text(_stateBool.toString()),
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
