import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';


class CreateChat extends StatefulWidget {
  CreateChat({Key key}) : super(key: key);

  _CreateChatState createState() => _CreateChatState();
}

class _CreateChatState extends State<CreateChat> {
  GlobalKey _formKey = GlobalKey<FormState>();
  final _nameChatController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Create Chat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            tooltip: "add",
            onPressed: () {
              _scaffoldKey.currentState.showSnackBar(
                  SnackBar(content: Text("Added")));
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      hintText: "My Chat for example...", labelText: "Name"),
                  controller: _nameChatController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
