import 'package:flutter/material.dart';

// ----------------------------------------------------------
//                      StreamBuilder
// ----------------------------------------------------------

class StreamExample extends StatelessWidget {
// Stream
  final Stream<int> counterStream =
      Stream<int>.periodic(Duration(seconds: 1), (x) => x);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stream Builder"),
        ),
        body: StreamBuilder(
          stream: counterStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Wont happen');
              case ConnectionState.waiting:
                return waitingForStream();
              case ConnectionState.active:
                return streamActive(snapshot);
              case ConnectionState.done:
                return Text('\$${snapshot.data} (closed)');
            }
          },
        ));
  }
    Widget waitingForStream() {
    return Center(child: CircularProgressIndicator());
  }

      Widget streamActive(AsyncSnapshot snapshot) {
      return Center(child: Text('Last streamed number is: ' + snapshot.data.toString()));
  }
}
