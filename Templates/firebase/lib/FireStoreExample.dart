import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ----------------------------------------------------------
//                      FireStore Stream Example
// ----------------------------------------------------------

class FireStoreExample extends StatelessWidget {
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
          stream: Firestore.instance.collection('Items').snapshots(),
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

      List<DocumentSnapshot> list = [];
      for (DocumentSnapshot document in snapshot.data.documents) {
        list.add(document);
    }
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title:Text(list[index].data['name']),
          subtitle: Text(list[index].data['color']),
          trailing: Text(list[index].data['weight'].toString()),
        );
      },
    );
  }
}
