import 'package:flutter/material.dart';
import 'package:hack19flutter/model/message.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String user = "JP";

  List<Message> listMock = [
    Message("JP", "blablabla", "12:30"),
    Message("Outro JP", "cccccccccc", "12:32"),
    Message("JP", "blablabla", "12:36"),
    Message("JP", "blablabla", "12:36"),
    Message("Outro JP", "ccccccccc", "12:38"),
    Message("JP", "blablabla", "12:30"),
    Message("Outro JP", "ccccccccc", "12:38"),
    Message("Outro JP", "ccccccccc", "12:38"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
     floatingActionButton: _appBar(),
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

  BottomAppBar _appBar() {
    return BottomAppBar(
        color: Colors.white,
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              padding: EdgeInsets.only(right: 10),
              color: Colors.green,
              onPressed: (){},
            ),
            Flexible(
            child:TextFormField(
              cursorColor:  Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Text'),
            ),
            )
          ],
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
