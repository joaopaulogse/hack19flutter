import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hack19flutter/model/message.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title, this.keyFire}) : super(key: key);
  final String title;
  final String keyFire;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String user = "JP";

  List<Message> listMock = [
    Message("JP", "Olá", "12:30"),
    Message("James", "Oi", "12:32"),
    Message("JP", "Tudo bem?", "12:36"),
    Message("JP", "...", "12:36"),
    Message("James", "sim", "12:38"),
    Message("JP", "vai pro hack19?", "12:30"),
    Message("James", "sim e contigo?", "12:38"),
    Message("James", "sim irei", "12:38"),
  ];
  final _messageController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    // databaseReference.child("rooms/${widget.keyFire}/messages").once().then((DataSnapshot snapshot) {
    //   // listMock.add(Message(s))
    //   print(Map.from(snapshot.value));
    //   var a = Map.fromEntries(snapshot.value);
    //   print(a);
    //   print(snapshot.value);
    // });
    // print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
      floatingActionButton: _appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //bottomNavigationBar: _appBar(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(20),
      child: _listView(listMock),
    );
  }

  Widget _appBar(context) {
    return Container(
      color: Colors.black,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.translate),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.translate),
                            title: Text('Brazil'),
                            onTap: () {
                              setState(() {
                                listMock = [
                                  Message("JP", "Olá", "12:30"),
                                  Message("James", "Oi", "12:32"),
                                  Message("JP", "Tudo bem?", "12:36"),
                                  Message("JP", "...", "12:36"),
                                  Message("James", "sim", "12:38"),
                                  Message("JP", "vai pro hack19?", "12:30"),
                                  Message("James", "sim e contigo?", "12:38"),
                                  Message("James", "sim irei", "12:38"),
                                ];
                              });
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.translate),
                            title: Text('France'),
                            onTap: () {
                              setState(() {
                                listMock = [
                                  Message("JP", "Bonjour", "12:30"),
                                  Message("James", "Bonjour", "12:32"),
                                  Message("JP", "Ça va?", "12:36"),
                                  Message("JP", "...", "12:36"),
                                  Message("James", "oui", "12:38"),
                                  Message("JP", "Pro hack19?", "12:30"),
                                  Message("James", "Oui et avec toi?", "12:38"),
                                  Message("James", "oui je le ferai", "12:38"),
                                ];
                              });
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.translate),
                            title: Text('USA'),
                            onTap: () {
                              setState(() {
                                listMock = [
                                  Message("JP", "Hello", "12:30"),
                                  Message("James", "Hi", "12:32"),
                                  Message("JP", "Okay?", "12:36"),
                                  Message("JP", "...", "12:36"),
                                  Message("James", "yes", "12:38"),
                                  Message("JP", "pro hack19?", "12:30"),
                                  Message(
                                      "James", "yes and with you?", "12:38"),
                                  Message("James", "I will go", "12:38"),
                                ];
                              });
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
            border: InputBorder.none,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () async {
                // await databaseReference
                //     .child("rooms/${widget.keyFire}/messages")
                //     .push()
                //     .set({
                //   "name": user,
                //   "message": {"pt": _messageController.text}
                // });
                setState((){
                  listMock.add(Message("JP", _messageController.text, "12:38"));
                });
                _messageController.text = '';
              },
            ),
            hintText: 'Text'),
        controller: _messageController,
      ),
    );
  }

  ListView _listView(List<Message> msgList) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 70),
        itemCount: msgList.length,
        itemBuilder: (context, i) {
          final Message msg = msgList[i];
          return _msgListItem(msg, _isMyMsg(msg.sender));
        });
  }

  Widget _msgListItem(Message message, bool isMyMsg) {
    return Column(
        crossAxisAlignment:
            isMyMsg ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          _senderMsg(message.sender),
          _bodyMsg(message.bodyMsg),
          _timeMsg(message.time),
        ]);
  }

  bool _isMyMsg(String user) {
    return user == this.user;
  }

  Widget _senderMsg(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _bodyMsg(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    );
  }

  Widget _timeMsg(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

_showModal(BuildContext context) {}
