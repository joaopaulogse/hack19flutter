import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  ChatList({Key key}) : super(key: key);

  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool titleOrSearch;

  List<String> list = [
    "Chat 1",
    "Chat 2",
    "Chat 3",
    "Chat 4",
    "Chat 5",
    "Chat 6",
    "Chat 7",
    "Chat 8",
    "Chat 9",
    "Chat 10"
  ];
  List<String> listFilter = [];
  @override
  void initState() {
    super.initState();
    titleOrSearch = true;
    listFilter = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleOrSearch == true
            ? Text("Chat list")
            : TextField(
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    listFilter = list
                        .where((String text) => text.contains(value))
                        .toList();
                  });
                },
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                titleOrSearch = !titleOrSearch;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          child: ListView.builder(
        itemCount: listFilter.length,
        itemBuilder: (context, index) {
          final item = listFilter[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                listFilter.removeAt(index);
              });

              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("$item deleted")));
            },
            background: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.delete),
                    Icon(Icons.delete),
                  ],
                ),
              ),
            ),
            child: ListTile(
              title: Text("$item"),
              subtitle: Text("Message: help..."),
              onTap: () {
                print("tap");
              },
            ),
          );
        },
      )),
    );
  }
}
