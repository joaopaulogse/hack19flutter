import 'package:flutter/material.dart';
import 'package:hack19flutter/pages/chat_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  ScrollController _scroll = new ScrollController();

  var name = '';

  void dispose(){
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              controller: _scroll,
              children: [
                imageScreen(),
                nameInput(),
                buttonActions(),
              ],
            ),
          ),
        )
      )
    );
  }

  Widget nameInput() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Tony Stark',
        labelText: 'Insert name'
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Name can't be empty";
        }
      },
      onSaved: (String value) => name = value
    );
  }

  Widget imageScreen(){
    return Image.asset(
      'images/flutter.png',
      height: 120.0,
      width: 120.0,
    );
  }

  Widget buttonActions() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton.icon(
          color: Colors.blueAccent,
          icon: Icon(Icons.send),
          label: Text(''),
          onPressed: () {
            var currentForm = _formKey.currentState;

            if(currentForm.validate()){
              currentForm.save();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatList()),
              );
            }
          },
        )
      ],
    );
  }
}