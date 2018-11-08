import 'package:flutter/material.dart';

// ----------------------------------------------------------
//                      FutureBuilder
// ----------------------------------------------------------

class FutureExample extends StatelessWidget {
// Async function
  Future<String> _getFutureVariable() async {
    return new Future.delayed(const Duration(seconds: 5), () => "DelayedData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
        ),
        body: FutureBuilder(
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
        ));
  }

  Widget waitingForFuture() {
    return Center(child: CircularProgressIndicator());
  }
  Widget futureError(AsyncSnapshot snapshot) {
    return Center(child: Text('Error: ${snapshot.error}'));
  }

    Widget futureSuccess(AsyncSnapshot snapshot) {
    return Center(child: Text('Result: ${snapshot.data}'));
  }

}
