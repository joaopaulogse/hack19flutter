import 'package:flutter/material.dart';
import 'package:hack19flutter/pages/chat_page.dart';

import 'create_chat.dart';

class ChatList extends StatefulWidget {
  String _name;
  ChatList({Key key, String name})
      : _name = name,
        super(key: key);
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool titleOrSearch;

  List<String> list = [
    "Conversation of all",
    "Power Rangers",
    "The Friendship Ship",
    "The Chamber of Secrets",
    "All the Single Ladies",
    "Core Four",
    "The River Vixens",
    "The Avengers",
    "Organization 13",
    "Team Sev7n",
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
                        .where((String text) =>
                            text.toLowerCase().contains(value.toLowerCase()))
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateChat()));
            },
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

              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item deleted")));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(
                              title: item,
                              keyFire: index.toString(),
                            )));
              },
            ),
          );
        },
      )),
    );
  }
}
