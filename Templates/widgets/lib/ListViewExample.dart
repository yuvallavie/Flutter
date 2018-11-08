import 'package:flutter/material.dart';

// Added a package in file "pubspec.yaml" under dependencies called
// random_string, might have to flutter install for everything to work.
import 'package:random_string/random_string.dart';

class TileData {
  String title;
  String subtitle;

  TileData(this.title, this.subtitle);
}

// ----------------------------------------------------------
//                      ListView Template
// ----------------------------------------------------------

class ListViewExample extends StatefulWidget {
  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<TileData> _list;

  @override
  void initState() {
    super.initState();
    _list = [];
  }

  @override
  void didUpdateWidget(ListViewExample oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget listTileWidget(int index) {
    return ListTile(
        title: Text(_list[index].title),
        subtitle: Text(_list[index].subtitle),
        leading: Icon(Icons.arrow_right),
        trailing: Icon(Icons.list),
        onTap: () => print("Clicked on tile: " + index.toString()),
        onLongPress: () => print("Long-Pressed on tile: " + index.toString()));
  }

  Widget listWidget() {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        if (_list.isNotEmpty) return listTileWidget(index);
        return Text("Empty");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ListView Widget")),
        body: listWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          children: <Widget>[
            FloatingActionButton.extended(
              heroTag: null,
              icon: Icon(Icons.add),
              label: Text("ADD"),
              onPressed: () => _handleAddClick(),
            ),
            FloatingActionButton.extended(
              heroTag: null,
              icon: Icon(Icons.remove),
              label: Text("REMOVE"),
              onPressed: () => _handleRemoveClick(),
              backgroundColor: Colors.red,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ));
  }

  void _handleAddClick() {
    setState(() {
      _list.add(new TileData(randomString(20), randomString(10)));
    });
  }

  void _handleRemoveClick() {
    if (_list.isNotEmpty) {
      setState(() {
        _list.removeLast();
      });
    }
  }
}
