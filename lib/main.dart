import 'package:flutter/material.dart';
import 'package:hack19flutter/pages/chat_page.dart';
import 'package:hack19flutter/pages/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Chat Home",),

    );
  }
}


