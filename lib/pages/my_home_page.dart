import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // body: SafeArea(
      //   child: Container(
      //     margin: EdgeInsets.all(20.0),
      //     child: Form(
      //       key: _formKey,
      //       child: Column(
      //         children: [
      //           Container(margin: EdgeInsets.only(top: 80.0),),
      //           imageScreen(),
      //           nameInput(),
      //           // buttonActions(),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Container(margin: EdgeInsets.only(top: 80.0),),
            imageScreen(),
            nameInput(),
          ],
        ),
      ),
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
          return 'Name canot be empty';
        }
      },
    );
  }

  Widget imageScreen(){
    return Image.asset('images/flutter.png');
  }

  // Widget buttonActions() {
  //   return new Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: <Widget>[
  //       FlatButton.icon(
  //         color: Colors.blueAccent,
  //         icon: Icon(Icons.add),
  //         label: Text(''),
  //         onPressed: () => print('click!'),
  //       ),
  //       FlatButton.icon(
  //         color: Colors.red,
  //         icon: Icon(Icons.search),
  //         label: Text(''),
  //         onPressed: () => print('click!'),
  //       )
  //     ],
  //   );
  // }
}